Profile: NlbaseIllnessPerceptionCopingWithIllnessByPatient
Parent: Observation
Id: nl-base-IllnessPerception.CopingWithIllnessByPatient
Title: "nl base IllnessPerception.CopingWithIllnessByPatient"
* insert ProfileMetadata(nl-base-IllnessPerception.CopingWithIllnessByPatient)
* ^purpose = "This Observation resource represents the CopingWithIllnessByPatient concept of (NL-CM:18.5.4) Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) IllnessPerception v3.1 (2020)](https://zibs.nl/wiki/IllnessPerception-v3.1(2020EN))."

* code = http://snomed.info/sct#364667003
* value[x] only string

// Short, alias, definition and comment texts
* ^description = "The description of how the patient deals with their illness or health problem."
* .
  * ^short = "IllnessPerception"
  * ^comment = "This Observation resource represents the CopingWithIllnessByPatient concept (NL-CM:18.5.4) of zib IllnessPerception. It can be used together with the [nl-base-IllnessPerception](http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "CopingWithIllnessByPatient"
  * ^alias[+] = "OmgaanMetZiekteprocesDoorPatiënt"
  * ^definition = "The description of how the patient deals with their illness or health problem."

Mapping: NlbaseIllnessPerceptionCopingWithIllnessByPatient-to-zib-illnessperception-v3.1-2020EN
Id: zib-illnessperception-v3.1-2020EN
Title: "zib IllnessPerception-v3.1(2020EN)"
Source: NlbaseIllnessPerceptionCopingWithIllnessByPatient
Target: "https://zibs.nl/wiki/IllnessPerception-v3.1(2020EN)"
* value[x] -> "NL-CM:18.5.4" "CopingWithIllnessByPatient"
