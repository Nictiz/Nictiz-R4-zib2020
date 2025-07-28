Profile: NlbaseAbilityToEatEatingLimitations
Parent: Observation
Id: nl-base-AbilityToEat.EatingLimitations
Title: "nl base AbilityToEat.EatingLimitations"
* insert ProfileMetadata(nl-base-AbilityToEat.EatingLimitations)
* ^purpose = "This Observation resource represents the EatingLimitations concept (NL-CM:4.7.4) of  Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AbilityToEat v3.1.1 (2020)](https://zibs.nl/wiki/AbilityToEat-v3.1.1(2020EN))."

* code = http://snomed.info/sct#288843005
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.7.2--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Eating constraints specify the patient’s constraints in eating."
* . ^comment = "This Observation resource represents the EatingLimitations concept (NL-CM:4.7.4) of zib AbilityToEat. It can be used together with the [nl-base-AbilityToEat](http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToEat) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* valueCodeableConcept
  * ^short = "EatingLimitations"
  * ^alias[+] = "EetBeperkingen"
  * ^definition = "Eating constraints specify the patient’s constraints in eating."

Mapping: NlbaseAbilityToEatEatingLimitations-to-zib-abilitytoeat-v3.1.1-2020EN
Id: zib-abilitytoeat-v3.1.1-2020EN
Title: "zib AbilityToEat-v3.1.1(2020EN)"
Source: NlbaseAbilityToEatEatingLimitations
Target: "https://zibs.nl/wiki/AbilityToEat-v3.1.1(2020EN)"
* valueCodeableConcept -> "NL-CM:4.7.4" "EatingLimitations"
