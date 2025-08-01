Profile: NlcoreDevelopmentChildToiletTrainednessFeces
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.ToiletTrainednessFeces
Id: nl-core-DevelopmentChild.ToiletTrainednessFeces
Title: "nl core DevelopmentChild.ToiletTrainednessFeces"
* insert ProfileMetadata(nl-core-DevelopmentChild.ToiletTrainednessFeces)
* ^purpose = "This Observation resource represents the ToiletTrainednessFeces concept (NL-CM:4.32.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) DevelopmentChild v1.2 (2020)](https://zibs.nl/wiki/DevelopmentChild-v1.2(2020EN))."

* insert NlCorePatientForObservation
* value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "Degree of toilet trainedness for feces."
* .
  * ^alias[+] = "nl-core-DevelopmentChild.ToiletTrainednessFeces"
  * ^comment = "This Observation resource represents the ToiletTrainednessFeces concept (NL-CM:4.32.5) of zib DevelopmentChild. It can be used together with the [nl-core-DevelopmentChild](http://nictiz.nl/fhir/StructureDefinition/nl-core-DevelopmentChild) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
