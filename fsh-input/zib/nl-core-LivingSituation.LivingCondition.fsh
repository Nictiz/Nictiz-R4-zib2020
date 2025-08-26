Profile: NlcoreLivingSituationLivingCondition
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation.LivingCondition
Id: nl-core-LivingSituation.LivingCondition
Title: "nl core LivingSituation.LivingCondition"
* insert ProfileMetadata(nl-core-LivingSituation.LivingCondition)
* ^purpose = "This Observation resource represents the HomeAdaption concept (NL-CM:7.8.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LivingSituation v3.3 (2020)](https://zibs.nl/wiki/LivingSituation-v3.3(2020EN))."

* insert NlCorePatientForObservation
* valueCodeableConcept ^binding.strength = #extensible

// Short, alias, definition and comment texts
* ^description = "Conditions that affect the accessibility of the home or the stay in the home."
* .
  * ^alias[+] = "nl-core-LivingSituation.LivingCondition"
  * ^comment = "This Observation resource represents the LivingCondition concept (NL-CM:7.8.4) of zib LivingSituation. It can be used together with the [nl-core-LivingSituation](http://nictiz.nl/fhir/StructureDefinition/nl-core-LivingSituation) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
