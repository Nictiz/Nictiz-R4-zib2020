Profile: NlbaseParticipationInSocietyHobby
Parent: Observation
Id: nl-base-ParticipationInSociety.Hobby
Title: "nl base ParticipationInSociety.Hobby"
* insert ProfileMetadata(nl-base-ParticipationInSociety.Hobby)
* ^purpose = "This Observation resource represents the Hobby concept (NL-CM:18.6.3) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) ParticipationInSociety v3.1 (2020)](https://zibs.nl/wiki/ParticipationInSociety-v3.1(2020EN))."

* code = http://snomed.info/sct#405081003
* value[x] only string

// Short, alias, definition and comment texts
* ^description = "An activity the patient enjoys doing in their free time."
* . ^comment = "This Observation resource represents the Hobby concept (NL-CM:18.6.3) of zib ParticipationInSociety. It can be used together with the [nl-base-ParticipationInSociety](http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "Hobby"
  * ^alias[+] = "Vrijetijdsbesteding"
  * ^definition = "An activity the patient enjoys doing in their free time."

Mapping: NlbaseParticipationInSocietyHobby-to-zib-participationinsociety-v3.1-2020EN
Id: zib-participationinsociety-v3.1-2020EN
Title: "zib ParticipationInSociety-v3.1(2020EN)"
Source: NlbaseParticipationInSocietyHobby
Target: "https://zibs.nl/wiki/ParticipationInSociety-v3.1(2020EN)"
* value[x] -> "NL-CM:18.6.3" "Hobby"
