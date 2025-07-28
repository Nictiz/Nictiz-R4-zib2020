Profile: NlcoreWoundWoundInfection
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound.WoundInfection
Id: nl-core-Wound.WoundInfection
Title: "nl core Wound.WoundInfection"
* insert ProfileMetadata(nl-core-Wound.WoundInfection)
* ^purpose = "This Observation resource represents the WoundInfection concept (NL-CM:19.2.7) of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN))."


// Short, alias, definition and comment texts
* ^description = "Indication stating whether the wound is infected."
* .
  * ^alias[+] = "nl-core-Wound.WoundInfection"
  * ^comment = "This Observation resource represents the WoundInfection concept (NL-CM:19.2.7) of zib Wound. It is usually part of an assessment, which is represented using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
