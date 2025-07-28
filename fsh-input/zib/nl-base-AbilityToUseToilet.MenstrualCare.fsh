Profile: NlbaseAbilityToUseToiletMenstrualCare
Parent: Observation
Id: nl-base-AbilityToUseToilet.MenstrualCare
Title: "nl base AbilityToUseToilet.MenstrualCare"
* insert ProfileMetadata(nl-base-AbilityToUseToilet.MenstrualCare)
* ^purpose = "This Observation resource represents the MenstrualCare concept (NL-CM:4.22.4) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AbilityToUseToilet v3.1.1 (2020)](https://zibs.nl/wiki/AbilityToUseToilet-v3.1.1(2020EN))."

* code = http://snomed.info/sct#284955009
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.22.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Coordinating, planning and hygiene in the event of menstruation, such as anticipating the menstruation and using sanitary napkins and tampons."
* . ^comment = "This Observation resource represents the MenstrualCare concept (NL-CM:4.22.4) of zib AbilityToUseToilet. It can be used together with the [nl-base-AbilityToUseToilet](http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToUseToilet) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "MenstrualCare"
  * ^alias[+] = "ZorgBijMenstruatie"
  * ^definition = "Coordinating, planning and hygiene in the event of menstruation, such as anticipating the menstruation and using sanitary napkins and tampons."

Mapping: NlbaseAbilityToUseToiletMenstrualCare-to-zib-abilitytousetoilet-v3.1.1-2020EN
Id: zib-abilitytousetoilet-v3.1.1-2020EN
Title: "zib AbilityToUseToilet-v3.1.1(2020EN)"
Source: NlbaseAbilityToUseToiletMenstrualCare
Target: "https://zibs.nl/wiki/AbilityToUseToilet-v3.1.1(2020EN)"
* value[x] -> "NL-CM:4.22.4" "MenstrualCare"
