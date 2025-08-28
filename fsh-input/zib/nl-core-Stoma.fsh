Profile: NlcoreStoma
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Stoma
Id: nl-core-Stoma
Title: "nl core Stoma"
* insert ProfileMetadata(nl-core-Stoma)
* insert Purpose(Stoma, 3.3, Condition)

* category 1..
* category[stomaCode] 1..1
* code 1..
* code ^binding.strength = #extensible
* insert NlCorePatientForCondition
* bodySite ..1
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AnatomicalLocation
* bodySite ^binding.strength = #required
* note ..1

// Short, alias, definition and comment texts
* ^description = "A stoma is an unnatural, surgically created opening connecting a body cavity with the outside world. A stoma is created e.g. as an exit opening for feces or urine in the event that they cannot leave the body naturally. In the case of a tracheostomy, the stoma is intended to facilitate breathing if that is no longer possible via the oral, nasal and throat cavity."
* .
  * ^alias[+] = "nl-core-Stoma"
  * ^comment = "Please note that on a functional level, zib Stoma references zib MedicalDevice, but in FHIR this direction is reversed. Therefore, the concept StomaMaterial (NL-CM:5.2.3) is mapped on `DeviceUseStatement.reasonReference` in profile [nl-core-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice) instead of in this profile."
