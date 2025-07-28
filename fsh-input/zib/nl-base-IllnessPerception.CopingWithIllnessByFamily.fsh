Profile: NlbaseIllnessPerceptionCopingWithIllnessByFamily
Parent: Observation
Id: nl-base-IllnessPerception.CopingWithIllnessByFamily
Title: "nl base IllnessPerception.CopingWithIllnessByFamily"
* insert ProfileMetadata(nl-base-IllnessPerception.CopingWithIllnessByFamily)
* ^purpose = "This Observation resource represents the CopingWithIllnessByFamiliy concept of (NL-CM:18.5.5) Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) IllnessPerception v3.1 (2020)](https://zibs.nl/wiki/IllnessPerception-v3.1(2020EN))."

* code = http://snomed.info/sct#405199009
* value[x] only string

// Short, alias, definition and comment texts
* ^description = "The description of how the family deals with the patient’s illness or health problem."
* .
  * ^short = "IllnessPerception"
  * ^comment = "This Observation resource represents the CopingWithIllnessByFamily concept (NL-CM:18.5.5) of zib IllnessPerception. It can be used together with the [nl-base-IllnessPerception](http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "CopingWithIllnessByFamily"
  * ^alias[+] = "OmgaanMetZiekteprocesDoorNaasten"
  * ^definition = "The description of how the family deals with the patient’s illness or health problem."

Mapping: NlbaseIllnessPerceptionCopingWithIllnessByFamily-to-zib-illnessperception-v3.1-2020EN
Id: zib-illnessperception-v3.1-2020EN
Title: "zib IllnessPerception-v3.1(2020EN)"
Source: NlbaseIllnessPerceptionCopingWithIllnessByFamily
Target: "https://zibs.nl/wiki/IllnessPerception-v3.1(2020EN)"
* value[x] -> "NL-CM:18.5.5" "CopingWithIllnessByFamily"
