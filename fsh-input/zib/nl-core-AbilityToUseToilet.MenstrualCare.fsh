Profile: NlcoreAbilityToUseToiletMenstrualCare
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToUseToilet.MenstrualCare
Id: nl-core-AbilityToUseToilet.MenstrualCare
Title: "nl core AbilityToUseToilet.MenstrualCare"
* insert ProfileMetadata(nl-core-AbilityToUseToilet.MenstrualCare)
* ^purpose = "This Observation resource represents the MenstrualCare concept (NL-CM:4.22.4) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AbilityToUseToilet v3.1.1 (2020)](https://zibs.nl/wiki/AbilityToUseToilet-v3.1.1(2020EN))."

* insert NlCorePatientForObservation
* value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "Coordinating, planning and hygiene in the event of menstruation, such as anticipating the menstruation and using sanitary napkins and tampons."
* .
  * ^alias[+] = "nl-core-AbilityToUseToilet.MenstrualCare"
  * ^comment = "This Observation resource represents the MenstrualCare concept (NL-CM:4.22.4) of zib AbilityToUseToilet. It can be used together with the [nl-core-AbilityToUseToilet](http://nictiz.nl/fhir/StructureDefinition/nl-core-AbilityToUseToilet) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
