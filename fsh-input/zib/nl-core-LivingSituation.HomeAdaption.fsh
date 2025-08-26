Profile: NlcoreLivingSituationHomeAdaption
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation.HomeAdaption
Id: nl-core-LivingSituation.HomeAdaption
Title: "nl core LivingSituation.HomeAdaption"
* insert ProfileMetadata(nl-core-LivingSituation.HomeAdaption)
* ^purpose = "This Observation resource represents the HomeAdaption concept (NL-CM:7.8.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LivingSituation v3.3 (2020)](https://zibs.nl/wiki/LivingSituation-v3.3(2020EN))."

* insert NlCorePatientForObservation
* valueCodeableConcept ^binding.strength = #extensible

// Short, alias, definition and comment texts
* ^description = "Adaptions present in the home that have been made in the context of the illness or disability to make the functioning of the patient safer and more comfortable and to enable independent living."
* .
  * ^alias[+] = "nl-core-LivingSituation.HomeAdaption"
  * ^comment = "This Observation resource represents the HomeAdaption concept (NL-CM:7.8.5) of zib LivingSituation. It can be used together with the [nl-core-LivingSituation](http://nictiz.nl/fhir/StructureDefinition/nl-core-LivingSituation) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
