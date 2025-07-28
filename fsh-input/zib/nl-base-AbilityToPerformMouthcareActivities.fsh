Profile: NlbaseAbilityToPerformMouthcareActivities
Parent: Observation
Id: nl-base-AbilityToPerformMouthcareActivities
Title: "nl base AbilityToPerformMouthcareActivities"
* insert ProfileMetadata(nl-base-AbilityToPerformMouthcareActivities)
* insert Purpose(AbilityToPerformMouthcareActivities, 3.1, Observation)

* extension contains
    http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo named prosthesis 0..*
* extension[prosthesis].value[x] only Reference(Resource or http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToPerformMouthcareActivities.Prosthesis)
* code = http://snomed.info/sct#288470005
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.13.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    The ability to perform mouthcare activities is part of self-care. This includes brushing teeth twice a day with fluoride toothpaste and/or cleaning (partial) dentures, cleaning jaws without teeth (edentulous jaws) and taking care of the mucous membrane of the mouth.
    Limitations in this ability indicate a reduced ability to cope for oneself.
    This activity and activities such as those including eating, getting dressed and bathing are also known as activities of daily living (ADL). These are the activities people go through in daily life. The extent to which a person is able to do all these activities by themselves is a measure for their total ability to do things independently.
    
    (Source: Instruction card for oral hygiene, 2011)
    """
* .
  * ^short = "AbilityToPerformMouthcareActivities"
  * ^alias[+] = "VermogenTotMondverzorging"
* extension[prosthesis].value[x]
  * ^short = "Prosthesis"
  * ^alias[+] = "Prothese"
  * ^definition = "Information on the dental aids used by the patient."
* valueCodeableConcept
  * ^short = "DentalHygiene"
  * ^alias[+] = "VerzorgenTanden"
  * ^definition = "Taking care of mouth and teeth/molars or dentures."

Mapping: NlbaseAbilityToPerformMouthcareActivities-to-zib-abilitytoperformmouthcareactivities-v3.1-2020EN
Id: zib-abilitytoperformmouthcareactivities-v3.1-2020EN
Title: "zib AbilityToPerformMouthcareActivities-v3.1(2020EN)"
Source: NlbaseAbilityToPerformMouthcareActivities
Target: "https://zibs.nl/wiki/AbilityToPerformMouthcareActivities-v3.1(2020EN)"
*  -> "NL-CM:4.13.1" "AbilityToPerformMouthcareActivities"
* extension[prosthesis].value[x] -> "NL-CM:4.13.4" "Prosthesis"
* valueCodeableConcept -> "NL-CM:4.13.2" "DentalHygiene"
