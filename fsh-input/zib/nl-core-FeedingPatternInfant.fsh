Profile: NlcoreFeedingPatternInfant
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-FeedingPatternInfant
Id: nl-core-FeedingPatternInfant
Title: "nl core FeedingPatternInfant"
* insert ProfileMetadata(nl-core-FeedingPatternInfant)
* insert Purpose(FeedingPatternInfant, 1.1, Observation)

* basedOn ..1
* basedOn only Reference(http://hl7.org/fhir/StructureDefinition/CarePlan or http://hl7.org/fhir/StructureDefinition/DeviceRequest or http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation or http://hl7.org/fhir/StructureDefinition/MedicationRequest or http://hl7.org/fhir/StructureDefinition/NutritionOrder or http://hl7.org/fhir/StructureDefinition/ServiceRequest or http://nictiz.nl/fhir/StructureDefinition/nl-core-NutritionAdvice)
* note ..1
* component[feedingSupplement].value[x].coding.display 1..
* component[feedingFrequency] ..1
* component[feedingType].extension[feedingMethod] ..1
* component[feedingType].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.31.1--20200901000000 (extensible)

// Short, alias, definition and comment texts
* ^description = "A healthy diet means that we do not consume too much or too little (energy intake balanced with energy use) and that the composition of food (mainly important nutrients) follows the recommendations from the Health Council. For an infant, this means that the child receives breastfeeding or formula milk or a combination thereof."
* . ^alias[+] = "nl-core-FeedingPatternInfant"
