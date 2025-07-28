Profile: NlcoreAlcoholUse
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AlcoholUse
Id: nl-core-AlcoholUse
Title: "nl core AlcoholUse"
* insert ProfileMetadata(nl-core-AlcoholUse)
* insert Purpose(AlcoholUse, 3.2, Observation)

* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.3.2--20200901000000 (required)
* note ..1
* component[amount] ..1

// Short, alias, definition and comment texts
* ^description = "In the context of this information model, alcohol is the collective term for alcoholic beverages consumed as a leisure product. This information model describes the information asked of the patient about their alcohol use."
* . ^alias[+] = "nl-core-AlcoholUse"
