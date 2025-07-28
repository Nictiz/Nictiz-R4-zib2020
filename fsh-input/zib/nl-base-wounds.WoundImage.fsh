Profile: NlbasewoundsWoundImage
Parent: DocumentReference
Id: nl-base-wounds.WoundImage
Title: "nl base wounds.WoundImage"
* insert ProfileMetadata(nl-base-wounds.WoundImage)
* ^purpose = "This DocumentReference resource represents the WoundImage concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Burnwound v3.4 (2020)](https://zibs.nl/wiki/Burnwound-v3.4(2020EN)), the Dutch [zib PressureUlcer v3.4 (2020)](https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)) and the Dutch [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN)) (NL-CM:19.4.11/NL-CM:19.1.12/NL-CM:19.2.15)."

* type = http://loinc.org#72170-4
* context.related only Reference(Resource or http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics)

// Short, alias, definition and comment texts
* ^description = "A photo of the wound, burn wound or decubitus wound as visual information."
* . ^comment = "This DocumentReference resource represents the WoundImage concept of zibs Burnwound, PressureUlcer and Wound (NL-CM:19.4.11/NL-CM:19.1.12/NL-CM:19.2.15). It is usually part of an assessment, which is represented using the [nl-base-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics) profile, which can be referred using `DocumentReference.context.related`. See the comment on the root of that profile for guidance on using this resource."
* content.attachment
  * ^short = "WoundImage"
  * ^alias[+] = "WondFoto"
  * ^definition = "A photo of the wound, burn wound or decubitus wound as visual information."
* context.related ^comment = "The functional models of zibs Burnwound, PressureUlcer and Wound represent conditions that need to be tracked over time, but define point-in-time assessments about the current state of the wounds as well. For this reason, these three zibs are all mapped onto multiple resources: a Condition resource that represents the focal resource, and Observation and DocumentReference resources for all observable properties. See the root of this profile for guidance on using this model."

Mapping: NlbasewoundsWoundImage-to-zib-burnwound-v3.4-2020EN
Id: zib-burnwound-v3.4-2020EN
Title: "zib Burnwound-v3.4(2020EN)"
Source: NlbasewoundsWoundImage
Target: "https://zibs.nl/wiki/Burnwound-v3.4(2020EN)"
* content.attachment -> "NL-CM:19.4.11" "WoundImage"

Mapping: NlbasewoundsWoundImage-to-zib-pressureulcer-v3.4-2020EN
Id: zib-pressureulcer-v3.4-2020EN
Title: "zib PressureUlcer-v3.4(2020EN)"
Source: NlbasewoundsWoundImage
Target: "https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)"
* content.attachment -> "NL-CM:19.1.12" "WoundImage"

Mapping: NlbasewoundsWoundImage-to-zib-wound-v3.3-2020EN
Id: zib-wound-v3.3-2020EN
Title: "zib Wound-v3.3(2020EN)"
Source: NlbasewoundsWoundImage
Target: "https://zibs.nl/wiki/Wound-v3.3(2020EN)"
* content.attachment -> "NL-CM:19.2.15" "WoundImage"
