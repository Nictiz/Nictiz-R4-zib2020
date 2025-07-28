Profile: NlcoreAbilityToWashOneself
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToWashOneself
Id: nl-core-AbilityToWashOneself
Title: "nl core AbilityToWashOneself"
* insert ProfileMetadata(nl-core-AbilityToWashOneself)
* insert Purpose(AbilityToWashOneself, 3.1.1, Observation)

* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.10.1--20200901000000 (required)
* component[bodyPartToBeBathed].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.10.2--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    Being able to bathe independently is part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including eating, drinking, and dressing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* . ^alias[+] = "nl-core-AbilityToWashOneself"
