Profile: NlbaseAbilityToGroom
Parent: Observation
Id: nl-base-AbilityToGroom
Title: "nl base AbilityToGroom"
* insert ProfileMetadata(nl-base-AbilityToGroom)
* insert Purpose(AbilityToGroom, 1.0.1, Observation)

* code = http://snomed.info/sct#704434006
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.33.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    Personal grooming activity means taking care of skin, nails and hair (and beard or mustache, if applicable). This is a part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself. Washing hair does not fall into this category; it falls under the ability to wash oneself.
    This activity and activities such as those including eating, getting dressed and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* .
  * ^short = "AbilityToGroom"
  * ^alias[+] = "VermogenTotUiterlijkeVerzorging"
* valueCodeableConcept
  * ^short = "Grooming"
  * ^alias[+] = "UiterlijkeVerzorging"
  * ^definition = "Personal grooming includes tending to hair and facial hair, such as combing it, or shaving and/or trimming facial hair; skincare, e.g. using make-up; nailcare."

Mapping: NlbaseAbilityToGroom-to-zib-abilitytogroom-v1.0.1-2020EN
Id: zib-abilitytogroom-v1.0.1-2020EN
Title: "zib AbilityToGroom-v1.0.1(2020EN)"
Source: NlbaseAbilityToGroom
Target: "https://zibs.nl/wiki/AbilityToGroom-v1.0.1(2020EN)"
*  -> "NL-CM:4.33.1" "AbilityToGroom"
* valueCodeableConcept -> "NL-CM:4.33.2" "Grooming"
