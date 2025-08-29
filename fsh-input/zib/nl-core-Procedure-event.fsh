Profile: NlcoreProcedureevent
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-event
Id: nl-core-Procedure-event
Title: "nl core Procedure event"
* insert ProfileMetadata(nl-core-Procedure-event)
* insert Purpose(Procedure, 5.2, Procedure)

* basedOn only Reference(CarePlan or ServiceRequest or http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-request)
* code ^binding.strength = #required
* subject only Reference(Patient or Group or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* performer.actor only Reference(Practitioner or PractitionerRole or Organization or Patient or RelatedPerson or Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* location only Reference(Location or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider)
* reasonReference only Reference(Condition or Observation or Procedure or DiagnosticReport or DocumentReference or http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* bodySite ..1
* bodySite insert PatternNlCoreAnatomicalLocation
* report[textResult] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-TextResult)

// Short, alias, definition and comment texts
* ^description = """
    Therapeutic or diagnostic procedure undergone by the patient (the complementary profile [nl-core-Procedure-request](http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-request) can be used for therapeutic or diagnostic procedures that the patient will undergo). A procedure can be a simple blood pressure measurement, but also a complex heart surgery.
    In some care settings, the term treatment is used instead of the term procedure.
    """
* .
  * ^alias[+] = "nl-core-Procedure-event"
  * ^comment = """
    The zib Procedure is mapped both to this Procedure profile and a profile on ServiceRequest (<http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-request>) to align with the intention of FHIR. All past procedures are covered using this Procedure resource, while all future procedures, including the advised procedures, are covered in the ServiceRequest resource. Both resources contain the zib mappings, with the exception of the Requester concept; this is not relevant for past procedures and has only been mapped to the ServiceRequest profile.
    
    The planned and performed procedures can be linked using `Procedure.basedOn`.
    """
* performer.actor insert PatternNlCoreHealthProfessional
* location ^comment = "Please note that the zib concept Location::HealthcareProvider of zib MedicalDevice (NL-CM:10.1.8) is mapped onto this element, but it is also directly represented using a custom extension in the focal profile for that zib ([nl-core-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice)). The reason for this is that the Location concept from zib MedicalDevice aligns with the Location concept from zib Procedure, but only for the situation that the Procedure is about placing an implant which is described using the instance of zib MedicalDevice. In this situation, the extension in the nl-core-MedicalDevice profile is redundant and it is advised to only use the current element to represent the Location concept."
