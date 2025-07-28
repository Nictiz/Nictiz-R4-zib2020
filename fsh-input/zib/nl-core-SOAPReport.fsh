Profile: NlcoreSOAPReport
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-SOAPReport
Id: nl-core-SOAPReport
Title: "nl core SOAPReport"
* insert ProfileMetadata(nl-core-SOAPReport)
* insert Purpose(SOAPReport, 1.0, Composition)

* author ..1
* section[soapLine] ..4
* section[soapLine].code 1..
* section[soapLine].code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.6.2--20200901000000 (required)
* section[soapLine].entry 1..

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
* author ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
* section[soapLine].text ^comment = "This element SHOULD hold the information as found in the referenced [nl-core-SOAPReport.SOAPLine](http://nictiz.nl/StructureDefinition/nl-core-SOAPReport.SOAPLine) profile to provide a human-readable narrative of the Composition."
