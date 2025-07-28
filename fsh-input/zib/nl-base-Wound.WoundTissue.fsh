Profile: NlbaseWoundWoundTissue
Parent: Observation
Id: nl-base-Wound.WoundTissue
Title: "nl base Wound.WoundTissue"
* insert ProfileMetadata(nl-base-Wound.WoundTissue)
* ^purpose = "This Observation resource represents the WoundTissue concept (NL-CM:19.2.4) of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN))."

* code = http://snomed.info/sct#148641000146109
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.21--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Description of the tissue of the wound."
* . ^comment = "This Observation resource represents the WoundTissue concept (NL-CM:19.2.4) of zib Wound. It is usually part of an assessment, which is represented using the [nl-base-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
* code ^comment = "The code to identify this concept (SNOMED 148641000146109) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-2100](https://bits.nictiz.nl/browse/ZIB-2100) for more information."
* value[x]
  * ^short = "WoundTissue"
  * ^alias[+] = "WondWeefsel"
  * ^definition = "Description of the tissue of the wound. For this, the WCS model can be used. A different classification is used for oncological ulcers."

Mapping: NlbaseWoundWoundTissue-to-zib-wound-v3.3-2020EN
Id: zib-wound-v3.3-2020EN
Title: "zib Wound-v3.3(2020EN)"
Source: NlbaseWoundWoundTissue
Target: "https://zibs.nl/wiki/Wound-v3.3(2020EN)"
* value[x] -> "NL-CM:19.2.4" "WoundTissue"
