Profile: NlcoreProcedureevent
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-event
Id: nl-core-Procedure-event
Title: "nl core Procedure event"
* insert ProfileMetadata(nl-core-Procedure-event)
* insert Purpose(Procedure, 5.2, Procedure)

* basedOn only Reference(http://hl7.org/fhir/StructureDefinition/CarePlan or http://hl7.org/fhir/StructureDefinition/ServiceRequest or http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-request)
* code ^binding.strength = #required
* performer.actor only Reference(http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/RelatedPerson or http://hl7.org/fhir/StructureDefinition/Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* location only Reference(http://hl7.org/fhir/StructureDefinition/Location or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider)
* reasonReference only Reference(http://hl7.org/fhir/StructureDefinition/Condition or http://hl7.org/fhir/StructureDefinition/Observation or http://hl7.org/fhir/StructureDefinition/Procedure or http://hl7.org/fhir/StructureDefinition/DiagnosticReport or http://hl7.org/fhir/StructureDefinition/DocumentReference or http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* bodySite ..1
* bodySite ^binding.strength = #required
* report[textResult] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-TextResult)

// Short, alias, definition and comment texts
* ^description = """
    Therapeutic or diagnostic procedure undergone by the patient (the complementary profile [zib-Procedure-request](http://nictiz.nl/fhir/StructureDefinition/zib-Procedure-request) can be used for therapeutic or diagnostic procedures that the patient will undergo). A procedure can be a simple blood pressure measurement, but also a complex heart surgery.
    In some care settings, the term treatment is used instead of the term procedure.
    """
* .
  * ^alias[+] = "nl-core-Procedure-event"
  * ^comment = """
    The zib Procedure is mapped both to this Procedure profile and a profile on ServiceRequest (<http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-request>) to align with the intention of FHIR. All past procedures are covered using this Procedure resource, while all future procedures, including the advised procedures, are covered in the ServiceRequest resource. Both resources contain the zib mappings, with the exception of the Requester concept; this is not relevant for past procedures and has only been mapped to the ServiceRequest profile.
    
    The planned and performed procedures can be linked using `Procedure.basedOn`.
    """
* performer.actor ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
* location ^comment = "Please note that the zib concept Location::HealthcareProvider of zib MedicalDevice (NL-CM:10.1.8) is mapped onto this element, but it is also directly represented using a custom extension in the focal profile for that zib ([nl-core-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice)). The reason for this is that the Location concept from zib MedicalDevice aligns with the Location concept from zib Procedure, but only for the situation that the Procedure is about placing an implant which is described using the instance of zib MedicalDevice. In this situation, the extension in the nl-core-MedicalDevice profile is redundant and it is advised to only use the current element to represent the Location concept."
