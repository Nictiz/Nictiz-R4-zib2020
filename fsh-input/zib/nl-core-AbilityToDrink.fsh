Profile: NlcoreAbilityToDrink
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToDrink
Id: nl-core-AbilityToDrink
Title: "nl core AbilityToDrink"
* insert ProfileMetadata(nl-core-AbilityToDrink)
* insert Purpose(AbilityToDrink, 3.1.1, Observation)

* insert NlCorePatientForObservation
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.8.1--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    Being able to independently prepare and drink beverages is part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including eating, getting dressed and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* .
  * ^alias[+] = "nl-core-AbilityToDrink"
  * ^comment = "The DrinkingLimitations concept (NL-CM:4.8.4) is represented using distinct Observation resources, using profile [nl-core-AbilityToDrink.DrinkingLimitations](http://nictiz.nl/fhir/StructureDefinition/nl-core-AbilityToDrink.DrinkingLimitations). It is referenced from this resource using `Observation.hasMember`."
