Profile: NlcoreLivingSituationHouseType
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation.HouseType
Id: nl-core-LivingSituation.HouseType
Title: "nl core LivingSituation.HouseType"
* insert ProfileMetadata(nl-core-LivingSituation.HouseType)
* ^purpose = "This Observation resource represents the HouseType concept (NL-CM:7.8.3) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LivingSituation v3.3 (2020)](https://zibs.nl/wiki/LivingSituation-v3.3(2020EN))."

* valueCodeableConcept ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "Type of home the patient lives in."
* .
  * ^alias[+] = "nl-core-LivingSituation.HouseType"
  * ^comment = "This Observation resource represents the HouseType concept (NL-CM:7.8.3) of zib LivingSituation. It can be used together with the [nl-core-LivingSituation](http://nictiz.nl/fhir/StructureDefinition/nl-core-LivingSituation) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
