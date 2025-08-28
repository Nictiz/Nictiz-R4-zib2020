Profile: NlcoreTobaccoUse
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-TobaccoUse
Id: nl-core-TobaccoUse
Title: "nl core TobaccoUse"
* insert ProfileMetadata(nl-core-TobaccoUse)
* insert Purpose(TobaccoUse, 3.2, Observation)

* insert NlCorePatientForObservation
* valueCodeableConcept ^binding.strength = #extensible
* note ..1
* component[typeOfTobaccoUsed] ..1
* component[typeOfTobaccoUsed].value[x] ^binding.strength = #extensible
* component[amount] ..1
* component[packYears] ..1

// Short, alias, definition and comment texts
* ^description = "Tobacco is a product that comes from the leaves of the tobacco plant, which is smoked as a drug. Smokable forms of tobacco include rolling tobacco, cigarettes, cigars and pipe tobacco. This information model describes the information asked of the patient about their use of tobacco."
* . ^alias[+] = "nl-core-TobaccoUse"
