Profile: NlcoreAbilityToGroom
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToGroom
Id: nl-core-AbilityToGroom
Title: "nl core AbilityToGroom"
* insert ProfileMetadata(nl-core-AbilityToGroom)
* insert Purpose(AbilityToGroom, 1.0.1, Observation)

* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.33.1--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    Personal grooming activity means taking care of skin, nails and hair (and beard or mustache, if applicable). This is a part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself. Washing hair does not fall into this category; it falls under the ability to wash oneself.
    This activity and activities such as those including eating, getting dressed and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* . ^alias[+] = "nl-core-AbilityToGroom"
