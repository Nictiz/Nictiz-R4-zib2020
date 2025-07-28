Profile: NlcoreAbilityToUseToilet
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToUseToilet
Id: nl-core-AbilityToUseToilet
Title: "nl core AbilityToUseToilet"
* insert ProfileMetadata(nl-core-AbilityToUseToilet)
* insert Purpose(AbilityToUseToilet, 3.1.1, Observation)

* hasMember[toiletUse] ..1
* hasMember[menstrualCare] ..1

// Short, alias, definition and comment texts
* ^description = """
    Being able to urinate, defecate and keep up hygiene during a menstrual cycle independently is part of self-care. Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including eating, getting dressed and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    """
* .
  * ^alias[+] = "nl-core-AbilityToUseToilet"
  * ^comment = """
    Several concepts of zib AbilityToUseToillet are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * ToiletUse (NL-CM:4.22.6): [nl-core-AbilityToUseToilet.ToiletUse](http://nictiz.nl/fhir/StructureDefinition/nl-core-AbilityToUseToilet.ToiletUse)
    * MenstrualCare (NL-CM:4.22.4): [nl-core-AbilityToUseToilet.MenstrualCare](http://nictiz.nl/fhir/StructureDefinition/nl-core-AbilityToUseToilet.MenstrualCare)
    """
