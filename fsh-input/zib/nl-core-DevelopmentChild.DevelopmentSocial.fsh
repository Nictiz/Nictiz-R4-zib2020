Profile: NlcoreDevelopmentChildDevelopmentSocial
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.DevelopmentSocial
Id: nl-core-DevelopmentChild.DevelopmentSocial
Title: "nl core DevelopmentChild.DevelopmentSocial"
* insert ProfileMetadata(nl-core-DevelopmentChild.DevelopmentSocial)
* ^purpose = "This Observation resource represents the DevelopmentSocial concept (NL-CM:4.32.8) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) DevelopmentChild v1.2 (2020)](https://zibs.nl/wiki/DevelopmentChild-v1.2(2020EN))."

* value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "Milestones of social development of a child."
* .
  * ^alias[+] = "nl-core-DevelopmentChild.DevelopmentSocial"
  * ^comment = "This Observation resource represents the DevelopmentSocial concept (NL-CM:4.32.8) of zib DevelopmentChild. It can be used together with the [nl-core-DevelopmentChild](http://nictiz.nl/fhir/StructureDefinition/nl-core-DevelopmentChild) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
