Profile: NlbaseAbilityToDressOneself
Parent: Observation
Id: nl-base-AbilityToDressOneself
Title: "nl base AbilityToDressOneself"
* insert ProfileMetadata(nl-base-AbilityToDressOneself)
* insert Purpose(AbilityToDressOneself, 3.1.1, Observation)

* code = http://snomed.info/sct#165235000
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.11.1--20200901000000 (preferred)
* component insert Discriminator(value, code)
* component contains
    bodyPartToBeDressed 0..
* component[bodyPartToBeDressed].code = http://snomed.info/sct#38866009
* component[bodyPartToBeDressed].value[x] only CodeableConcept
* component[bodyPartToBeDressed].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.11.2--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    Being able to get dressed independently is part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including eating, drinking, and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* .
  * ^short = "AbilityToDressOneself"
  * ^alias[+] = "VermogenTotZichKleden"
* valueCodeableConcept
  * ^short = "DressingOneself"
  * ^alias[+] = "ZichKleden"
  * ^definition = """
    Putting on or removing clothes. 
    The BodyPartToBeDressed concept offers the option to specify to which part of the body the limitation applies.
    """
* component[bodyPartToBeDressed].value[x]
  * ^short = "BodyPartToBeDressed"
  * ^alias[+] = "TeKledenLichaamsdeel"
  * ^definition = "The part or parts of the body for which help getting dressed is wanted/necessary."

Mapping: NlbaseAbilityToDressOneself-to-zib-abilitytodressoneself-v3.1.1-2020EN
Id: zib-abilitytodressoneself-v3.1.1-2020EN
Title: "zib AbilityToDressOneself-v3.1.1(2020EN)"
Source: NlbaseAbilityToDressOneself
Target: "https://zibs.nl/wiki/AbilityToDressOneself-v3.1.1(2020EN)"
*  -> "NL-CM:4.11.1" "AbilityToDressOneself"
* valueCodeableConcept -> "NL-CM:4.11.2" "DressingOneself"
* component[bodyPartToBeDressed].value[x] -> "NL-CM:4.11.3" "BodyPartToBeDressed"
