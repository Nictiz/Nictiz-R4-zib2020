Profile: NlbaseSNAQrcScore
Parent: Observation
Id: nl-base-SNAQrcScore
Title: "nl base SNAQrcScore"
* insert ProfileMetadata(nl-base-SNAQrcScore)
* insert Purpose(SNAQrcScore, 1.1, Observation)

* . obeys zib-SNAQrcScore-1 and zib-SNAQrcScore-2
* code = http://snomed.info/sct#108311000146106
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger 0..
  * ^condition[+] = zib-SNAQrcScore-2
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    weightLossScore 0..1 and
    appetiteScore 0..1 and
    bmiScore 0..1 and
    assistedEating 0..1
* component[weightLossScore]
  * ^condition[+] = zib-SNAQrcScore-1
  * ^condition[+] = zib-SNAQrcScore-2
* component[weightLossScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4029003
* component[weightLossScore].value[x]
  * ^condition[+] = zib-SNAQrcScore-1
  * ^condition[+] = zib-SNAQrcScore-2
* component[weightLossScore].value[x] only CodeableConcept
* component[weightLossScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.29.1--20200901000000 (preferred)
* component[appetiteScore]
  * ^condition[+] = zib-SNAQrcScore-1
  * ^condition[+] = zib-SNAQrcScore-2
* component[appetiteScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4029004
* component[appetiteScore].value[x]
  * ^condition[+] = zib-SNAQrcScore-1
  * ^condition[+] = zib-SNAQrcScore-2
* component[appetiteScore].value[x] only CodeableConcept
* component[appetiteScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.29.2--20200901000000 (preferred)
* component[bmiScore]
  * ^condition[+] = zib-SNAQrcScore-1
  * ^condition[+] = zib-SNAQrcScore-2
* component[bmiScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4029005
* component[bmiScore].value[x]
  * ^condition[+] = zib-SNAQrcScore-1
  * ^condition[+] = zib-SNAQrcScore-2
* component[bmiScore].value[x] only CodeableConcept
* component[bmiScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.29.3--20200901000000 (preferred)
* component[assistedEating]
  * ^condition[+] = zib-SNAQrcScore-1
  * ^condition[+] = zib-SNAQrcScore-2
* component[assistedEating].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4029008
* component[assistedEating].value[x]
  * ^condition[+] = zib-SNAQrcScore-1
  * ^condition[+] = zib-SNAQrcScore-2
* component[assistedEating].value[x] only CodeableConcept
* component[assistedEating].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.29.4--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    The Short Nutritional Assessment Questionnaire for Residential Care (SNAQ rc is a (validated) measuring tool for determining the extent of a patient’s malnutrition. The tool comprises three questions, each of which is assigned a score. The total score determines the extent of malnutrition.
    The SNAQrc helps to recognize and treat malnutrition at an early stage.
    Four varieties of the measuring tool were developed for different care settings: hospitals (adults & children), nursing and retirement homes and independently living seniors. This concept describes the tool intended for the nursing and retirement homes setting.
    """
* .
  * ^short = "SNAQrcScore"
  * ^alias[+] = "SNAQrcScore"
* effectiveDateTime
  * ^short = "SNAQrcScoreDateTime"
  * ^alias[+] = "SNAQrcScoreDatumTijd"
  * ^definition = "The date and time at which the SNAQrc score was determined."
* valueInteger
  * ^short = "TotalScore"
  * ^alias[+] = "TotaalScore"
  * ^definition = """
    The total score is the sum of all the individual scores. The total score has a range from 0 - 6. The relation between the value of the total score and the color outcome of the score tool is:
    0 = green
    1= orange
    2 and higher = red.
    """
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
* component[bmiScore].value[x]
  * ^short = "BMIScore"
  * ^alias[+] = "BMIScore"
  * ^definition = "The score based on the BMI of the patient. For a BMI >28 (overweight) the score is not applicable."
* component[assistedEating].value[x]
  * ^short = "AssistedEating"
  * ^alias[+] = "HulpBijEten"
  * ^definition = "The score based on the ability of the patient to eat and drink without assistance."

Invariant: zib-SNAQrcScore-1
Description: "If one of the component codes is present, all SHALL be present."
Severity: #error
Expression: "component.where(code.coding.system='urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1' and code.coding.code.subsetOf('4029003'|'4029004'|'4029005'|'4029008')).count().subsetOf(0|4)"

Invariant: zib-SNAQrcScore-2
Description: "If the component codes are not all present, the value SHALL be present."
Severity: #error
Expression: "value.empty().not() or component.where(code.coding.system='urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1' and code.coding.code.subsetOf('4029003'|'4029004'|'4029005'|'4029008')).count()=4"

Mapping: NlbaseSNAQrcScore-to-zib-snaqrcscore-v1.1-2020EN
Id: zib-snaqrcscore-v1.1-2020EN
Title: "zib SNAQrcScore-v1.1(2020EN)"
Source: NlbaseSNAQrcScore
Target: "https://zibs.nl/wiki/SNAQrcScore-v1.1(2020EN)"
*  -> "NL-CM:4.29.1" "SNAQrcScore"
* effectiveDateTime -> "NL-CM:4.29.6" "SNAQrcScoreDateTime"
* valueInteger -> "NL-CM:4.29.2" "TotalScore"
* note.text -> "NL-CM:4.29.7" "Comment"
* component[weightLossScore].value[x] -> "NL-CM:4.29.3" "WeightLossScore"
* component[appetiteScore].value[x] -> "NL-CM:4.29.4" "AppetiteScore"
* component[bmiScore].value[x] -> "NL-CM:4.29.5" "BMIScore"
* component[assistedEating].value[x] -> "NL-CM:4.29.8" "AssistedEating"
