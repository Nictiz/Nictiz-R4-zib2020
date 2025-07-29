Profile: NlcoreSkinDisorder
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-SkinDisorder
Id: nl-core-SkinDisorder
Title: "nl core SkinDisorder"
* insert ProfileMetadata(nl-core-SkinDisorder)
* insert Purpose(SkinDisorder, 3.3, Observation)

* extension[cause] ..1
* extension[cause].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/Condition or http://hl7.org/fhir/StructureDefinition/Procedure or http://hl7.org/fhir/StructureDefinition/MedicationAdministration or http://hl7.org/fhir/StructureDefinition/Immunization or http://hl7.org/fhir/StructureDefinition/MedicationStatement or http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* category 1..
* category[skinDisorderCode] 1..1
* code ^binding.strength = #extensible
* bodySite ..1
* bodySite ^binding.strength = #required
* note ..1

// Short, alias, definition and comment texts
* ^description = "A skin condition is a disturbance of the organ skin caused by a source to be specified later on."
* . ^alias[+] = "nl-core-SkinDisorder"
