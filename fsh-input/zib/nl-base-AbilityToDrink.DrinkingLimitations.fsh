Profile: NlbaseAbilityToDrinkDrinkingLimitations
Parent: Observation
Id: nl-base-AbilityToDrink.DrinkingLimitations
Title: "nl base AbilityToDrink.DrinkingLimitations"
* insert ProfileMetadata(nl-base-AbilityToDrink.DrinkingLimitations)
* ^purpose = "This Observation resource represents the DrinkingLimitations concept (NL-CM:4.8.4) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AbilityToDrink v3.1.1 (2020)](https://zibs.nl/wiki/AbilityToDrink-v3.1.1(2020EN))."

* code = http://snomed.info/sct#288851008
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.8.2--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "DrinkingConstraints specifies the patient’s constraints in drinking."
* . ^comment = "This Observation resource represents the DrinkingLimitations concept (NL-CM:4.8.4) of zib AbilityToDrink. It can be used together with the [nl-base-AbilityToDrink](http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToDrink) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* valueCodeableConcept
  * ^short = "DrinkingLimitations"
  * ^alias[+] = "DrinkBeperkingen"
  * ^definition = "DrinkingLimitations specifies the patient’s limitations in drinking."

Mapping: NlbaseAbilityToDrinkDrinkingLimitations-to-zib-abilitytodrink-v3.1.1-2020EN
Id: zib-abilitytodrink-v3.1.1-2020EN
Title: "zib AbilityToDrink-v3.1.1(2020EN)"
Source: NlbaseAbilityToDrinkDrinkingLimitations
Target: "https://zibs.nl/wiki/AbilityToDrink-v3.1.1(2020EN)"
* valueCodeableConcept -> "NL-CM:4.8.4" "DrinkingLimitations"
