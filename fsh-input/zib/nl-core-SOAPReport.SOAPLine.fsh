Profile: NlcoreSOAPReportSOAPLine
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-SOAPReport.SOAPLine
Id: nl-core-SOAPReport.SOAPLine
Title: "nl core SOAPReport.SOAPLine"
* insert ProfileMetadata(nl-core-SOAPReport.SOAPLine)
* ^purpose = "This Observation resource represents the SOAPLine concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) SOAPReport v1.0 (2020)](https://zibs.nl/wiki/SOAPReport-v1.0(2020EN))."

* . obeys zib-SOAPReport-1
* code ^binding.strength = #required

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
  * ^alias[+] = "nl-core-SOAPReport.SOAPLine"
  * ^comment = "Zib SOAPReport is implemented using two profiles: this profile implements the SOAPLine concept of the zib, while <http://nictiz.nl/fhir/StructureDefinition/nl-core-SOAPReport> represents the SOAPReport concept of the zib."
