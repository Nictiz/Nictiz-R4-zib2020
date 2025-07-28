Profile: NlbaseWoundWoundMoisture
Parent: Observation
Id: nl-base-Wound.WoundMoisture
Title: "nl base Wound.WoundMoisture"
* insert ProfileMetadata(nl-base-Wound.WoundMoisture)
* ^purpose = "This Observation resource represents the WoundMoisture concept (NL-CM:19.2.6) of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN))."

* code = http://snomed.info/sct#298007001
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.19.2.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Description of the moisture in the wound."
* . ^comment = "This Observation resource represents the WoundMoisture concept (NL-CM:19.2.6) of zib Wound. It is usually part of an assessment, which is represented using the [nl-base-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
* value[x]
  * ^short = "WoundMoisture"
  * ^alias[+] = "WondVochtigheid"
  * ^definition = "Description of the moisture in the wound."

Mapping: NlbaseWoundWoundMoisture-to-zib-wound-v3.3-2020EN
Id: zib-wound-v3.3-2020EN
Title: "zib Wound-v3.3(2020EN)"
Source: NlbaseWoundWoundMoisture
Target: "https://zibs.nl/wiki/Wound-v3.3(2020EN)"
* value[x] -> "NL-CM:19.2.6" "WoundMoisture"
