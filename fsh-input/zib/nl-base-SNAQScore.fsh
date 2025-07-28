Profile: NlbaseSNAQScore
Parent: Observation
Id: nl-base-SNAQScore
Title: "nl base SNAQScore"
* insert ProfileMetadata(nl-base-SNAQScore)
* insert Purpose(SNAQScore, 3.2, Observation)

* . obeys zib-SNAQScore-1 and zib-SNAQScore-2
* code = http://snomed.info/sct#8881000146104
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger 0..
  * ^condition[+] = zib-SNAQScore-2
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    weightLossScore 0..1 and
    appetiteScore 0..1 and
    nutritionScore 0..1
* component[weightLossScore]
  * ^condition[+] = zib-SNAQScore-1
  * ^condition[+] = zib-SNAQScore-2
* component[weightLossScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4006003
* component[weightLossScore].value[x]
  * ^condition[+] = zib-SNAQScore-1
  * ^condition[+] = zib-SNAQScore-2
* component[weightLossScore].value[x] only CodeableConcept
* component[weightLossScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.6.1--20200901000000 (preferred)
* component[appetiteScore]
  * ^condition[+] = zib-SNAQScore-1
  * ^condition[+] = zib-SNAQScore-2
* component[appetiteScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4006004
* component[appetiteScore].value[x]
  * ^condition[+] = zib-SNAQScore-1
  * ^condition[+] = zib-SNAQScore-2
* component[appetiteScore].value[x] only CodeableConcept
* component[appetiteScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.6.2--20200901000000 (preferred)
* component[nutritionScore]
  * ^condition[+] = zib-SNAQScore-1
  * ^condition[+] = zib-SNAQScore-2
* component[nutritionScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4006005
* component[nutritionScore].value[x]
  * ^condition[+] = zib-SNAQScore-1
  * ^condition[+] = zib-SNAQScore-2
* component[nutritionScore].value[x] only CodeableConcept
* component[nutritionScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.6.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    The Short Nutritional Assessment Questionnaire (SNAQ) is a (validated) measuring tool for determining the extent of a patient’s malnutrition. The tool comprises three questions, each of which is assigned a score. The total score determines the extent of malnutrition.
    The SNAQ helps to recognize and treat malnutrition at an early stage.
    Three varieties of the measuring tool were developed for different care settings: hospitals, nursing and retirement homes and independently living seniors. This concept describes the tool intended for the hospital setting.
    """
* .
  * ^short = "SNAQScore"
  * ^alias[+] = "SNAQScore"
* effectiveDateTime
  * ^short = "SNAQScoreDateTime"
  * ^alias[+] = "SNAQScoreDatumTijd"
  * ^definition = "The date and time at which the SNAQ score was determined."
* valueInteger
  * ^short = "TotalScore"
  * ^alias[+] = "TotaalScore"
  * ^definition = "The total score is the sum of all the individual scores. The total score has a range from 0 - 7."
  * ^comment = "The individual scores are communicated using the different `Observation.component` slices. The ordinal values of these indivdual scores, which are used to calculate the total score, are defined by the underlying code system and are registered in the ValueSet resources bound on these slices, using the [ordinalValue](http://hl7.org/fhir/StructureDefinition/ordinalValue) extension."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the circumstances during the measurement."
* component[weightLossScore].value[x]
  * ^short = "WeightLossScore"
  * ^alias[+] = "GewichtsverliesScore"
  * ^definition = "The score based on undesired weight loss over the past month(s)."
* component[appetiteScore].value[x]
  * ^short = "AppetiteScore"
  * ^alias[+] = "EetlustScore"
  * ^definition = "The score based on a reduced appetite over the past month."
* component[nutritionScore].value[x]
  * ^short = "NutritionScore"
  * ^alias[+] = "VoedingsScore"
  * ^definition = "The score based on the use of fluid or enteral nutrition over the past month."

Invariant: zib-SNAQScore-1
Description: "If one of the component codes is present, all SHALL be present."
Severity: #error
Expression: "component.where(code.coding.system='urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1' and code.coding.code.subsetOf('4006003'|'4006004'|'4006005')).count().subsetOf(0|3)"

Invariant: zib-SNAQScore-2
Description: "If the component codes are not all present, the value SHALL be present."
Severity: #error
Expression: "value.empty().not() or component.where(code.coding.system='urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1' and code.coding.code.subsetOf('4006003'|'4006004'|'4006005')).count()=3"

Mapping: NlbaseSNAQScore-to-zib-snaqscore-v3.2-2020EN
Id: zib-snaqscore-v3.2-2020EN
Title: "zib SNAQScore-v3.2(2020EN)"
Source: NlbaseSNAQScore
Target: "https://zibs.nl/wiki/SNAQScore-v3.2(2020EN)"
*  -> "NL-CM:4.6.1" "SNAQScore"
* effectiveDateTime -> "NL-CM:4.6.6" "SNAQScoreDateTime"
* valueInteger -> "NL-CM:4.6.2" "TotalScore"
* note.text -> "NL-CM:4.6.7" "Comment"
* component[weightLossScore].value[x] -> "NL-CM:4.6.3" "WeightLossScore"
* component[appetiteScore].value[x] -> "NL-CM:4.6.4" "AppetiteScore"
* component[nutritionScore].value[x] -> "NL-CM:4.6.5" "NutritionScore"
