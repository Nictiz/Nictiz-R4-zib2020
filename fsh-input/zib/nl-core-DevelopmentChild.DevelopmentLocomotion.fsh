Profile: NlcoreDevelopmentChildDevelopmentLocomotion
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.DevelopmentLocomotion
Id: nl-core-DevelopmentChild.DevelopmentLocomotion
Title: "nl core DevelopmentChild.DevelopmentLocomotion"
* insert ProfileMetadata(nl-core-DevelopmentChild.DevelopmentLocomotion)
* ^purpose = "This Observation resource represents the DevelopmentLocomotion concept (NL-CM:4.32.6) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) DevelopmentChild v1.2 (2020)](https://zibs.nl/wiki/DevelopmentChild-v1.2(2020EN))."

* value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "Milestones of locomotive development of a child."
* .
  * ^alias[+] = "nl-core-DevelopmentChild.DevelopmentLocomotion"
  * ^comment = "This Observation resource represents the DevelopmentLocomotion concept (NL-CM:4.32.6) of zib DevelopmentChild. It can be used together with the [nl-core-DevelopmentChild](http://nictiz.nl/fhir/StructureDefinition/nl-core-DevelopmentChild) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
