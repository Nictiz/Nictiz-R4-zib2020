Profile: NlbaseComfortScale
Parent: Observation
Id: nl-base-ComfortScale
Title: "nl base ComfortScale"
* insert ProfileMetadata(nl-base-ComfortScale)
* insert Purpose(ComfortScale, 1.1, Observation)

* code = http://snomed.info/sct#108301000146109
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    alertness 0..1 and
    calmnessAgitation 0..1 and
    respiratoryResponse 0..1 and
    crying 0..1 and
    bodyMovement 0..1 and
    facialTone 0..1 and
    bodyMuscleTone 0..1
* component[alertness].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12012003
* component[alertness].value[x] only CodeableConcept
* component[alertness].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.1--20200901000000 (preferred)
* component[calmnessAgitation].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12012004
* component[calmnessAgitation].value[x] only CodeableConcept
* component[calmnessAgitation].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.2--20200901000000 (preferred)
* component[respiratoryResponse].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12012005
* component[respiratoryResponse].value[x] only CodeableConcept
* component[respiratoryResponse].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.3--20200901000000 (preferred)
* component[crying].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12012006
* component[crying].value[x] only CodeableConcept
* component[crying].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.4--20200901000000 (preferred)
* component[bodyMovement].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12012008
* component[bodyMovement].value[x] only CodeableConcept
* component[bodyMovement].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.5--20200901000000 (preferred)
* component[facialTone].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12012009
* component[facialTone].value[x] only CodeableConcept
* component[facialTone].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.6--20200901000000 (preferred)
* component[bodyMuscleTone].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12012010
* component[bodyMuscleTone].value[x] only CodeableConcept
* component[bodyMuscleTone].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.7--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    The Comfort Behaviour scale/ComfortNeo scale is an assessment tool, that is used to assess the pain behaviour of neonates (newborn).
    The Comfort Behaviour scale has 7 observation points that need to be addressed. For each observation a value is assigned from a 5-point scale, the final score indicates whether the observed child suffers pain and 'how much'. The score is combined with an NRS score that is completed by the nurses on basis of clinical experience.
    """
* .
  * ^short = "ComfortScale"
  * ^alias[+] = "ComfortScore"
* effectiveDateTime
  * ^short = "ScoreDateTime"
  * ^alias[+] = "ScoreDatumTijd"
  * ^definition = "The date and time at which the Comfort Behaviour scale/ComfortNeo scale was determined."
* valueInteger
  * ^short = "TotalScore"
  * ^alias[+] = "TotaalScore"
  * ^definition = "The total score is the sum of all the individual scores. The total score has a range from 0 - 35."
  * ^comment = "The individual scores are communicated using the different `Observation.component` slices. The ordinal values of these indivdual scores, which are used to calculate the total score, are defined by the underlying code system and are registered in the ValueSet resources bound on these slices, using the [ordinalValue](http://hl7.org/fhir/StructureDefinition/ordinalValue) extension."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the circumstances during the measurement."
* component[alertness].value[x]
  * ^short = "Alertness"
  * ^alias[+] = "Alertheid"
  * ^definition = "Observation Alertness"
* component[calmnessAgitation].value[x]
  * ^short = "Calmness_Agitation"
  * ^alias[+] = "Kalmte_Agitatie"
  * ^definition = "Observation Calmness/agitation"
* component[respiratoryResponse].value[x]
  * ^short = "RespiratoryResponse"
  * ^alias[+] = "Ademhalingsreactie"
  * ^definition = "Observation Respiratory response (only in mechanically ventilated children)"
* component[crying].value[x]
  * ^short = "Crying"
  * ^alias[+] = "Huilen"
  * ^definition = "Observation Crying (only in spontaneously breathing children)"
* component[bodyMovement].value[x]
  * ^short = "BodyMovement"
  * ^alias[+] = "Lichaamsbeweging"
  * ^definition = "Observation Physical movement"
* component[facialTone].value[x]
  * ^short = "FacialTone"
  * ^alias[+] = "Gezichtsspanning"
  * ^definition = "Observation Facial tension"
* component[bodyMuscleTone].value[x]
  * ^short = "BodyMuscleTone"
  * ^alias[+] = "Spierspanning"
  * ^definition = "Observation Muscle tone"

Mapping: NlbaseComfortScale-to-zib-comfortscale-v1.1-2020EN
Id: zib-comfortscale-v1.1-2020EN
Title: "zib ComfortScale-v1.1(2020EN)"
Source: NlbaseComfortScale
Target: "https://zibs.nl/wiki/ComfortScale-v1.1(2020EN)"
*  -> "NL-CM:12.12.1" "ComfortScale"
* effectiveDateTime -> "NL-CM:12.12.11" "ScoreDateTime"
* valueInteger -> "NL-CM:12.12.2" "TotalScore"
* note.text -> "NL-CM:12.12.12" "Comment"
* component[alertness].value[x] -> "NL-CM:12.12.3" "Alertness"
* component[calmnessAgitation].value[x] -> "NL-CM:12.12.4" "Calmness_Agitation"
* component[respiratoryResponse].value[x] -> "NL-CM:12.12.5" "RespiratoryResponse"
* component[crying].value[x] -> "NL-CM:12.12.6" "Crying"
* component[bodyMovement].value[x] -> "NL-CM:12.12.8" "BodyMovement"
* component[facialTone].value[x] -> "NL-CM:12.12.9" "FacialTone"
* component[bodyMuscleTone].value[x] -> "NL-CM:12.12.10" "BodyMuscleTone"
