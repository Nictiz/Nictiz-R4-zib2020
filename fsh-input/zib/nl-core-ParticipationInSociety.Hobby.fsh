Profile: NlcoreParticipationInSocietyHobby
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety.Hobby
Id: nl-core-ParticipationInSociety.Hobby
Title: "nl core ParticipationInSociety.Hobby"
* insert ProfileMetadata(nl-core-ParticipationInSociety.Hobby)
* ^purpose = "This Observation resource represents the Hobby concept (NL-CM:18.6.3) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) ParticipationInSociety v3.1 (2020)](https://zibs.nl/wiki/ParticipationInSociety-v3.1(2020EN))."

* insert NlCorePatientForObservation

// Short, alias, definition and comment texts
* ^description = "An activity the patient enjoys doing in their free time."
* .
  * ^alias[+] = "nl-core-ParticipationInSociety.Hobby"
  * ^comment = "This Observation resource represents the Hobby concept (NL-CM:18.6.3) of zib ParticipationInSociety. It can be used together with the [nl-core-ParticipationInSociety](http://nictiz.nl/fhir/StructureDefinition/nl-core-ParticipationInSociety) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
