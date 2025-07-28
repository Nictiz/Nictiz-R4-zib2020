Profile: NlcoreWoundWoundEdge
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound.WoundEdge
Id: nl-core-Wound.WoundEdge
Title: "nl core Wound.WoundEdge"
* insert ProfileMetadata(nl-core-Wound.WoundEdge)
* ^purpose = "This Observation resource represents the WoundEdge concept (NL-CM:19.2.11) of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN))."

* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.19.2.5--20200901000000 (extensible)

// Short, alias, definition and comment texts
* ^description = "Description of the condition of the outer edges of the wound."
* .
  * ^alias[+] = "nl-core-Wound.WoundEdge"
  * ^comment = "This Observation resource represents the WoundEdge concept (NL-CM:19.2.11) of zib Wound. It is usually part of an assessment, which is represented using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
