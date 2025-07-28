Profile: NlcoreAbilityToUseToiletToiletUse
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToUseToilet.ToiletUse
Id: nl-core-AbilityToUseToilet.ToiletUse
Title: "nl core AbilityToUseToilet.ToiletUse"
* insert ProfileMetadata(nl-core-AbilityToUseToilet.ToiletUse)
* ^purpose = "This Observation resource represents the ToiletUse concept (NL-CM:4.22.6) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AbilityToUseToilet v3.1.1 (2020)](https://zibs.nl/wiki/AbilityToUseToilet-v3.1.1(2020EN))."

* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.22.4--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "Coordinating and realizing urination or defecation, such as indicating the need, getting into the right position, finding and reaching a suitable spot, manipulating clothing before and after urination, and cleaning up (the body) afterwards."
* .
  * ^alias[+] = "nl-core-AbilityToUseToilet.ToiletUse"
  * ^comment = "This Observation resource represents the ToiletUse concept (NL-CM:4.22.6) of zib AbilityToUseToilet. It can be used together with the [nl-core-AbilityToUseToilet](http://nictiz.nl/fhir/StructureDefinition/nl-core-AbilityToUseToilet) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
