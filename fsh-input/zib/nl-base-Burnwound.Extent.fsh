Profile: NlbaseBurnwoundExtent
Parent: Observation
Id: nl-base-Burnwound.Extent
Title: "nl base Burnwound.Extent"
* insert ProfileMetadata(nl-base-Burnwound.Extent)
* ^purpose = "This Observation resource represents the Extent concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Burnwound v3.4 (2020)](https://zibs.nl/wiki/Burnwound-v3.4(2020EN))."

* code = http://snomed.info/sct#360531000146101
* value[x] only Quantity

// Short, alias, definition and comment texts
* ^description = "The extent of a burn wound is indicated in a percentage of the ‘Total Body Surface Area’ (TBSA)."
* . ^comment = "This Observation resource represents the Extent concept (NL-CM:19.4.7) of zib Burnwound. It is usually part of an assessment, which is represented using the [nl-base-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
* value[x]
  * ^short = "Extent"
  * ^alias[+] = "Uitgebreidheid"
  * ^definition = """
    The extent of a burn wound is indicated in a percentage of the ‘Total Body Surface Area’ (TBSA). For adults, the TBSA can be calculated on the basis of the ‘rule of nines’, in which body parts are expressed in the percentage 9 and multiples of 9. This ‘rule of nines’ cannot be used for children because a child’s body proportions are different from those of an adult. For children, separate tables were developed per age group to determine the extent of burn wounds. Another option is measuring the extent using the patient’s hand surface area. The surface area of a patient’s hand (including the fingers) equals approximately 1% of their total body surface area.
    (Source: Brandwonden genezen. Hoe verder? [Healing Burn Wounds. What now?)
    """

Mapping: NlbaseBurnwoundExtent-to-zib-burnwound-v3.4-2020EN
Id: zib-burnwound-v3.4-2020EN
Title: "zib Burnwound-v3.4(2020EN)"
Source: NlbaseBurnwoundExtent
Target: "https://zibs.nl/wiki/Burnwound-v3.4(2020EN)"
* value[x] -> "NL-CM:19.4.7" "Extent"
