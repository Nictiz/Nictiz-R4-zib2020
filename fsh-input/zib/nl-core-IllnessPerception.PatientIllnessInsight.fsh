Profile: NlcoreIllnessPerceptionPatientIllnessInsight
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception.PatientIllnessInsight
Id: nl-core-IllnessPerception.PatientIllnessInsight
Title: "nl core IllnessPerception.PatientIllnessInsight"
* insert ProfileMetadata(nl-core-IllnessPerception.PatientIllnessInsight)
* ^purpose = "This Observation resource represents the PatientIllnessInsight concept of (NL-CM:18.5.3) Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) IllnessPerception v3.1 (2020)](https://zibs.nl/wiki/IllnessPerception-v3.1(2020EN))."

* insert NlCorePatientForObservation

// Short, alias, definition and comment texts
* ^description = "The patient’s illness insight describes their awareness of having an illness or health problem and what that means for their daily life."
* .
  * ^alias[+] = "nl-core-IllnessPerception.PatientIllnessInsight"
  * ^comment = "This Observation resource represents the PatientIllnessInsight concept (NL-CM:18.5.3) of zib IllnessPerception. It can be used together with the [nl-core-IllnessPerception](http://nictiz.nl/fhir/StructureDefinition/nl-core-IllnessPerception) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
