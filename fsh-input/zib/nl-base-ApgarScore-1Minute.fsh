Profile: NlbaseApgarScore1Minute
Parent: Observation
Id: nl-base-ApgarScore-1Minute
Title: "nl base ApgarScore 1Minute"
* insert ProfileMetadata(nl-base-ApgarScore-1Minute)
* insert Purpose(ApgarScore, 1.0.1, Observation)

* code = http://loinc.org#9272-6
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    respiratoryScore 0..1 and
    appearanceScore 0..1 and
    pulseScore 0..1 and
    grimaceScore 0..1 and
    muscleToneScore 0..1
* component[respiratoryScore].code = http://loinc.org#32410-3
* component[respiratoryScore].value[x] only CodeableConcept
* component[respiratoryScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.16.1--20200901000000 (preferred)
* component[appearanceScore].code = http://loinc.org#32406-1
* component[appearanceScore].value[x] only CodeableConcept
* component[appearanceScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.16.4--20200901000000 (preferred)
* component[pulseScore].code = http://loinc.org#32407-9
* component[pulseScore].value[x] only CodeableConcept
* component[pulseScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.16.2--20200901000000 (preferred)
* component[grimaceScore].code = http://loinc.org#32409-5
* component[grimaceScore].value[x] only CodeableConcept
* component[grimaceScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.16.5--20200901000000 (preferred)
* component[muscleToneScore].code = http://loinc.org#32408-7
* component[muscleToneScore].value[x] only CodeableConcept
* component[muscleToneScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.16.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    The Apgar score represents the overall clinical status of a newborn child. This is evaluated one, five and ten minutes after birth based on 5 parameters: Appearance, Pulse, Grimace, Activity, Respiration. If the score measured at 5 minutes is < 8, the Apgar score is measured again at 10, 15, 20 minutes etc. until the score = 8.
    
    The zib explicitly defines the Apgar score at 1, 5 and 10 minutes after birth. This profile represents the Apgar score at 1 minute after birth. Profiles have also been defined for the Apgar score [at 5 minutes](http://nictiz.nl/fhir/StructureDefinition/zib-ApgarScore-5Minute) and [at 10 minutes](http://nictiz.nl/fhir/StructureDefinition/zib-ApgarScore-10Minute) after birth.
    """
* .
  * ^short = "ApgarScore"
  * ^alias[+] = "ApgarScore"
* effectiveDateTime
  * ^short = "ApgarScoreDateTime"
  * ^alias[+] = "ApgarScoreDatumTijd"
  * ^definition = "The day and time at which the Apgar score is registered."
* valueInteger
  * ^short = "ApgarScoreTotal"
  * ^alias[+] = "ApgarScoreTotaal"
  * ^definition = "Total of the Apgar score. The total score has a range from 0 - 10."
  * ^comment = "The individual scores are communicated using the different `Observation.component` slices. The ordinal values of these indivdual scores, which are used to calculate the total score, are defined by the underlying code system and are registered in the ValueSet resources bound on these slices, using the [ordinalValue](http://hl7.org/fhir/StructureDefinition/ordinalValue) extension."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the Apgar score."
* component[respiratoryScore].value[x]
  * ^short = "RespiratoryScore"
  * ^alias[+] = "AdemhalingScore"
  * ^definition = "The Apgar subscore for respiration."
* component[appearanceScore].value[x]
  * ^short = "AppearanceScore"
  * ^alias[+] = "HuidskleurScore"
  * ^definition = "The Apgar subscore for skin color/appearance."
* component[pulseScore].value[x]
  * ^short = "PulseScore"
  * ^alias[+] = "HartslagScore"
  * ^definition = "The Apgar subscore for pulse."
* component[grimaceScore].value[x]
  * ^short = "GrimaceScore"
  * ^alias[+] = "ReflexenScore"
  * ^definition = "The Apgar subscore for grimace."
* component[muscleToneScore].value[x]
  * ^short = "MuscleToneScore"
  * ^alias[+] = "SpierspanningScore"
  * ^definition = "The Apgar subscore for activity/muscle tone."

Mapping: NlbaseApgarScore1Minute-to-zib-apgarscore-v1.0.1-2020EN
Id: zib-apgarscore-v1.0.1-2020EN
Title: "zib ApgarScore-v1.0.1(2020EN)"
Source: NlbaseApgarScore1Minute
Target: "https://zibs.nl/wiki/ApgarScore-v1.0.1(2020EN)"
*  -> "NL-CM:12.16.1" "ApgarScore"
* effectiveDateTime -> "NL-CM:12.16.3" "ApgarScoreDateTime"
* valueInteger -> "NL-CM:12.16.2" "ApgarScoreTotal"
* note.text -> "NL-CM:12.16.9" "Comment"
* component[respiratoryScore].value[x] -> "NL-CM:12.16.4" "RespiratoryScore"
* component[appearanceScore].value[x] -> "NL-CM:12.16.7" "AppearanceScore"
* component[pulseScore].value[x] -> "NL-CM:12.16.5" "PulseScore"
* component[grimaceScore].value[x] -> "NL-CM:12.16.8" "GrimaceScore"
* component[muscleToneScore].value[x] -> "NL-CM:12.16.6" "MuscleToneScore"
