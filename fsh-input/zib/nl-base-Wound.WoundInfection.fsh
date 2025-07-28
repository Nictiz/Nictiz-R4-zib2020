Profile: NlbaseWoundWoundInfection
Parent: Observation
Id: nl-base-Wound.WoundInfection
Title: "nl base Wound.WoundInfection"
* insert ProfileMetadata(nl-base-Wound.WoundInfection)
* ^purpose = "This Observation resource represents the WoundInfection concept (NL-CM:19.2.7) of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN))."

* code = http://snomed.info/sct#405009004
* value[x] only boolean

// Short, alias, definition and comment texts
* ^description = "Indication stating whether the wound is infected."
* . ^comment = "This Observation resource represents the WoundInfection concept (NL-CM:19.2.7) of zib Wound. It is usually part of an assessment, which is represented using the [nl-base-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
* value[x]
  * ^short = "WoundInfection"
  * ^alias[+] = "WondInfectie"
  * ^definition = "Indication stating whether the wound is infected."

Mapping: NlbaseWoundWoundInfection-to-zib-wound-v3.3-2020EN
Id: zib-wound-v3.3-2020EN
Title: "zib Wound-v3.3(2020EN)"
Source: NlbaseWoundWoundInfection
Target: "https://zibs.nl/wiki/Wound-v3.3(2020EN)"
* value[x] -> "NL-CM:19.2.7" "WoundInfection"
