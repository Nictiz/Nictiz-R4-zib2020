Profile: NlcoreLifeStance
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LifeStance
Id: nl-core-LifeStance
Title: "nl core LifeStance"
* insert ProfileMetadata(nl-core-LifeStance)
* insert Purpose(LifeStance, 3.2, Observation)

* insert NlCorePatientForObservation
* valueCodeableConcept ^binding.strength = #extensible
* note ..1

// Short, alias, definition and comment texts
* ^description = "Patient’s life stance and/or religion."
* . ^alias[+] = "nl-core-LifeStance"
