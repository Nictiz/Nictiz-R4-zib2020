Profile: NlbaseAbilityToDrink
Parent: Observation
Id: nl-base-AbilityToDrink
Title: "nl base AbilityToDrink"
* insert ProfileMetadata(nl-base-AbilityToDrink)
* insert Purpose(AbilityToDrink, 3.1.1, Observation)

* code = http://snomed.info/sct#288852001
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.8.1--20200901000000 (preferred)
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    drinkingLimitations 0..
* hasMember[drinkingLimitations] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToDrink.DrinkingLimitations)

// Short, alias, definition and comment texts
* ^description = """
    Being able to independently prepare and drink beverages is part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including eating, getting dressed and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* .
  * ^short = "AbilityToDrink"
  * ^alias[+] = "VermogenTotDrinken"
  * ^comment = "The DrinkingLimitations concept (NL-CM:4.8.4) is represented using distinct Observation resources, using profile [nl-base-AbilityToDrink.DrinkingLimitations](http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToDrink.DrinkingLimitations). It is referenced from this resource using `Observation.hasMember`."
* valueCodeableConcept
  * ^short = "Drinking"
  * ^alias[+] = "Drinken"
  * ^definition = "Taking fluids during meals and during the day or when thirsty."
* hasMember[drinkingLimitations] ^definition = "The DrinkingLimitations concept (NL-CM:4.8.4) of zib AbilityToDrink, represented as a distinct Observation resource."

Mapping: NlbaseAbilityToDrink-to-zib-abilitytodrink-v3.1.1-2020EN
Id: zib-abilitytodrink-v3.1.1-2020EN
Title: "zib AbilityToDrink-v3.1.1(2020EN)"
Source: NlbaseAbilityToDrink
Target: "https://zibs.nl/wiki/AbilityToDrink-v3.1.1(2020EN)"
*  -> "NL-CM:4.8.1" "AbilityToDrink"
* valueCodeableConcept -> "NL-CM:4.8.3" "Drinking"
