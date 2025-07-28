Profile: NlcoreAbilityToEatEatingLimitations
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToEat.EatingLimitations
Id: nl-core-AbilityToEat.EatingLimitations
Title: "nl core AbilityToEat.EatingLimitations"
* insert ProfileMetadata(nl-core-AbilityToEat.EatingLimitations)
* ^purpose = "This Observation resource represents the EatingLimitations concept (NL-CM:4.7.4) of  Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AbilityToEat v3.1.1 (2020)](https://zibs.nl/wiki/AbilityToEat-v3.1.1(2020EN))."

* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.7.2--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "Eating constraints specify the patient’s constraints in eating."
* .
  * ^alias[+] = "nl-core-AbilityToEat.EatingLimitations"
  * ^comment = "This Observation resource represents the EatingLimitations concept (NL-CM:4.7.4) of zib AbilityToEat. It can be used together with the [nl-core-AbilityToEat](http://nictiz.nl/fhir/StructureDefinition/nl-core-AbilityToEat) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
