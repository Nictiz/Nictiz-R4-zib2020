Profile: NlbasewoundsWoundDepth
Parent: Observation
Id: nl-base-wounds.WoundDepth
Title: "nl base wounds.WoundDepth"
* insert ProfileMetadata(nl-base-wounds.WoundDepth)
* ^purpose = "This Observation resource represents the WoundDepth concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) PressureUlcer v3.4 (2020)](https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)) and the Dutch [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN)) (NL-CM:19.1.11/NL-CM:19.2.14)."

* code = http://loinc.org#39127-6
* value[x] only Quantity

// Short, alias, definition and comment texts
* ^description = "The depth of the wound."
* . ^comment = "This Observation resource represents the WoundDepth concept of zibs PressureUlcer and Wound (NL-CM:19.1.11/NL-CM:19.2.14). It is usually part of an assessment, which is represented using the [nl-base-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
* value[x]
  * ^short = "WoundDepth"
  * ^alias[+] = "Wonddiepte"
  * ^definition = "The depth of the (decubitus) wound."

Mapping: NlbasewoundsWoundDepth-to-zib-pressureulcer-v3.4-2020EN
Id: zib-pressureulcer-v3.4-2020EN
Title: "zib PressureUlcer-v3.4(2020EN)"
Source: NlbasewoundsWoundDepth
Target: "https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)"
* value[x] -> "NL-CM:19.1.11" "WoundDepth"

Mapping: NlbasewoundsWoundDepth-to-zib-wound-v3.3-2020EN
Id: zib-wound-v3.3-2020EN
Title: "zib Wound-v3.3(2020EN)"
Source: NlbasewoundsWoundDepth
Target: "https://zibs.nl/wiki/Wound-v3.3(2020EN)"
* value[x] -> "NL-CM:19.2.14" "WoundDepth"
