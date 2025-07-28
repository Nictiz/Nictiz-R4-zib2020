Profile: NlcoreAbilityToDressOneself
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToDressOneself
Id: nl-core-AbilityToDressOneself
Title: "nl core AbilityToDressOneself"
* insert ProfileMetadata(nl-core-AbilityToDressOneself)
* insert Purpose(AbilityToDressOneself, 3.1.1, Observation)

* insert NlCorePatientForObservation
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.11.1--20200901000000 (required)
* component[bodyPartToBeDressed].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.11.2--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    Being able to get dressed independently is part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including eating, drinking, and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* . ^alias[+] = "nl-core-AbilityToDressOneself"
