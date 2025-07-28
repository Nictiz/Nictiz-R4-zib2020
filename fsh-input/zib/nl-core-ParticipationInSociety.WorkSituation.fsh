Profile: NlcoreParticipationInSocietyWorkSituation
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety.WorkSituation
Id: nl-core-ParticipationInSociety.WorkSituation
Title: "nl core ParticipationInSociety.WorkSituation"
* insert ProfileMetadata(nl-core-ParticipationInSociety.WorkSituation)
* ^purpose = "This Observation resource represents the WorkSituation concept (NL-CM:18.6.4) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) ParticipationInSociety v3.1 (2020)](https://zibs.nl/wiki/ParticipationInSociety-v3.1(2020EN))."


// Short, alias, definition and comment texts
* ^description = "WorkSituation describes the extent to which and in what way the patient participates in the workforce. Work is meant in the broadest sense of the word: activities that contribute to the person themselves, their environment or society. This includes both paid and unpaid work."
* .
  * ^alias[+] = "nl-core-ParticipationInSociety.WorkSituation"
  * ^comment = "This Observation resource represents the WorkSituation concept (NL-CM:18.6.4) of zib ParticipationInSociety. It can be used together with the [nl-core-ParticipationInSociety](http://nictiz.nl/fhir/StructureDefinition/nl-core-ParticipationInSociety) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
