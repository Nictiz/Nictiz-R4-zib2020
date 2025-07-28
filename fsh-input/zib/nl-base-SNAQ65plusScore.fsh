Profile: NlbaseSNAQ65plusScore
Parent: Observation
Id: nl-base-SNAQ65plusScore
Title: "nl base SNAQ65plusScore"
* insert ProfileMetadata(nl-base-SNAQ65plusScore)
* ^purpose = "This Observation resource represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) SNAQ65+Score v1.2 (2020)](https://zibs.nl/wiki/SNAQ65%2BScore-v1.2(2020EN))."

* . obeys zib-SNAQ65PlusScore-1 and zib-SNAQ65PlusScore-2
* code = http://snomed.info/sct#108321000146101
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger 0..
  * ^condition[+] = zib-SNAQ65PlusScore-2
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    weightLossScore 0..1 and
    upperarmCircumference 0..1 and
    appetiteScore 0..1 and
    exerciseScore 0..1
* component[weightLossScore]
  * ^condition[+] = zib-SNAQ65PlusScore-1
  * ^condition[+] = zib-SNAQ65PlusScore-2
* component[weightLossScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4030003
* component[weightLossScore].value[x]
  * ^condition[+] = zib-SNAQ65PlusScore-1
  * ^condition[+] = zib-SNAQ65PlusScore-2
* component[weightLossScore].value[x] only CodeableConcept
* component[weightLossScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.30.1--20200901000000 (preferred)
* component[upperarmCircumference]
  * ^condition[+] = zib-SNAQ65PlusScore-1
  * ^condition[+] = zib-SNAQ65PlusScore-2
* component[upperarmCircumference].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4030008
* component[upperarmCircumference].value[x]
  * ^condition[+] = zib-SNAQ65PlusScore-1
  * ^condition[+] = zib-SNAQ65PlusScore-2
* component[upperarmCircumference].value[x] only CodeableConcept
* component[upperarmCircumference].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.30.4--20200901000000 (preferred)
* component[appetiteScore]
  * ^condition[+] = zib-SNAQ65PlusScore-1
  * ^condition[+] = zib-SNAQ65PlusScore-2
* component[appetiteScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4030004
* component[appetiteScore].value[x]
  * ^condition[+] = zib-SNAQ65PlusScore-1
  * ^condition[+] = zib-SNAQ65PlusScore-2
* component[appetiteScore].value[x] only CodeableConcept
* component[appetiteScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.30.2--20200901000000 (preferred)
* component[exerciseScore]
  * ^condition[+] = zib-SNAQ65PlusScore-1
  * ^condition[+] = zib-SNAQ65PlusScore-2
* component[exerciseScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4030005
* component[exerciseScore].value[x]
  * ^condition[+] = zib-SNAQ65PlusScore-1
  * ^condition[+] = zib-SNAQ65PlusScore-2
* component[exerciseScore].value[x] only CodeableConcept
* component[exerciseScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.30.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    The Short Nutritional Assessment Questionnaire 65+ (SNAQ65+) is a (validated) measuring tool for determining the extent of a patient’s malnutrition. The tool comprises a number of questions, each of which is assigned a score. The total score determines the extent of malnutrition.
    The SNAQ helps to recognize and treat malnutrition at an early stage.
    Three varieties of the measuring tool were developed for different care settings: hospitals (adults and children), nursing and retirement homes and independently living seniors. This concept describes the tool intended for the setting of independently living elderly.
    """
* .
  * ^short = "SNAQ65+Score"
  * ^alias[+] = "SNAQ65+Score"
* effectiveDateTime
  * ^short = "SNAQScoreDateTime"
  * ^alias[+] = "SNAQ65+ScoreDatumTijd"
  * ^definition = "The date and time at which the SNAQ65+ score was determined."
* valueInteger
  * ^short = "TotalScore"
  * ^alias[+] = "TotaalScore"
  * ^definition = """
    The total score is the sum of all the individual scores. The total score has a range from 0 - 5. The relation between the value of the total score and the color outcome of the score tool is:
    * 0-1 = green
    * 2 = orange
    * 3 and higher = red.
    """
  * ^comment = "The individual scores are communicated using the different `Observation.component` slices. The ordinal values of these indivdual scores, which are used to calculate the total score, are defined by the underlying code system and are registered in the ValueSet resources bound on these slices, using the [ordinalValue](http://hl7.org/fhir/StructureDefinition/ordinalValue) extension."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the circumstances during the measurement."
* component[weightLossScore].value[x]
  * ^short = "WeightLossScore"
  * ^alias[+] = "GewichtsverliesScore"
  * ^definition = "The score based on undesired weight loss over the past six months."
* component[upperarmCircumference].value[x]
  * ^short = "UpperarmCircumference"
  * ^alias[+] = "BovenarmOmtrekScore"
  * ^definition = "The score based on circumference of the upper arm."
* component[appetiteScore].value[x]
  * ^short = "AppetiteScore"
  * ^alias[+] = "EetlustScore"
  * ^definition = "The score based on a reduced appetite over the past month."
* component[exerciseScore].value[x]
  * ^short = "ExerciseScore"
  * ^alias[+] = "InspanningsScore"
  * ^definition = "The score based on the ability to perform exercise like climbing stairs without rest or to walk for five minute without rest."

Invariant: zib-SNAQ65PlusScore-1
Description: "If one of the component codes is present, all SHALL be present."
Severity: #error
Expression: "component.where(code.coding.system='urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1' and code.coding.code.subsetOf('4030003'|'4030008'|'4030004'|'4030005')).count().subsetOf(0|4)"

Invariant: zib-SNAQ65PlusScore-2
Description: "If the component codes are not all present, the value SHALL be present."
Severity: #error
Expression: "value.empty().not() or component.where(code.coding.system='urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1' and code.coding.code.subsetOf('4030003'|'4030008'|'4030004'|'4030005')).count()=4"

Mapping: NlbaseSNAQ65plusScore-to-zib-snaq65plusscore-v1.2-2020EN
Id: zib-snaq65plusscore-v1.2-2020EN
Title: "zib SNAQ65plusScore-v1.2(2020EN)"
Source: NlbaseSNAQ65plusScore
Target: "https://zibs.nl/wiki/SNAQ65%2BScore-v1.2(2020EN)"
*  -> "NL-CM:4.30.1" "SNAQ65+Score"
* effectiveDateTime -> "NL-CM:4.30.6" "SNAQScoreDateTime"
* valueInteger -> "NL-CM:4.30.2" "TotalScore"
* note.text -> "NL-CM:4.30.7" "Comment"
* component[weightLossScore].value[x] -> "NL-CM:4.30.3" "WeightLossScore"
* component[upperarmCircumference].value[x] -> "NL-CM:4.30.8" "UpperarmCircumference"
* component[appetiteScore].value[x] -> "NL-CM:4.30.4" "AppetiteScore"
* component[exerciseScore].value[x] -> "NL-CM:4.30.5" "ExerciseScore"
