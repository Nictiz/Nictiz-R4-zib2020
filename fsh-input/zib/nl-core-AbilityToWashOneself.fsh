Profile: NlcoreAbilityToWashOneself
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToWashOneself
Id: nl-core-AbilityToWashOneself
Title: "nl core AbilityToWashOneself"
* insert ProfileMetadata(nl-core-AbilityToWashOneself)
* insert Purpose(AbilityToWashOneself, 3.1.1, Observation)

* insert NlCorePatientForObservation
* valueCodeableConcept ^binding.strength = #required
* component[bodyPartToBeBathed].value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    Being able to bathe independently is part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including eating, drinking, and dressing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* . ^alias[+] = "nl-core-AbilityToWashOneself"
