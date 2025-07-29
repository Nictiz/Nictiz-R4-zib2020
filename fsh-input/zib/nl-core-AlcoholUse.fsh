Profile: NlcoreAlcoholUse
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AlcoholUse
Id: nl-core-AlcoholUse
Title: "nl core AlcoholUse"
* insert ProfileMetadata(nl-core-AlcoholUse)
* insert Purpose(AlcoholUse, 3.2, Observation)

* insert NlCorePatientForObservation
* valueCodeableConcept ^binding.strength = #required
* note ..1
* component[amount] ..1

// Short, alias, definition and comment texts
* ^description = "In the context of this information model, alcohol is the collective term for alcoholic beverages consumed as a leisure product. This information model describes the information asked of the patient about their alcohol use."
* . ^alias[+] = "nl-core-AlcoholUse"
