Profile: NlcoreSOAPReport
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-SOAPReport
Id: nl-core-SOAPReport
Title: "nl core SOAPReport"
* insert ProfileMetadata(nl-core-SOAPReport)
* insert Purpose(SOAPReport, 1.0, Composition)

* author ..1
* author only Reference(Practitioner or PractitionerRole or Device or Patient or RelatedPerson or Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* subject only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* encounter only Reference(Encounter or http://nictiz.nl/fhir/StructureDefinition/nl-core-Encounter)
* section[soapLine] ..4
* section[soapLine].code 1..
* section[soapLine].code ^binding.strength = #required
* section[soapLine].entry 1..
* section[soapLine].entry only Reference(Resource or http://nictiz.nl/fhir/StructureDefinition/nl-core-SOAPReport.SOAPLine)

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
  * ^alias[+] = "nl-core-SOAPReport"
  * ^comment = """
    Zib SOAPReport is implemented using two profiles: this profile implements the SOAPReport concept of the zib, while <http://nictiz.nl/fhir/StructureDefinition/nl-core-SOAPReport.SOAPLine> represents the SOAPLine concept of the zib which is referenced by `.section.entry`. 
    The Composition resource SHOULD hold a summary in the `.section.text` elements of the information found in the referenced SOAPReport.SOAPLine profile.
    """
* author insert PatternNlCoreHealthProfessional
* section[soapLine].text ^comment = "This element SHOULD hold the information as found in the referenced [nl-core-SOAPReport.SOAPLine](http://nictiz.nl/StructureDefinition/nl-core-SOAPReport.SOAPLine) profile to provide a human-readable narrative of the Composition."
