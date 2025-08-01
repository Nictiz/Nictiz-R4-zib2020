Profile: NlcoreEducation
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Education
Id: nl-core-Education
Title: "nl core Education"
* insert ProfileMetadata(nl-core-Education)
* insert Purpose(Education, 3.2, Observation)

* insert NlCorePatientForObservation
* valueCodeableConcept ^binding.strength = #extensible
* note ..1

// Short, alias, definition and comment texts
* ^description = "Education indicates the highest level of education achieved."
* . ^alias[+] = "nl-core-Education"
