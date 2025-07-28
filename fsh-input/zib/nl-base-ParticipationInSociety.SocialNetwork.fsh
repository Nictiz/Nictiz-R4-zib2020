Profile: NlbaseParticipationInSocietySocialNetwork
Parent: Observation
Id: nl-base-ParticipationInSociety.SocialNetwork
Title: "nl base ParticipationInSociety.SocialNetwork"
* insert ProfileMetadata(nl-base-ParticipationInSociety.SocialNetwork)
* ^purpose = "This Observation resource represents the SocialNetwork concept (NL-CM:18.6.2) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) ParticipationInSociety v3.1 (2020)](https://zibs.nl/wiki/ParticipationInSociety-v3.1(2020EN))."

* code = http://snomed.info/sct#365469004
* value[x] only string

// Short, alias, definition and comment texts
* ^description = "A description of the patient’s social network, such as family, neighbors and friends."
* . ^comment = "This Observation resource represents the SocialNetwork concept (NL-CM:18.6.2) of zib ParticipationInSociety. It can be used together with the [nl-base-ParticipationInSociety](http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "SocialNetwork"
  * ^alias[+] = "SociaalNetwerk"
  * ^definition = "A description of the patient’s social network, such as family, neighbors and friends."

Mapping: NlbaseParticipationInSocietySocialNetwork-to-zib-participationinsociety-v3.1-2020EN
Id: zib-participationinsociety-v3.1-2020EN
Title: "zib ParticipationInSociety-v3.1(2020EN)"
Source: NlbaseParticipationInSocietySocialNetwork
Target: "https://zibs.nl/wiki/ParticipationInSociety-v3.1(2020EN)"
* value[x] -> "NL-CM:18.6.2" "SocialNetwork"
