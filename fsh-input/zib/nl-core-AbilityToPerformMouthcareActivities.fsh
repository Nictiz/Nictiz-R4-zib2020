Profile: NlcoreAbilityToPerformMouthcareActivities
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToPerformMouthcareActivities
Id: nl-core-AbilityToPerformMouthcareActivities
Title: "nl core AbilityToPerformMouthcareActivities"
* insert ProfileMetadata(nl-core-AbilityToPerformMouthcareActivities)
* insert Purpose(AbilityToPerformMouthcareActivities, 3.1, Observation)

* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.13.1--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    The ability to perform mouthcare activities is part of self-care. This includes brushing teeth twice a day with fluoride toothpaste and/or cleaning (partial) dentures, cleaning jaws without teeth (edentulous jaws) and taking care of the mucous membrane of the mouth.
    Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including eating, getting dressed and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    
    (Source: Instruction card for oral hygiene, 2011)
    """
* . ^alias[+] = "nl-core-AbilityToPerformMouthcareActivities"
