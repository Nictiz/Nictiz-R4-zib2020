Profile: NlcoreIllnessPerceptionCopingWithIllnessByFamily
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception.CopingWithIllnessByFamily
Id: nl-core-IllnessPerception.CopingWithIllnessByFamily
Title: "nl core IllnessPerception.CopingWithIllnessByFamily"
* insert ProfileMetadata(nl-core-IllnessPerception.CopingWithIllnessByFamily)
* ^purpose = "This Observation resource represents the CopingWithIllnessByFamiliy concept of (NL-CM:18.5.5) Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) IllnessPerception v3.1 (2020)](https://zibs.nl/wiki/IllnessPerception-v3.1(2020EN))."


// Short, alias, definition and comment texts
* ^description = "The description of how the family deals with the patient’s illness or health problem."
* .
  * ^alias[+] = "nl-core-IllnessPerception.CopingWithIllnessByFamily"
  * ^comment = "This Observation resource represents the CopingWithIllnessByFamily concept (NL-CM:18.5.5) of zib IllnessPerception. It can be used together with the [nl-core-IllnessPerception](http://nictiz.nl/fhir/StructureDefinition/nl-core-IllnessPerception) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
