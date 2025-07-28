Profile: NlbaseHearingFunction
Parent: Observation
Id: nl-base-HearingFunction
Title: "nl base HearingFunction"
* insert ProfileMetadata(nl-base-HearingFunction)
* insert Purpose(HearingFunction, 3.2, Observation)

* extension contains
    http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo named hearingAid 0..*
* extension[hearingAid].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/Resource or http://nictiz.nl/fhir/StructureDefinition/nl-base-HearingFunction.HearingAid)
* code = http://snomed.info/sct#47078008
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.17.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    Hearing is the ability to observe sound, with the purpose of communicating with others, localizing the source of the sound and recognizing certain sounds. This pertains to observing the sound waves, and not processing the sounds in the brain.
    A hearing disorder can lead to things including communication problems.
    """
* .
  * ^short = "HearingFunction"
  * ^alias[+] = "FunctieHoren"
* extension[hearingAid].value[x]
  * ^short = "HearingAid"
  * ^alias[+] = "HorenHulpmiddel"
  * ^definition = "The medical aid used to help the patient hear."
* valueCodeableConcept
  * ^short = "HearingFunction"
  * ^alias[+] = "HoorFunctie"
  * ^definition = "The faculty of hearing due to responses to stimuli from auditory organs, capacity to hear."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the hearing function."

Mapping: NlbaseHearingFunction-to-zib-hearingfunction-v3.2-2020EN
Id: zib-hearingfunction-v3.2-2020EN
Title: "zib HearingFunction-v3.2(2020EN)"
Source: NlbaseHearingFunction
Target: "https://zibs.nl/wiki/HearingFunction-v3.2(2020EN)"
*  -> "NL-CM:4.17.1" "HearingFunction"
* extension[hearingAid].value[x] -> "NL-CM:4.17.4" "HearingAid"
* valueCodeableConcept -> "NL-CM:4.17.3" "HearingFunction"
* note.text -> "NL-CM:4.17.2" "Comment"
