Profile: NlbaseAbilityToUseToiletToiletUse
Parent: Observation
Id: nl-base-AbilityToUseToilet.ToiletUse
Title: "nl base AbilityToUseToilet.ToiletUse"
* insert ProfileMetadata(nl-base-AbilityToUseToilet.ToiletUse)
* ^purpose = "This Observation resource represents the ToiletUse concept (NL-CM:4.22.6) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AbilityToUseToilet v3.1.1 (2020)](https://zibs.nl/wiki/AbilityToUseToilet-v3.1.1(2020EN))."

* code = http://snomed.info/sct#284899001
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.22.4--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Coordinating and realizing urination or defecation, such as indicating the need, getting into the right position, finding and reaching a suitable spot, manipulating clothing before and after urination, and cleaning up (the body) afterwards."
* . ^comment = "This Observation resource represents the ToiletUse concept (NL-CM:4.22.6) of zib AbilityToUseToilet. It can be used together with the [nl-base-AbilityToUseToilet](http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToUseToilet) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "ToiletUse"
  * ^alias[+] = "Toiletgebruik"
  * ^definition = "Coordinating and realizing urination or defecation, such as indicating the need, getting into the right position, finding and reaching a suitable spot, manipulating clothing before and after urination, and cleaning up (the body) afterwards."

Mapping: NlbaseAbilityToUseToiletToiletUse-to-zib-abilitytousetoilet-v3.1.1-2020EN
Id: zib-abilitytousetoilet-v3.1.1-2020EN
Title: "zib AbilityToUseToilet-v3.1.1(2020EN)"
Source: NlbaseAbilityToUseToiletToiletUse
Target: "https://zibs.nl/wiki/AbilityToUseToilet-v3.1.1(2020EN)"
* value[x] -> "NL-CM:4.22.6" "ToiletUse"
