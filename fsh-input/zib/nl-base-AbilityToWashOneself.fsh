Profile: NlbaseAbilityToWashOneself
Parent: Observation
Id: nl-base-AbilityToWashOneself
Title: "nl base AbilityToWashOneself"
* insert ProfileMetadata(nl-base-AbilityToWashOneself)
* insert Purpose(AbilityToWashOneself, 3.1.1, Observation)

* code = http://snomed.info/sct#284785009
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.10.1--20200901000000 (preferred)
* component insert Discriminator(value, code)
* component contains
    bodyPartToBeBathed 0..
* component[bodyPartToBeBathed].code = http://snomed.info/sct#38866009
* component[bodyPartToBeBathed].value[x] only CodeableConcept
* component[bodyPartToBeBathed].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.10.2--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    Being able to bathe independently is part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including eating, drinking, and dressing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* .
  * ^short = "AbilityToWashOneself"
  * ^alias[+] = "VermogenTotZichWassen"
* valueCodeableConcept
  * ^short = "BathingOneself"
  * ^alias[+] = "ZichWassen"
  * ^definition = """
    The washing and drying of the entire body, or body parts, such as bathing, showering, washing of hands and feet, face and hair. 
    The BodyPartToBeBathed concept offers the option to specify to which part of the body the limitation applies.
    """
* component[bodyPartToBeBathed].value[x]
  * ^short = "BodyPartToBeBathed"
  * ^alias[+] = "TeWassenLichaamsdeel"
  * ^definition = "The part or parts of the body for which help bathing is wanted/necessary."

Mapping: NlbaseAbilityToWashOneself-to-zib-abilitytowashoneself-v3.1.1-2020EN
Id: zib-abilitytowashoneself-v3.1.1-2020EN
Title: "zib AbilityToWashOneself-v3.1.1(2020EN)"
Source: NlbaseAbilityToWashOneself
Target: "https://zibs.nl/wiki/AbilityToWashOneself-v3.1.1(2020EN)"
*  -> "NL-CM:4.10.1" "AbilityToWashOneself"
* valueCodeableConcept -> "NL-CM:4.10.2" "BathingOneself"
* component[bodyPartToBeBathed].value[x] -> "NL-CM:4.10.3" "BodyPartToBeBathed"
