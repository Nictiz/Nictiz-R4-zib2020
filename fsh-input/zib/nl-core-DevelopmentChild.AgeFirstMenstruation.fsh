Profile: NlcoreDevelopmentChildAgeFirstMenstruation
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.AgeFirstMenstruation
Id: nl-core-DevelopmentChild.AgeFirstMenstruation
Title: "nl core DevelopmentChild.AgeFirstMenstruation"
* insert ProfileMetadata(nl-core-DevelopmentChild.AgeFirstMenstruation)
* ^purpose = "This Observation resource represents the AgeFirstMenstruation concept (NL-CM:4.32.7) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) DevelopmentChild v1.2 (2020)](https://zibs.nl/wiki/DevelopmentChild-v1.2(2020EN))."


// Short, alias, definition and comment texts
* ^description = "The age of the start of the first menstruation."
* .
  * ^alias[+] = "nl-core-DevelopmentChild.AgeFirstMenstruation"
  * ^comment = "This Observation resource represents the AgeFirstMenstruation concept (NL-CM:4.32.7) of zib DevelopmentChild. It can be used together with the [nl-core-DevelopmentChild](http://nictiz.nl/fhir/StructureDefinition/nl-core-DevelopmentChild) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
