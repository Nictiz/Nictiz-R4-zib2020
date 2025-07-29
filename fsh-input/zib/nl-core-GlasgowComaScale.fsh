Profile: NlcoreGlasgowComaScale
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-GlasgowComaScale
Id: nl-core-GlasgowComaScale
Title: "nl core GlasgowComaScale"
* insert ProfileMetadata(nl-core-GlasgowComaScale)
* insert Purpose(GlasgowComaScale, 3.2, Observation)

* note ..1
* component[gcsEyes] ..1
* component[gcsEyes].value[x] ^binding.strength = #required
* component[gcsMotor] ..1
* component[gcsMotor].value[x] ^binding.strength = #required
* component[gcsVerbal] ..1
* component[gcsVerbal].value[x] ^binding.strength = #required
* component[conditionsDuringMeasurement].value[x] ^binding.strength = #extensible

// Short, alias, definition and comment texts
* ^description = """
    Fifteen-point scale for expressing a person’s level of consciousness, from fully awake to deep unconsciousness, in a number: the so-called EMV score.
    The Glasgow Coma Scale score or EMV (Eye-Motor-Verbal) score is a scale to measure the extent of consciousness, based on eye, verbal and motor responses to specific prescribed sound and pain stimuli.
    """
* . ^alias[+] = "nl-core-GlasgowComaScale"
