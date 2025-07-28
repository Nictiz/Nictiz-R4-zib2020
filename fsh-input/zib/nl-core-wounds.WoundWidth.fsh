Profile: NlcorewoundsWoundWidth
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundWidth
Id: nl-core-wounds.WoundWidth
Title: "nl core wounds.WoundWidth"
* insert ProfileMetadata(nl-core-wounds.WoundWidth)
* ^purpose = "This Observation resource represents the WoundWidth concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) PressureUlcer v3.4 (2020)](https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)) and the Dutch [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN)) (NL-CM:19.1.10/NL-CM:19.2.13)."


// Short, alias, definition and comment texts
* ^description = "The width of the wound."
* .
  * ^alias[+] = "nl-core-wounds.WoundWidth"
  * ^comment = "This Observation resource represents the WoundWidth concept of zibs PressureUlcer and Wound (NL-CM:19.1.10/NL-CM:19.2.13). It is usually part of an assessment, which is represented using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
