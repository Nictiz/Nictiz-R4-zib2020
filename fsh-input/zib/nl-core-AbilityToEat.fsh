Profile: NlcoreAbilityToEat
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToEat
Id: nl-core-AbilityToEat
Title: "nl core AbilityToEat"
* insert ProfileMetadata(nl-core-AbilityToEat)
* insert Purpose(AbilityToEat, 3.1.1, Observation)

* insert NlCorePatientForObservation
* valueCodeableConcept ^binding.strength = #required
* hasMember[eatingLimitations] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-AbilityToEat.EatingLimitations)

// Short, alias, definition and comment texts
* ^description = """
    Being able to independently prepare and consume food is part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including drinking, getting dressed and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* .
  * ^alias[+] = "nl-core-AbilityToEat"
  * ^comment = "The EatingLimitations concept (NL-CM:4.7.4) is represented using distinct Observation resources, using profile [nl-core-AbilityToEat.EatingLimitations](http://nictiz.nl/fhir/StructureDefinition/nl-core-AbilityToEat.EatingLimitations). It is referenced from this resource using `Observation.hasMember`."
