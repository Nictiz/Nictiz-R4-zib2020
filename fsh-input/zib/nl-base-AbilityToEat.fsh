Profile: NlbaseAbilityToEat
Parent: Observation
Id: nl-base-AbilityToEat
Title: "nl base AbilityToEat"
* insert ProfileMetadata(nl-base-AbilityToEat)
* insert Purpose(AbilityToEat, 3.1.1, Observation)

* code = http://snomed.info/sct#288883002
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.7.1--20200901000000 (preferred)
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    eatingLimitations 0..
* hasMember[eatingLimitations] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToEat.EatingLimitations)

// Short, alias, definition and comment texts
* ^description = """
    Being able to independently prepare and consume food is part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including drinking, getting dressed and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* .
  * ^short = "AbilityToEat"
  * ^alias[+] = "VermogenTotEten"
  * ^comment = "The EatingLimitations concept (NL-CM:4.7.4) is represented using distinct Observation resources, using profile [nl-base-AbilityToEat.EatingLimitations](http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToEat.EatingLimitations). It is referenced from this resource using `Observation.hasMember`."
* valueCodeableConcept
  * ^short = "Eating"
  * ^alias[+] = "Eten"
  * ^definition = "Feeding oneself: bringing food to the mouth and feeding oneself until satisfied."
* hasMember[eatingLimitations] ^definition = "The EatingLimitations concept (NL-CM:4.7.4) of zib AbilityToEat, represented as a distinct Observation resource."

Mapping: NlbaseAbilityToEat-to-zib-abilitytoeat-v3.1.1-2020EN
Id: zib-abilitytoeat-v3.1.1-2020EN
Title: "zib AbilityToEat-v3.1.1(2020EN)"
Source: NlbaseAbilityToEat
Target: "https://zibs.nl/wiki/AbilityToEat-v3.1.1(2020EN)"
*  -> "NL-CM:4.7.1" "AbilityToEat"
* valueCodeableConcept -> "NL-CM:4.7.3" "Eating"
