import os
import os.path
import re
import requests
from mitmproxy import ctx, http
import xml.etree.ElementTree as ET

""" 
An HTTP proxy that combines the capabilities of the default FHIR terminology server (fhir.tx.org) and the Nationale
Terminologieserver (terminologieserver.nl).

The proxy is an addon for MITMProxy. It can be invoked using the `-s CombinedTX.py` flag in one of the commands.

The Nationale Terminologieserver requires an account with proper permissions. The username and password should be set
in the environment variables NTS_USER and NTS_PASS.
"""
class CombinedTX:
    PROXY_HOSTNAME    = "combined.tx"
    PROXY_HOSTNAME_V3 = "v3." + PROXY_HOSTNAME
    PROXY_HOSTNAME_V4 = "v4." + PROXY_HOSTNAME

    NTS_HOSTNAME = "terminologieserver.nl"
    NTS_PATH     = "/fhir"
    NTS_SCHEME   = "https://"
    NTS_HOST     = NTS_SCHEME + NTS_HOSTNAME + NTS_PATH

    DTX_HOSTNAME = "tx.fhir.org"
    DTX_PATH_V3  = "/r3"
    DTX_PATH_V4  = "/r4"
    DTX_SCHEME   = "http://"
    DTX_HOST     = DTX_SCHEME + DTX_HOSTNAME

    PATH_METADATA_SUMMARY     = "/metadata?_summary=true"
    PATH_METADATA_TERMINOLOGY = "/metadata?mode=terminology"
    PATH_VALIDATE             = "/$validate-code"

    FHIR_NAMESPACE = {"f": "http://hl7.org/fhir"}

    def __init__(self):
        # We keep a list of CodeSystems which both servers support so we can route the call to the proper server
        self.codesystems_dtx = set()
        self.codesystems_nts = set()

        try:
            os.environ["NTS_USER"]
            os.environ["NTS_PASS"]
            self._support_nts = True
        except:
            print("Environment variables NTS_USER and NTS_PASS are not set. Disabling support for the Nationale Terminologieserver")
            ctx.log.info("Environment variables NTS_USER and NTS_PASS are not set. Disabling support for the Nationale Terminologieserver")
            self._support_nts = False

        # Cache the token for calls to the NTS
        self._nts_token = None

        # The path where we can find our fixtures
        self._fixture_path = os.path.join(os.path.dirname(__file__), "fixtures")

    def request(self, flow):
        if flow.request.pretty_host in [self.PROXY_HOSTNAME_V3, self.PROXY_HOSTNAME_V4]:
            fhir_version = 4 if flow.request.pretty_host == self.PROXY_HOSTNAME_V4 else 3

            if flow.request.path.endswith(self.PATH_VALIDATE):
                # If the system being validated is not present on the default TX but only on the NTS, route the request 
                # to the NTS
                tree = ET.fromstring(flow.request.content.decode("UTF-8"))
                system = tree.findall("./f:parameter/f:name[@value='coding']../f:valueCoding/f:system", self.FHIR_NAMESPACE)[0].attrib["value"]
                
                if len(self.codesystems_dtx) == 0:
                    refreshed = self._refreshCodeSystems(fhir_version)
                    if refreshed != True:
                        flow.response = refreshed
                        return

                if system not in self.codesystems_dtx and system in self.codesystems_nts:
                    ctx.log.info(f"Rerouting request for system '{system}' to NTS")
                    headers = {
                        "Content-Type": f"application/fhir+xml; fhirVersion={fhir_version}.0",
                        "Accept": f"application/fhir+xml; fhirVersion={fhir_version}.0"
                    }
                    response = self._makeNTSRequest(flow.request.path, fhir_version, body = flow.request.content)
                    if response.status_code == requests.codes.ok:
                        flow.response = http.HTTPResponse.make(200, response.content, {"Content-Type": "application/fhir+xml"})
                        flow.response.headers["TX-Origin"] = self.NTS_HOSTNAME
                        return
                    else:
                        flow.response = self._createFailureResponse(400, "Couldn't validate code on " + self.NTS_HOSTNAME)
                        return
                    return
            elif flow.request.path == self.PATH_METADATA_SUMMARY:
                flow.response = self._getMetadataSummary(fhir_version)
                return
            elif flow.request.path == self.PATH_METADATA_TERMINOLOGY:
                flow.response = self._getMetadataTerminology(flow, fhir_version)
                return

            # By default, route the request to the default TX server
            flow.request.host = self.DTX_HOSTNAME
            flow.request.path = (self.DTX_PATH_V3 if fhir_version == 3 else self.DTX_PATH_V4) + flow.request.path
    
    def response(self, flow):
        if flow.request.pretty_host == self.DTX_HOSTNAME:
            tx_origin = self.DTX_HOST

            # If the default server fails to validate a code but the CodeSystem is supported by the NTS, we can try 
            # again to see if it will validate there.
            if flow.response.status_code == 200 and flow.request.path.endswith(self.PATH_VALIDATE):

                tree = ET.fromstring(flow.response.content.decode("UTF-8"))

                # The result of the operation                
                result = tree.findall("./f:parameter/f:name[@value='result']../f:valueBoolean", self.FHIR_NAMESPACE)[0].attrib["value"]
                
                # If the display is deemed incorrect, the result is still true but a message will be appended, which 
                # we'll have to analyze 
                invalid_display = False
                for message in tree.findall("./f:parameter/f:name[@value='message']../f:valueString", self.FHIR_NAMESPACE):
                    if re.match('The display ".*" is not a valid display for the code', message.attrib["value"]):
                        invalid_display = True
                        break

                if result == "false" or invalid_display:
                    # Send a request to the NTS
                    fhir_version = 4 if flow.request.path.startswith(self.DTX_PATH_V4) else 3
                    if fhir_version == 3:
                        path = flow.request.path.replace(self.DTX_PATH_V3, "")
                    else:
                        path = flow.request.path.replace(self.DTX_PATH_V4, "")
                    response = self._makeNTSRequest(path, fhir_version, body = flow.request.content.decode("UTF-8"))
                    if response != False and response.status_code == requests.codes.ok:
                        flow.response.content = response.content
                        tx_origin = self.NTS_HOST
            
            # Add a header to identify the actual origin of the tx server
            flow.response.headers["TX-Origin"] = tx_origin

    def _getMetadataSummary(self, fhir_version):
        """ Return a response to /metadata?_summary=true """
        if fhir_version == 3:
            fixture = open(os.path.join(self._fixture_path, "CapabilityStatement-v3.xml")).read()
        elif fhir_version == 4:
            fixture = open(os.path.join(self._fixture_path, "CapabilityStatement-v4.xml")).read()
        return http.HTTPResponse.make(200, fixture, {"Content-Type": "application/fhir+xml"})

    def _refreshCodeSystems(self, fhir_version):
        ctx.log.info("Refreshing list of code systems")

        # Request all known CodeSystems from the NTS. The CapabilityStatement of the NTS is broken, so we have to query
        # the CodeSystems directly
        response = self._makeNTSRequest("/CodeSystem", fhir_version, accept_json = True)
        if response == False:
            self._codesystems_nts = set()
        elif response.status_code == requests.codes.ok:
            json = response.json()
            self.codesystems_nts = set([e["resource"]["url"] for e in json["entry"] if e["resource"]["resourceType"] == "CodeSystem"])
        else:
            return self._createFailureResponse(400, "Couldn't get CodeSystems from NTS")

        # Request all known CodeSystems on the default tx
        headers = {"Accept": "application/fhir+json; fhirVersion=4.0"}
        response = requests.get(self.DTX_HOST + self.DTX_PATH_V4 + self.PATH_METADATA_TERMINOLOGY, headers = headers)
        if response.status_code == requests.codes.ok:
            json = response.json()
            self.codesystems_dtx = set([c["uri"] for c in json["codeSystem"]])
        else:
            return self._createFailureResponse(400, "Couldn't get CodeSystems from the default tx server")

        return True

    def _getMetadataTerminology(self, flow, fhir_version):
        """ Create a response to /metadata?terminology=true, with a combined TerminologyCapabilities/Parameters
            instance for the default FHIR tx and the NTS. """

        if len(self.codesystems_dtx) == 0 or len(self.codesystems_nts) == 0:
            refreshed = self._refreshCodeSystems(fhir_version)
            if refreshed != True:
                return refreshed

        if fhir_version == 3:
            ctx.log.info("Creating combined Parameters to provide terminology capabilities")
            fixture = open(os.path.join(self._fixture_path, "Parameters-terminology_capabilities.xml")).read()
            fixture = fixture.replace("<parameter/>", '<parameter><name value="system"/><valueUri value="' + '"/></parameter><parameter><name value="system"/><valueUri value="'.join(self.codesystems_nts.union(self.codesystems_dtx)) + '"/></parameter>')
            return http.HTTPResponse.make(200, fixture.encode("UTF-8"), {"Content-Type": "application/fhir+xml"})
        elif fhir_version == 4:
            # Create a TerminologyCapabilities instance with the CodeSystems
            ctx.log.info("Creating combined TerminologyCapabilities")
            fixture = open(os.path.join(self._fixture_path, "TerminologyCapabilities.xml")).read()
            fixture = fixture.replace("<codeSystem/>", '<codeSystem><uri value="' + '"/></codeSystem><codeSystem><uri value="'.join(self.codesystems_nts.union(self.codesystems_dtx)) + '"/></codeSystem>')
            return http.HTTPResponse.make(200, fixture.encode("UTF-8"), {"Content-Type": "application/fhir+xml"})

    def _createFailureResponse(self, response_code, diagnostics, code = "processing", severity = "fatal"):
        """ Create a FHIR style failure response using an OperationOutcome. """
        operation_outcome = open(os.path.join(self._fixture_path, "OperationOutcome.xml")).read()
        operation_outcome = operation_outcome\
            .replace("<code/>", f"<code>{code}</code>")\
            .replace("<severity/>", f"<severity>{severity}</severity>")\
            .replace("<diagnostics/>", f"<diagnostics>{diagnostics}</diagnostics>")

        return http.HTTPResponse.make(response_code, operation_outcome.encode("UTF-8"), {"Content-Type": "application/fhir+xml"})

    def _makeNTSRequest(self, path, fhir_version, body = None, accept_json = False):
        """ Make a request to the NTS, using the proper authorization.
            Return the response as a requests object, or False if the NTS cannot be used. """

        if not self._support_nts:
            return False

        headers = {}
        if accept_json:
            headers["Accept"] = f"application/fhir+json; fhirVersion={fhir_version}.0"
        else:
            headers["Accept"] = f"application/fhir+xml; fhirVersion={fhir_version}.0"
        if body:
            headers["Content-Type"] = f"application/fhir+xml; fhirVersion={fhir_version}.0"

        def request():
            headers["Authorization"] = "Bearer " + self._nts_token
            if body:
                return requests.post(self.NTS_HOST + path, headers = headers, data = body)
            else:
                return requests.get(self.NTS_HOST + path, headers = headers)

        if not self._nts_token:
            # No NTS token yet, let's get one
            self._refreshNTSToken()

        if self._nts_token:
            response = request()
            if response.status_code == 403:
                # NTS token is not valid. Let's try it again with a new one (just once so we don't get into an infinite loop).
                self._refreshNTSToken()
                response = request()
            return response

        return False

    def _refreshNTSToken(self):
        """ Retrieve an access token to perform NTS operations and set it to self._nts_token. If no valid token can be
            retrieved, self._support_nts is set to False and further requests always return immediately. """

        try:
            _nts_user = os.environ["NTS_USER"]
            _nts_pass = os.environ["NTS_PASS"]
        except:
            self._support_nts = False
            ctx.log.info("Environment variables NTS_USER and NTS_PASS should be set to support the Nationale Terminologieserver")
            return

        headers = {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        }
        body = {
            "username"     : _nts_user,
            "password"     : _nts_pass,
            "client_id"    : "cli_client",
            "client_secret": "",
            "grant_type"   : "password"
        }
        response = requests.post(self.NTS_SCHEME + self.NTS_HOSTNAME + "/auth/realms/nictiz/protocol/openid-connect/token",
            headers = headers, data = body)
        if response.status_code == requests.codes.ok:
            ctx.log.info("Retrieved an NTS access token")
            self._nts_token = response.json()["access_token"]
        else:
            print("No NTS authorization. Disabling further requests to the Nationale Terminologieserver.")
            ctx.log.info("No NTS authorization. Disabling further requests to the Nationale Terminologieserver.")
            self._nts_token = None
            self._support_nts = False

addons = [CombinedTX()]