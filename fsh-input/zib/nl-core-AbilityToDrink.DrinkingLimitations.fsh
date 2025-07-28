Profile: NlcoreAbilityToDrinkDrinkingLimitations
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToDrink.DrinkingLimitations
Id: nl-core-AbilityToDrink.DrinkingLimitations
Title: "nl core AbilityToDrink.DrinkingLimitations"
* insert ProfileMetadata(nl-core-AbilityToDrink.DrinkingLimitations)
* ^purpose = "This Observation resource represents the DrinkingLimitations concept (NL-CM:4.8.4) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AbilityToDrink v3.1.1 (2020)](https://zibs.nl/wiki/AbilityToDrink-v3.1.1(2020EN))."

* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.8.2--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "DrinkingConstraints specifies the patient’s constraints in drinking."
* .
  * ^alias[+] = "nl-core-AbilityToDrink.DrinkingLimitations"
  * ^comment = "This Observation resource represents the DrinkingLimitations concept (NL-CM:4.8.4) of zib AbilityToDrink. It can be used together with the [nl-core-AbilityToDrink](http://nictiz.nl/fhir/StructureDefinition/nl-core-AbilityToDrink) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
