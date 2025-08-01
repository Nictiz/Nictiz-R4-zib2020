Profile: NlcoreFeedingPatternInfant
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-FeedingPatternInfant
Id: nl-core-FeedingPatternInfant
Title: "nl core FeedingPatternInfant"
* insert ProfileMetadata(nl-core-FeedingPatternInfant)
* insert Purpose(FeedingPatternInfant, 1.1, Observation)

* basedOn ..1
* basedOn only Reference(CarePlan or DeviceRequest or ImmunizationRecommendation or MedicationRequest or NutritionOrder or ServiceRequest or http://nictiz.nl/fhir/StructureDefinition/nl-core-NutritionAdvice)
* insert NlCorePatientForObservation
* note ..1
* component[feedingSupplement].value[x].coding.display 1..
* component[feedingFrequency] ..1
* component[feedingType].extension[feedingMethod] ..1
* component[feedingType].value[x] ^binding.strength = #extensible

// Short, alias, definition and comment texts
* ^description = "A healthy diet means that we do not consume too much or too little (energy intake balanced with energy use) and that the composition of food (mainly important nutrients) follows the recommendations from the Health Council. For an infant, this means that the child receives breastfeeding or formula milk or a combination thereof."
* . ^alias[+] = "nl-core-FeedingPatternInfant"
