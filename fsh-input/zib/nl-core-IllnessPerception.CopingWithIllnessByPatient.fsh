Profile: NlcoreIllnessPerceptionCopingWithIllnessByPatient
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception.CopingWithIllnessByPatient
Id: nl-core-IllnessPerception.CopingWithIllnessByPatient
Title: "nl core IllnessPerception.CopingWithIllnessByPatient"
* insert ProfileMetadata(nl-core-IllnessPerception.CopingWithIllnessByPatient)
* ^purpose = "This Observation resource represents the CopingWithIllnessByPatient concept of (NL-CM:18.5.4) Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) IllnessPerception v3.1 (2020)](https://zibs.nl/wiki/IllnessPerception-v3.1(2020EN))."


// Short, alias, definition and comment texts
* ^description = "The description of how the patient deals with their illness or health problem."
* .
  * ^alias[+] = "nl-core-IllnessPerception.CopingWithIllnessByPatient"
  * ^comment = "This Observation resource represents the CopingWithIllnessByPatient concept (NL-CM:18.5.4) of zib IllnessPerception. It can be used together with the [nl-core-IllnessPerception](http://nictiz.nl/fhir/StructureDefinition/nl-core-IllnessPerception) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
