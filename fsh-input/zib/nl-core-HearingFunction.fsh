Profile: NlcoreHearingFunction
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-HearingFunction
Id: nl-core-HearingFunction
Title: "nl core HearingFunction"
* insert ProfileMetadata(nl-core-HearingFunction)
* insert Purpose(HearingFunction, 3.2, Observation)

* extension[hearingAid].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/Resource or http://nictiz.nl/fhir/StructureDefinition/nl-core-HearingFunction.HearingAid)
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.17.1--20200901000000 (required)
* note ..1

// Short, alias, definition and comment texts
* ^description = """
    Hearing is the ability to observe sound, with the purpose of communicating with others, localizing the source of the sound and recognizing certain sounds. This pertains to observing the sound waves, and not processing the sounds in the brain.
    A hearing disorder can lead to things including communication problems.
    """
* . ^alias[+] = "nl-core-HearingFunction"
