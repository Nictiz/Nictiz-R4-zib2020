Profile: NlbaseFLACCpainScale
Parent: Observation
Id: nl-base-FLACCpainScale
Title: "nl base FLACCpainScale"
* insert ProfileMetadata(nl-base-FLACCpainScale)
* insert Purpose(FLACCpainScale, 1.1, Observation)

* code = http://snomed.info/sct#108291000146105
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    face 0..1 and
    legs 0..1 and
    activity 0..1 and
    cry 0..1 and
    consolability 0..1
* component[face].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12013003
* component[face].value[x] only CodeableConcept
* component[face].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.13.1--20200901000000 (preferred)
* component[legs].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12013004
* component[legs].value[x] only CodeableConcept
* component[legs].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.13.2--20200901000000 (preferred)
* component[activity].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12013005
* component[activity].value[x] only CodeableConcept
* component[activity].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.13.3--20200901000000 (preferred)
* component[cry].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12013006
* component[cry].value[x] only CodeableConcept
* component[cry].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.13.4--20200901000000 (preferred)
* component[consolability].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12013009
* component[consolability].value[x] only CodeableConcept
* component[consolability].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.13.5--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    The FLACC (Faces, Legs, Activity, Cry and Consolability) is a pain assessment tool, that is used to assess pain in children aged 0-7 years old by observing their behaviour.
    The FLACC has five subscales that need to be addressed. The final score indicates whether the observed child suffers pain and 'how much'. The score is often combined with a NRS-score that is completed by the nurses on basis of clinical experience.
    """
* .
  * ^short = "FLACCpainScale"
  * ^alias[+] = "FLACCpijnScore"
* effectiveDateTime
  * ^short = "ScoreDateTime"
  * ^alias[+] = "ScoreDatumTijd"
  * ^definition = "The date and time at which the FLACC score was determined."
* valueInteger
  * ^short = "TotalScore"
  * ^alias[+] = "TotaalScore"
  * ^definition = "The total score is the sum of all the individual scores. The total score has a range from 0 - 10."
  * ^comment = "The individual scores are communicated using the different `Observation.component` slices. The ordinal values of these indivdual scores, which are used to calculate the total score, are defined by the underlying code system and are registered in the ValueSet resources bound on these slices, using the [ordinalValue](http://hl7.org/fhir/StructureDefinition/ordinalValue) extension."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the circumstances during the measurement."
* component[face].value[x]
  * ^short = "Face"
  * ^alias[+] = "Gezicht"
  * ^definition = """
    Observation Faces;
    The extent to which the child’s expression on the face is tensed, grimace, tension of jaws.
    """
* component[legs].value[x]
  * ^short = "Legs"
  * ^alias[+] = "Benen"
  * ^definition = "Observation legs: the extent to which the child is restless (body and legs)."
* component[activity].value[x]
  * ^short = "Activity"
  * ^alias[+] = "Activiteit"
  * ^definition = "Observation activity: the extent to which the child is restless and has tense muscles."
* component[cry].value[x]
  * ^short = "Cry"
  * ^alias[+] = "Huilen"
  * ^definition = "Observation Crying: the extent to which the child is crying, whimpers or laments."
* component[consolability].value[x]
  * ^short = "Consolability"
  * ^alias[+] = "Troostbaar"
  * ^definition = "Observation Consolability: the extent to which the child is consolable."

Mapping: NlbaseFLACCpainScale-to-zib-flaccpainscale-v1.1-2020EN
Id: zib-flaccpainscale-v1.1-2020EN
Title: "zib FLACCpainScale-v1.1(2020EN)"
Source: NlbaseFLACCpainScale
Target: "https://zibs.nl/wiki/FLACCpainScale-v1.1(2020EN)"
*  -> "NL-CM:12.13.1" "FLACCpainScale"
* effectiveDateTime -> "NL-CM:12.13.11" "ScoreDateTime"
* valueInteger -> "NL-CM:12.13.2" "TotalScore"
* note.text -> "NL-CM:12.13.12" "Comment"
* component[face].value[x] -> "NL-CM:12.13.3" "Face"
* component[legs].value[x] -> "NL-CM:12.13.4" "Legs"
* component[activity].value[x] -> "NL-CM:12.13.5" "Activity"
* component[cry].value[x] -> "NL-CM:12.13.6" "Cry"
* component[consolability].value[x] -> "NL-CM:12.13.9" "Consolability"
