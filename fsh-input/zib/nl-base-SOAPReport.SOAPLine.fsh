Profile: NlbaseSOAPReportSOAPLine
Parent: Observation
Id: nl-base-SOAPReport.SOAPLine
Title: "nl base SOAPReport.SOAPLine"
* insert ProfileMetadata(nl-base-SOAPReport.SOAPLine)
* ^purpose = "This Observation resource represents the SOAPLine concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) SOAPReport v1.0 (2020)](https://zibs.nl/wiki/SOAPReport-v1.0(2020EN))."

* . obeys zib-SOAPReport-1
* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-SOAPReport.SOAPLineCode named soapLineCode 0..*
* extension[soapLineCode] ^condition[+] = zib-SOAPReport-1
* extension[soapLineCode].value[x] ^condition[+] = zib-SOAPReport-1
* code ^condition[+] = zib-SOAPReport-1
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.6.2--20200901000000 (preferred)
* code.coding ^condition[+] = zib-SOAPReport-1
* value[x] insert Discriminator(type, $this)
* valueString only string

// Short, alias, definition and comment texts
* ^description = """
    A SOAP report is a textual report of a (partial) consult with relation to a single problem according to the SOAP structure. SOAP (acronym for subjective, objective, assessment, plan) is a method used by health professionals to structurally record information that comes up during contact between the patient and a health professionals in the patient's record. The following standardized format is used for reporting:
    
    * Subjective: the patient's complaint and request for help and the amnesic data
    * Objective: the findings from the physical and supplementary examination.
    * Assessment: the working hypothesis and the thinking process, for example a differential diagnosis of the healthcare professional.
    * Plan: the diagnostic plan or treatment plan and what has been discussed or agreed with the patient.
    
    The SOAP report is mainly used in general practice care.
    
    Note: the zib doesn't state explicitly if zib SOAPReport pertains a consult or a partial consult, but it has become clear that the zib, and thus this profile, should be interpreted as a partial consult with relation to a single problem (see <https://bits.nictiz.nl/browse/ZIB-1474>). The text above has been adjusted according to this insight.
    """
* .
  * ^short = "SOAPLine"
  * ^alias[+] = "SOEPRegel"
  * ^comment = "Zib SOAPReport is implemented using two profiles: this profile implements the SOAPLine concept of the zib, while <http://nictiz.nl/fhir/StructureDefinition/nl-base-SOAPReport> represents the SOAPReport concept of the zib."
* status ^comment = "Unless explicitly recorded, a value of _final_ would be expected."
* code
  * ^short = "SOAPLineHeader"
  * ^alias[+] = "SOEPRegelNaam"
  * ^definition = "The name of the SOAP line as a coded description. In a SOAP report this can be one of the following: subjective, objective, assessment or plan."
* valueString
  * ^short = "SOAPLineText"
  * ^alias[+] = "SOEPRegelTekst"
  * ^definition = "The actual content of the section as free formatted text."

Invariant: zib-SOAPReport-1
Description: "In a SOAP report an ICPC code may be assigned, but only to the S and A line."
Severity: #error
Expression: "extension('http://nictiz.nl/fhir/StructureDefinition/ext-SOAPReport.SOAPLineCode').exists() implies (code.coding.where(code = '255362007' and system = 'http://snomed.info/sct').exists() or code.coding.where(code = '129265001' and system = 'http://snomed.info/sct').exists())"

Mapping: NlbaseSOAPReportSOAPLine-to-zib-soapreport-v1.0-2020EN
Id: zib-soapreport-v1.0-2020EN
Title: "zib SOAPReport-v1.0(2020EN)"
Source: NlbaseSOAPReportSOAPLine
Target: "https://zibs.nl/wiki/SOAPReport-v1.0(2020EN)"
*  -> "NL-CM:13.6.4" "SOAPLine"
* code -> "NL-CM:13.6.6" "SOAPLineHeader"
* valueString -> "NL-CM:13.6.7" "SOAPLineText"
