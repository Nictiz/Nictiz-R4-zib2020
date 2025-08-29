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
* subject only Reference(Patient or Location or Group or Organization or Practitioner or PlanDefinition or Medication or Procedure or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* author only Reference(Device or Organization or Patient or Practitioner or PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)

// Short, alias, definition and comment texts
* ^description = "A contraindication (CI) for medication safety is a condition or characteristic of a patient where healthcare professionals are not allowed to subscribe certain medicines, or only under certain conditions."
* . ^alias[+] = "nl-core-MedicationContraIndication"
* author insert PatternNlCoreHealthProfessional
