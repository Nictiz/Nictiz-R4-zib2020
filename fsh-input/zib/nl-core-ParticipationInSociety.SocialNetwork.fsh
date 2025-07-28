Profile: NlcoreParticipationInSocietySocialNetwork
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety.SocialNetwork
Id: nl-core-ParticipationInSociety.SocialNetwork
Title: "nl core ParticipationInSociety.SocialNetwork"
* insert ProfileMetadata(nl-core-ParticipationInSociety.SocialNetwork)
* ^purpose = "This Observation resource represents the SocialNetwork concept (NL-CM:18.6.2) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) ParticipationInSociety v3.1 (2020)](https://zibs.nl/wiki/ParticipationInSociety-v3.1(2020EN))."


// Short, alias, definition and comment texts
* ^description = "A description of the patient’s social network, such as family, neighbors and friends."
* .
  * ^alias[+] = "nl-core-ParticipationInSociety.SocialNetwork"
  * ^comment = "This Observation resource represents the SocialNetwork concept (NL-CM:18.6.2) of zib ParticipationInSociety. It can be used together with the [nl-core-ParticipationInSociety](http://nictiz.nl/fhir/StructureDefinition/nl-core-ParticipationInSociety) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
