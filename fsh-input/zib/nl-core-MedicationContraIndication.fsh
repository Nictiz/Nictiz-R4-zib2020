Profile: NlcoreMedicationContraIndication
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicationContraIndication
Id: nl-core-MedicationContraIndication
Title: "nl core MedicationContraIndication"
* insert ProfileMetadata(nl-core-MedicationContraIndication)
* insert Purpose(MedicationContraIndication, 1.0, Flag)

* extension[comment] ..1
* extension[reasonClosure] ..1
* category 1..
* category[medicationContraIndicationCode] 1..1
* code ^binding.strength = #required
* author only Reference(http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)

// Short, alias, definition and comment texts
* ^description = "A contraindication (CI) for medication safety is a condition or characteristic of a patient where healthcare professionals are not allowed to subscribe certain medicines, or only under certain conditions."
* . ^alias[+] = "nl-core-MedicationContraIndication"
* author ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
