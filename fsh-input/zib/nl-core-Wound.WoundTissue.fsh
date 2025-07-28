Profile: NlcoreWoundWoundTissue
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound.WoundTissue
Id: nl-core-Wound.WoundTissue
Title: "nl core Wound.WoundTissue"
* insert ProfileMetadata(nl-core-Wound.WoundTissue)
* ^purpose = "This Observation resource represents the WoundTissue concept (NL-CM:19.2.4) of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN))."

* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.21--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "Description of the tissue of the wound."
* .
  * ^alias[+] = "nl-core-Wound.WoundTissue"
  * ^comment = "This Observation resource represents the WoundTissue concept (NL-CM:19.2.4) of zib Wound. It is usually part of an assessment, which is represented using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
