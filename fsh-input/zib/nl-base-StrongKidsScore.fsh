Profile: NlbaseStrongKidsScore
Parent: Observation
Id: nl-base-StrongKidsScore
Title: "nl base StrongKidsScore"
* insert ProfileMetadata(nl-base-StrongKidsScore)
* insert Purpose(StrongKidsScore, 1.1, Observation)

* . obeys zib-StrongKidsScore-1 and zib-StrongKidsScore-2
* code = http://snomed.info/sct#108341000146107
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger 0..
  * ^condition[+] = zib-StrongKidsScore-2
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    weightLossScore 0..1 and
    conditionScore 0..1 and
    nutritionScore 0..1 and
    nutritionStatusScore 0..1
* component[weightLossScore]
  * ^condition[+] = zib-StrongKidsScore-1
  * ^condition[+] = zib-StrongKidsScore-2
* component[weightLossScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4028003
* component[weightLossScore].value[x] only CodeableConcept
* component[weightLossScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.28.1--20200901000000 (preferred)
* component[conditionScore]
  * ^condition[+] = zib-StrongKidsScore-1
  * ^condition[+] = zib-StrongKidsScore-2
* component[conditionScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4028004
* component[conditionScore].value[x] only CodeableConcept
* component[conditionScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.28.2--20200901000000 (preferred)
* component[nutritionScore]
  * ^condition[+] = zib-StrongKidsScore-1
  * ^condition[+] = zib-StrongKidsScore-2
* component[nutritionScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4028005
* component[nutritionScore].value[x] only CodeableConcept
* component[nutritionScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.28.3--20200901000000 (preferred)
* component[nutritionStatusScore]
  * ^condition[+] = zib-StrongKidsScore-1
  * ^condition[+] = zib-StrongKidsScore-2
* component[nutritionStatusScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4028008
* component[nutritionStatusScore].value[x] only CodeableConcept
* component[nutritionStatusScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.28.4--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    The StrongKids score is a (validated) measuring tool for determining the extent of a child’s malnutrition.
    StrongKids is developed to recognize and treat malnutrition in children aged > 1 month to 18 years in a hospital setting.
    The tool comprises four questions, each of which is assigned a score. The total score determines the extent of malnutrition.
    (STRONGkids= Screening Tool Risk On Nutritional Status and Growth)
    """
* .
  * ^short = "StrongKidsScore"
  * ^alias[+] = "StrongKidsScore"
* effectiveDateTime
  * ^short = "ScoreDateTime"
  * ^alias[+] = "ScoreDatumTijd"
  * ^definition = "The date and time at which the StrongKids score was determined."
* valueInteger
  * ^short = "TotalScore"
  * ^alias[+] = "TotaalScore"
  * ^definition = "The total score is the sum of all the individual scores. The total score has a range from 0 - 5."
  * ^comment = "The individual scores are communicated using the different `Observation.component` slices. The ordinal values of these indivdual scores, which are used to calculate the total score, are defined by the underlying code system and are registered in the ValueSet resources bound on these slices, using the [ordinalValue](http://hl7.org/fhir/StructureDefinition/ordinalValue) extension."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the circumstances during the measurement."
* component[weightLossScore].value[x]
  * ^short = "WeightLossScore"
  * ^alias[+] = "GewichtsverliesScore"
  * ^definition = "The score based on undesired weight loss or arrest in growth or weight gain over the past weeks to month(s)."
* component[conditionScore].value[x]
  * ^short = "ConditionScore"
  * ^alias[+] = "ZiekteBeeldScore"
  * ^definition = "The score based on the presence of a condition that can cause an increased risk of malnutrition. A list with conditions with increased risk is given on http://www.stuurgroepondervoeding.nl/toolkits/screeningsinstrument."
* component[nutritionScore].value[x]
  * ^short = "NutritionScore"
  * ^alias[+] = "VoedingsScore"
  * ^definition = """
    The score based on the presence of aspects that indicate a deteriorated nutrition status:
    - excessive diarrhea and/or vomiting
    - use of fluid or enteral nutrition
    - reduced intake of food during the past 1-3 days
    - obstruction of food intake by pain
    """
* component[nutritionStatusScore].value[x]
  * ^short = "NutritionStatusScore"
  * ^alias[+] = "VoedingstoestandScore"
  * ^definition = "The score gives an indication of the nutrition status of the patient based on the professional opinion of the healthcare professional."

Invariant: zib-StrongKidsScore-1
Description: "If one of the component codes is present, all SHALL be present."
Severity: #error
Expression: "component.where(code.coding.system='urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1' and code.coding.code.subsetOf('4028003'|'4028004'|'4028005'|'4028008')).count().subsetOf(0|4)"

Invariant: zib-StrongKidsScore-2
Description: "If the component codes are not all present, the value SHALL be present."
Severity: #error
Expression: "value.empty().not() or component.where(code.coding.system='urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1' and code.coding.code.subsetOf('4028003'|'4028004'|'4028005'|'4028008')).count()=4"

Mapping: NlbaseStrongKidsScore-to-zib-strongkidsscore-v1.1-2020EN
Id: zib-strongkidsscore-v1.1-2020EN
Title: "zib StrongKidsScore-v1.1(2020EN)"
Source: NlbaseStrongKidsScore
Target: "https://zibs.nl/wiki/StrongKidsScore-v1.1(2020EN)"
*  -> "NL-CM:4.28.1" "StrongKidsScore"
* effectiveDateTime -> "NL-CM:4.28.6" "ScoreDateTime"
* valueInteger -> "NL-CM:4.28.2" "TotalScore"
* note.text -> "NL-CM:4.28.7" "Comment"
* component[weightLossScore].value[x] -> "NL-CM:4.28.3" "WeightLossScore"
* component[conditionScore].value[x] -> "NL-CM:4.28.4" "ConditionScore"
* component[nutritionScore].value[x] -> "NL-CM:4.28.5" "NutritionScore"
* component[nutritionStatusScore].value[x] -> "NL-CM:4.28.8" "NutritionStatusScore"
