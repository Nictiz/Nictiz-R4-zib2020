import os
import os.path
import re
import requests
import urllib.parse
from mitmproxy import ctx, http
import xml.etree.ElementTree as ET

""" 
An HTTP proxy that combines the capabilities of the default FHIR terminology server (fhir.tx.org) and the Nationale
Terminologieserver (terminologieserver.nl).

The proxy is an addon for MITMProxy. It can be invoked using the `-s CombinedTX.py` flag in one of the commands.

When running, the proxy listens to calls on http://v4.combined.tx/. All other requests will be passed on as-is.

The Nationale Terminologieserver requires an account with proper permissions. The username and password should be set
in the environment variables NTS_USER and NTS_PASS, or using the special POST request on /resetNTSCredentials with a
body containing "user" and "pass".
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

    PATH_RESET_NTS_CREDENTIALS = "/resetNTSCredentials"
    
    FHIR_NAMESPACE = {"f": "http://hl7.org/fhir"}

    def __init__(self):
        # We keep a list of CodeSystems which both servers support so we can route the call to the proper server
        self.codesystems_dtx = set()
        self.codesystems_nts = set()

        self._support_nts = True
        self._nts_user = None
        self._nts_pass = None
        if "NTS_USER" in os.environ and "NTS_PASS" in os.environ:
            self._nts_user = os.environ["NTS_USER"]
            self._nts_pass = os.environ["NTS_PASS"]
        
        # Cache the token for calls to the NTS
        self._nts_token = None

        # The path where we can find our fixtures
        self._fixture_path = os.path.join(os.path.dirname(__file__), "fixtures")

    def request(self, flow):
        if flow.request.pretty_host in [self.PROXY_HOSTNAME_V3, self.PROXY_HOSTNAME_V4]:
            fhir_version = 4 if flow.request.pretty_host == self.PROXY_HOSTNAME_V4 else 3

            if flow.request.path.endswith(self.PATH_VALIDATE):
                # If the system being validated is not present on the NTS but only on the default TX, route the request 
                # to the default TX
                tree = ET.fromstring(flow.request.content.decode("UTF-8"))
                system = (
                    tree.findall("./f:parameter/f:name[@value='coding']../f:valueCoding/f:system", self.FHIR_NAMESPACE) +
                    tree.findall("./f:parameter/f:name[@value='codeableConcept']../f:valueCodeableConcept/f:coding/f:system", self.FHIR_NAMESPACE) 
                )[0].attrib["value"]
                
                if len(self.codesystems_dtx) == 0:
                    refreshed = self._refreshCodeSystems(fhir_version)
                    if refreshed != True:
                        flow.response = refreshed
                        return

                if system not in self.codesystems_nts and system in self.codesystems_dtx:
                    ctx.log.info(f"Rerouting request for system '{system}' to default TX")
                    flow.request.host = self.DTX_HOSTNAME
                    flow.request.path = (self.DTX_PATH_V3 if fhir_version == 3 else self.DTX_PATH_V4) + flow.request.path
                    return
                    
            elif flow.request.path == "/" and flow.request.method == "POST":
                # The assumption here is that a POST only happens for batch validation.

                tree = ET.fromstring(flow.request.content.decode("UTF-8"))
                systems = set(sys.attrib["value"] for sys in tree.findall(".//f:parameter/f:name[@value='coding']../f:valueCoding/f:system", self.FHIR_NAMESPACE))

                systems_in_nts = [] if not self._support_nts else [system in self.codesystems_nts for system in systems]
                systems_in_dtx = [system in self.codesystems_dtx for system in systems]

                # There is only a weak handling of multiple different code systems in the same request here, because
                # I think batch validation only happens per code system.  
                if sum(systems_in_nts) == 0:
                    ctx.log.info(f"Rerouting request for systems '{systems}' to default TX")
                    flow.request.host = self.DTX_HOSTNAME
                    flow.request.path = (self.DTX_PATH_V3 if fhir_version == 3 else self.DTX_PATH_V4) + flow.request.path
                    return
                elif sum(systems_in_nts) != len(systems_in_nts):
                    operation_outcome = open(os.path.join(self._fixture_path, "OperationOutcome.xml")).read()
                    operation_outcome = operation_outcome\
                        .replace("<code/>", "<code>not-supported</code>")\
                        .replace("<severity/>", "<severity>error</severity>")\
                        .replace("<diagnostics/>", "<diagnostics>A batch operation was made where different systems are supported by different back-ends. This is not supported.</diagnostics>")

                    flow.response = http.HTTPResponse.make(404, operation_outcome.encode("UTF-8"), {"Content-Type": "application/fhir+xml"})
                    return
                
            elif flow.request.path == self.PATH_METADATA_SUMMARY:
                flow.response = self._getMetadataSummary(fhir_version)
                return
            elif flow.request.path == self.PATH_METADATA_TERMINOLOGY:
                flow.response = self._getMetadataTerminology(flow, fhir_version)
                return
            elif flow.request.path == self.PATH_RESET_NTS_CREDENTIALS:
                # Special method for resetting NTS credentials. Payload should be application/x-www-form-urlencoded
                # with keys "user" and "pass".
                try:
                    content = urllib.parse.parse_qs(flow.request.content.decode("UTF-8"))
                    self._nts_user = content["user"][0]
                    self._nts_pass = content["pass"][0]
                    self._support_nts = True
                    ctx.log.info("Ready to re-try the Nationale Terminologieserver credentials")
                except KeyError:
                    ctx.log.info("Couldn't parse the payload for NTS credentials")
                flow.response = http.HTTPResponse.make(200)
                return

            # By default, route the request to the NTS
            response = self._makeNTSRequest(flow.request.path, fhir_version, body = flow.request.content)
            if response != False:
                if response.status_code == requests.codes.ok:
                    flow.response = http.HTTPResponse.make(200, response.content, {"Content-Type": "application/fhir+xml"})
                else:
                    headers = [(key.encode("UTF-8"), response.headers[key].encode("UTF-8")) for key in response.headers]
                    flow.response = http.HTTPResponse.make(response.status_code, response.content, headers)
                flow.response.headers["TX-Origin"] = self.NTS_HOSTNAME
                return
            
            # Default to a false result
            fixture = open(os.path.join(self._fixture_path, "Parameters-false.xml")).read()
            flow.response = http.HTTPResponse.make(200, fixture, {"Content-Type": "application/fhir+xml"})
    
    def response(self, flow):
        if "TX-Origin" in flow.response.headers and flow.response.headers["TX-Origin"] == self.NTS_HOSTNAME:
            # If the NTS fails to validate a code but the CodeSystem is supported by the default tx server, we can try 
            # again to see if it will validate there. Note that this doesn't work for batched requests.
            if flow.response.status_code == 200 and flow.request.path.endswith(self.PATH_VALIDATE):

                tree = ET.fromstring(flow.response.content.decode("UTF-8"))

                # The result of the operation                
                result = tree.findall("./f:parameter/f:name[@value='result']../f:valueBoolean", self.FHIR_NAMESPACE)[0].attrib["value"]
                
                # If the display is deemed incorrect, the result is still true but a message will be appended, which 
                # we'll have to analyze
                invalid_display = False
                for message in tree.findall("./f:parameter/f:name[@value='message']../f:valueString", self.FHIR_NAMESPACE):
                    match = re.match('The code ([\\w-]+) exists in the CodeSystem, but the display "(.*)" is incorrect', message.attrib["value"])
                    if match:
                        invalid_display = True
                        ctx.log.info((f"Retrying display check for code {match.group(1)} (display; '{match.group(2)}') to default TX"))
                        break

                if result == "false" or invalid_display:
                    # Send a request to the default TX
                    headers = {
                        "Content-Type": "application/fhir+xml; fhirVersion=4.0",
                        "Accept": "application/fhir+xml; fhirVersion=4.0"
                    }
                    response = requests.post(self.DTX_HOST + self.DTX_PATH_V4 + flow.request.path, headers = headers, data = flow.request.content)

                    if response != False and response.status_code == requests.codes.ok:
                        # The result of the operation                
                        tree = ET.fromstring(response.content.decode("UTF-8"))
                        result = tree.findall("./f:parameter/f:name[@value='result']../f:valueBoolean", self.FHIR_NAMESPACE)[0].attrib["value"]
                        if result == "true":
                            flow.response.content = response.content
                            flow.response.headers["TX-Origin"] = self.DTX_HOST

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
            .replace("<code/>", f'<code value="{code}"/>')\
            .replace("<severity/>", f'<severity value="{severity}"/>')\
            .replace("<diagnostics/>", f'<diagnostics value="{diagnostics}"/>')

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

        if self._nts_user == None or self._nts_pass == None:
            self._support_nts = False
            ctx.log.info("No credentials for the Nationale Terminologieserver")
            print("\033[1;31mNo credentials for the Nationale Terminologieserver, only the default terminology server will be used\033[0m")
            return

        headers = {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        }
        body = {
            "username"     : self._nts_user,
            "password"     : self._nts_pass,
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
            print("\033[1;31mNo NTS authorization. Disabling further requests to the Nationale Terminologieserver.\033[0m")
            ctx.log.info("No NTS authorization. Disabling further requests to the Nationale Terminologieserver.")
            self._nts_token = None
            self._support_nts = False

addons = [CombinedTX()]