Profile: NlcorewoundsWoundImage
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundImage
Id: nl-core-wounds.WoundImage
Title: "nl core wounds.WoundImage"
* insert ProfileMetadata(nl-core-wounds.WoundImage)
* ^purpose = "This DocumentReference resource represents the WoundImage concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Burnwound v3.4 (2020)](https://zibs.nl/wiki/Burnwound-v3.4(2020EN)), the Dutch [zib PressureUlcer v3.4 (2020)](https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)) and the Dutch [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN)) (NL-CM:19.4.11/NL-CM:19.1.12/NL-CM:19.2.15)."

* context.related only Reference(Resource or http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics)

// Short, alias, definition and comment texts
* ^description = "A photo of the wound, burn wound or decubitus wound as visual information."
* .
  * ^alias[+] = "nl-core-wounds.WoundImage"
  * ^comment = "This DocumentReference resource represents the WoundImage concept of zibs Burnwound, PressureUlcer and Wound (NL-CM:19.4.11/NL-CM:19.1.12/NL-CM:19.2.15). It is usually part of an assessment, which is represented using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) profile, which can be referred using `DocumentReference.context.related`. See the comment on the root of that profile for guidance on using this resource."
