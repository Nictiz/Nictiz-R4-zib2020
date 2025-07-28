Profile: NlcoreDevelopmentChildToiletTrainednessFeces
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.ToiletTrainednessFeces
Id: nl-core-DevelopmentChild.ToiletTrainednessFeces
Title: "nl core DevelopmentChild.ToiletTrainednessFeces"
* insert ProfileMetadata(nl-core-DevelopmentChild.ToiletTrainednessFeces)
* ^purpose = "This Observation resource represents the ToiletTrainednessFeces concept (NL-CM:4.32.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) DevelopmentChild v1.2 (2020)](https://zibs.nl/wiki/DevelopmentChild-v1.2(2020EN))."

* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.32.2--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "Degree of toilet trainedness for feces."
* .
  * ^alias[+] = "nl-core-DevelopmentChild.ToiletTrainednessFeces"
  * ^comment = "This Observation resource represents the ToiletTrainednessFeces concept (NL-CM:4.32.5) of zib DevelopmentChild. It can be used together with the [nl-core-DevelopmentChild](http://nictiz.nl/fhir/StructureDefinition/nl-core-DevelopmentChild) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
