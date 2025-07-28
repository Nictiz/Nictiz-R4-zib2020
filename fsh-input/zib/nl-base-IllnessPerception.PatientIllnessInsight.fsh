Profile: NlbaseIllnessPerceptionPatientIllnessInsight
Parent: Observation
Id: nl-base-IllnessPerception.PatientIllnessInsight
Title: "nl base IllnessPerception.PatientIllnessInsight"
* insert ProfileMetadata(nl-base-IllnessPerception.PatientIllnessInsight)
* ^purpose = "This Observation resource represents the PatientIllnessInsight concept of (NL-CM:18.5.3) Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) IllnessPerception v3.1 (2020)](https://zibs.nl/wiki/IllnessPerception-v3.1(2020EN))."

* code = http://snomed.info/sct#27026000
* value[x] only string

// Short, alias, definition and comment texts
* ^description = "The patient’s illness insight describes their awareness of having an illness or health problem and what that means for their daily life."
* .
  * ^short = "IllnessPerception"
  * ^comment = "This Observation resource represents the PatientIllnessInsight concept (NL-CM:18.5.3) of zib IllnessPerception. It can be used together with the [nl-base-IllnessPerception](http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "PatientIllnessInsight"
  * ^alias[+] = "ZiekteInzichtVanPatiënt"
  * ^definition = "The patient’s illness insight describes their awareness of having an illness or health problem and what that means for their daily life."

Mapping: NlbaseIllnessPerceptionPatientIllnessInsight-to-zib-illnessperception-v3.1-2020EN
Id: zib-illnessperception-v3.1-2020EN
Title: "zib IllnessPerception-v3.1(2020EN)"
Source: NlbaseIllnessPerceptionPatientIllnessInsight
Target: "https://zibs.nl/wiki/IllnessPerception-v3.1(2020EN)"
* value[x] -> "NL-CM:18.5.3" "PatientIllnessInsight"
