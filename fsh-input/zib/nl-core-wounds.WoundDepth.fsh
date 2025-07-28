Profile: NlcorewoundsWoundDepth
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundDepth
Id: nl-core-wounds.WoundDepth
Title: "nl core wounds.WoundDepth"
* insert ProfileMetadata(nl-core-wounds.WoundDepth)
* ^purpose = "This Observation resource represents the WoundDepth concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) PressureUlcer v3.4 (2020)](https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)) and the Dutch [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN)) (NL-CM:19.1.11/NL-CM:19.2.14)."


// Short, alias, definition and comment texts
* ^description = "The depth of the wound."
* .
  * ^alias[+] = "nl-core-wounds.WoundDepth"
  * ^comment = "This Observation resource represents the WoundDepth concept of zibs PressureUlcer and Wound (NL-CM:19.1.11/NL-CM:19.2.14). It is usually part of an assessment, which is represented using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
