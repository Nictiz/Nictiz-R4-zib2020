Profile: NlcorewoundsWoundLength
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundLength
Id: nl-core-wounds.WoundLength
Title: "nl core wounds.WoundLength"
* insert ProfileMetadata(nl-core-wounds.WoundLength)
* ^purpose = "This Observation resource represents the WoundLength concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) PressureUlcer v3.4 (2020)](https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)) and the Dutch [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN)) (NL-CM:19.1.9/NL-CM:19.2.12)."


// Short, alias, definition and comment texts
* ^description = "The length of the wound."
* .
  * ^alias[+] = "nl-core-wounds.WoundLength"
  * ^comment = "This Observation resource represents the WoundLength concept of zibs PressureUlcer and Wound (NL-CM:19.1.9/NL-CM:19.2.12). It is usually part of an assessment, which is represented using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
