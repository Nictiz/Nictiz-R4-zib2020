Profile: NlbaseParticipationInSocietyWorkSituation
Parent: Observation
Id: nl-base-ParticipationInSociety.WorkSituation
Title: "nl base ParticipationInSociety.WorkSituation"
* insert ProfileMetadata(nl-base-ParticipationInSociety.WorkSituation)
* ^purpose = "This Observation resource represents the WorkSituation concept (NL-CM:18.6.4) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) ParticipationInSociety v3.1 (2020)](https://zibs.nl/wiki/ParticipationInSociety-v3.1(2020EN))."

* code = http://snomed.info/sct#364703007
* value[x] only string

// Short, alias, definition and comment texts
* ^description = "WorkSituation describes the extent to which and in what way the patient participates in the workforce. Work is meant in the broadest sense of the word: activities that contribute to the person themselves, their environment or society. This includes both paid and unpaid work."
* . ^comment = "This Observation resource represents the WorkSituation concept (NL-CM:18.6.4) of zib ParticipationInSociety. It can be used together with the [nl-base-ParticipationInSociety](http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "WorkSituation"
  * ^alias[+] = "Arbeidssituatie"
  * ^definition = "WorkSituation describes the extent to which and in what way the patient participates in the workforce. Work is meant in the broadest sense of the word: activities that contribute to the person themselves, their environment or society. This includes both paid and unpaid work."

Mapping: NlbaseParticipationInSocietyWorkSituation-to-zib-participationinsociety-v3.1-2020EN
Id: zib-participationinsociety-v3.1-2020EN
Title: "zib ParticipationInSociety-v3.1(2020EN)"
Source: NlbaseParticipationInSocietyWorkSituation
Target: "https://zibs.nl/wiki/ParticipationInSociety-v3.1(2020EN)"
* value[x] -> "NL-CM:18.6.4" "WorkSituation"
