Profile: NlbasewoundsWoundWidth
Parent: Observation
Id: nl-base-wounds.WoundWidth
Title: "nl base wounds.WoundWidth"
* insert ProfileMetadata(nl-base-wounds.WoundWidth)
* ^purpose = "This Observation resource represents the WoundWidth concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) PressureUlcer v3.4 (2020)](https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)) and the Dutch [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN)) (NL-CM:19.1.10/NL-CM:19.2.13)."

* code = http://loinc.org#39125-0
* value[x] only Quantity

// Short, alias, definition and comment texts
* ^description = "The width of the wound."
* . ^comment = "This Observation resource represents the WoundWidth concept of zibs PressureUlcer and Wound (NL-CM:19.1.10/NL-CM:19.2.13). It is usually part of an assessment, which is represented using the [nl-base-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
* value[x]
  * ^short = "WoundWidth"
  * ^alias[+] = "Wondbreedte"
  * ^definition = "The width of the (decubitus) wound."

Mapping: NlbasewoundsWoundWidth-to-zib-pressureulcer-v3.4-2020EN
Id: zib-pressureulcer-v3.4-2020EN
Title: "zib PressureUlcer-v3.4(2020EN)"
Source: NlbasewoundsWoundWidth
Target: "https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)"
* value[x] -> "NL-CM:19.1.10" "WoundWidth"

Mapping: NlbasewoundsWoundWidth-to-zib-wound-v3.3-2020EN
Id: zib-wound-v3.3-2020EN
Title: "zib Wound-v3.3(2020EN)"
Source: NlbasewoundsWoundWidth
Target: "https://zibs.nl/wiki/Wound-v3.3(2020EN)"
* value[x] -> "NL-CM:19.2.13" "WoundWidth"
