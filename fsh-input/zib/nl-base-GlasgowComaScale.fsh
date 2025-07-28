Profile: NlbaseGlasgowComaScale
Parent: Observation
Id: nl-base-GlasgowComaScale
Title: "nl base GlasgowComaScale"
* insert ProfileMetadata(nl-base-GlasgowComaScale)
* insert Purpose(GlasgowComaScale, 3.2, Observation)

* code = http://loinc.org#35088-4
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    gcsEyes 0..1 and
    gcsMotor 0..1 and
    gcsVerbal 0..1 and
    conditionsDuringMeasurement 0..
* component[gcsEyes].code = http://snomed.info/sct#281395000
* component[gcsEyes].value[x] only CodeableConcept
* component[gcsEyes].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.8.1--20200901000000 (preferred)
* component[gcsMotor].code = http://snomed.info/sct#281396004
* component[gcsMotor].value[x] only CodeableConcept
* component[gcsMotor].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.5--20200901000000 (preferred)
* component[gcsVerbal].code = http://snomed.info/sct#281397008
* component[gcsVerbal].value[x] only CodeableConcept
* component[gcsVerbal].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.6--20200901000000 (preferred)
* component[conditionsDuringMeasurement].code = http://snomed.info/sct#271000124103
* component[conditionsDuringMeasurement].value[x] only CodeableConcept
* component[conditionsDuringMeasurement].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.8.6--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    Fifteen-point scale for expressing a person’s level of consciousness, from fully awake to deep unconsciousness, in a number: the so-called EMV score.
    The Glasgow Coma Scale score or EMV (Eye-Motor-Verbal) score is a scale to measure the extent of consciousness, based on eye, verbal and motor responses to specific prescribed sound and pain stimuli.
    """
* .
  * ^short = "GlasgowComaScale"
  * ^alias[+] = "GlasgowComaScale"
* effectiveDateTime
  * ^short = "GlasgowComaScaleDateTime"
  * ^alias[+] = "GlasgowComaScaleDatumTijd"
  * ^definition = "Time at which the EMV score was determined."
* valueInteger
  * ^short = "TotalScore"
  * ^alias[+] = "TotaalScore"
  * ^definition = "The sum of the EMV scores, expressed as a number on a scale from 3-15. The value does not have to be recorded, as it can always be calculated based on the individual scores, and as recording the total is not common for a difficult to determine individual score."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on (the context of) the EMV score measurement, such as any problems or factors that may influence interpretation."
* component[gcsEyes].value[x]
  * ^short = "GCS_Eyes"
  * ^alias[+] = "GCS_Eyes"
  * ^definition = "Best eye response to a stimulus. The element is mandatory, but does not require a numerical value. If no value is given, the reason for this is to be provided in the ConditionsDuringMeasurement concept."
* component[gcsMotor].value[x]
  * ^short = "GCS_Motor"
  * ^alias[+] = "GCS_Motor"
  * ^definition = "Best motor response to a stimulus. The element is mandatory, but does not require a numerical value. If no value is given, the reason for this is to be provided in the ConditionsDuringMeasurement concept."
* component[gcsVerbal].value[x]
  * ^short = "GCS_Verbal"
  * ^alias[+] = "GCS_Verbal"
  * ^definition = "Best verbal response to a stimulus. The element is mandatory, but does not require a numerical value. If no value is given, the reason for this is to be provided in the ConditionsDuringMeasurement concept."
* component[conditionsDuringMeasurement].code ^comment = "The code to identify this concept (SNOMED 271000124103) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-2040](https://bits.nictiz.nl/browse/ZIB-2040) for more information."
* component[conditionsDuringMeasurement].value[x]
  * ^short = "ConditionsDuringMeasurement"
  * ^alias[+] = "ConditiesTijdensMeting"
  * ^definition = "Conditions during the measurement that prevent one or more of the subscores from being determined (non testable), such as,e.g. intubation during testing of GCS_Verbal."

Mapping: NlbaseGlasgowComaScale-to-zib-glasgowcomascale-v3.2-2020EN
Id: zib-glasgowcomascale-v3.2-2020EN
Title: "zib GlasgowComaScale-v3.2(2020EN)"
Source: NlbaseGlasgowComaScale
Target: "https://zibs.nl/wiki/GlasgowComaScale-v3.2(2020EN)"
*  -> "NL-CM:12.8.1" "GlasgowComaScale"
* effectiveDateTime -> "NL-CM:12.8.8" "GlasgowComaScaleDateTime"
* valueInteger -> "NL-CM:12.8.10" "TotalScore"
* note.text -> "NL-CM:12.8.9" "Comment"
* component[gcsEyes].value[x] -> "NL-CM:12.8.2" "GCS_Eyes"
* component[gcsMotor].value[x] -> "NL-CM:12.8.4" "GCS_Motor"
* component[gcsVerbal].value[x] -> "NL-CM:12.8.6" "GCS_Verbal"
* component[conditionsDuringMeasurement].value[x] -> "NL-CM:12.8.11" "ConditionsDuringMeasurement"
