Profile: NlbaseAbilityToUseToilet
Parent: Observation
Id: nl-base-AbilityToUseToilet
Title: "nl base AbilityToUseToilet"
* insert ProfileMetadata(nl-base-AbilityToUseToilet)
* insert Purpose(AbilityToUseToilet, 3.1.1, Observation)

* code = http://snomed.info/sct#284779002
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    toiletUse 0..1 and
    menstrualCare 0..1
* hasMember[toiletUse] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToUseToilet.ToiletUse)
* hasMember[menstrualCare] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToUseToilet.MenstrualCare)

// Short, alias, definition and comment texts
* ^description = """
    Being able to urinate, defecate and keep up hygiene during a menstrual cycle independently is part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including eating, getting dressed and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* .
  * ^short = "AbilityToUseToilet"
  * ^alias[+] = "VermogenTotToiletgang"
  * ^comment = """
    Several concepts of zib AbilityToUseToillet are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * ToiletUse (NL-CM:4.22.6): [nl-base-AbilityToUseToilet.ToiletUse](http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToUseToilet.ToiletUse)
    * MenstrualCare (NL-CM:4.22.4): [nl-base-AbilityToUseToilet.MenstrualCare](http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToUseToilet.MenstrualCare)
    """
* hasMember[toiletUse] ^definition = "The ToiletUse concept (NL-CM:4.22.6) of zib AbilityToUseToilet, represented as a distinct Observation resource."
* hasMember[menstrualCare] ^definition = "The MenstrualCare concept (NL-CM:4.22.4) of zib AbilityToUseToilet, represented as a distinct Observation resource."

Mapping: NlbaseAbilityToUseToilet-to-zib-abilitytousetoilet-v3.1.1-2020EN
Id: zib-abilitytousetoilet-v3.1.1-2020EN
Title: "zib AbilityToUseToilet-v3.1.1(2020EN)"
Source: NlbaseAbilityToUseToilet
Target: "https://zibs.nl/wiki/AbilityToUseToilet-v3.1.1(2020EN)"
*  -> "NL-CM:4.22.1" "AbilityToUseToilet"
