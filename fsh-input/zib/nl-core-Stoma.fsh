Profile: NlcoreStoma
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Stoma
Id: nl-core-Stoma
Title: "nl core Stoma"
* insert ProfileMetadata(nl-core-Stoma)
* insert Purpose(Stoma, 3.3, Condition)

* category 1..
* category[stomaCode] 1..1
* code 1..
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.5.2.1--20200901000000 (extensible)
* bodySite ..1
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (required)
* note ..1

// Short, alias, definition and comment texts
* ^description = "A stoma is an unnatural, surgically created opening connecting a body cavity with the outside world. A stoma is created e.g. as an exit opening for feces or urine in the event that they cannot leave the body naturally. In the case of a tracheostomy, the stoma is intended to facilitate breathing if that is no longer possible via the oral, nasal and throat cavity."
* .
  * ^alias[+] = "nl-core-Stoma"
  * ^comment = "Please note that on a functional level, zib Stoma references zib MedicalDevice, but in FHIR this direction is reversed. Therefore, the concept StomaMaterial (NL-CM:5.2.3) is mapped on `DeviceUseStatement.reasonReference` in profile [nl-core-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice) instead of in this profile."
