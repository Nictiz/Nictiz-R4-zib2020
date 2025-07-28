Extension: ExtSOAPReportSOAPLineCode
Id: ext-SOAPReport.SOAPLineCode
Title: "ext SOAPReport.SOAPLineCode"
Context: Observation
* insert ProfileMetadata(ext-SOAPReport.SOAPLineCode)

* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.6.1--20200901000000 (preferred)
* value[x].coding from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.6.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "An extension to provide the SOAPLine code. The extension can be seen as an addition to the SOAPLineHeader and SOAPLineText concept mapped to the code and text element."
* value[x]
  * ^short = "SOAPLineCode"
  * ^alias[+] = "SOEPRegelCode"
  * ^definition = """
    Coded values can be added to a line that describe essential aspects of the line.
    In a SOAP report an ICPC code may be assigned, but only to the S and A line.
    """

Mapping: ExtSOAPReportSOAPLineCode-to-zib-soapreport-v1.0-2020EN
Id: zib-soapreport-v1.0-2020EN
Title: "zib SOAPReport-v1.0(2020EN)"
Source: ExtSOAPReportSOAPLineCode
Target: "https://zibs.nl/wiki/SOAPReport-v1.0(2020EN)"
* value[x] -> "NL-CM:13.6.5" "SOAPLineCode"
