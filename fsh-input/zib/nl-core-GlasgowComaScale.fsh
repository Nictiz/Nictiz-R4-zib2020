Profile: NlcoreGlasgowComaScale
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-GlasgowComaScale
Id: nl-core-GlasgowComaScale
Title: "nl core GlasgowComaScale"
* insert ProfileMetadata(nl-core-GlasgowComaScale)
* insert Purpose(GlasgowComaScale, 3.2, Observation)

* note ..1
* component[gcsEyes] ..1
* component[gcsEyes].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.8.1--20200901000000 (required)
* component[gcsMotor] ..1
* component[gcsMotor].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.5--20200901000000 (required)
* component[gcsVerbal] ..1
* component[gcsVerbal].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.6--20200901000000 (required)
* component[conditionsDuringMeasurement].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.8.6--20200901000000 (extensible)

// Short, alias, definition and comment texts
* ^description = """
    Fifteen-point scale for expressing a person’s level of consciousness, from fully awake to deep unconsciousness, in a number: the so-called EMV score.
    The Glasgow Coma Scale score or EMV (Eye-Motor-Verbal) score is a scale to measure the extent of consciousness, based on eye, verbal and motor responses to specific prescribed sound and pain stimuli.
    """
* . ^alias[+] = "nl-core-GlasgowComaScale"
