Profile: NlbaseMUSTScore
Parent: Observation
Id: nl-base-MUSTScore
Title: "nl base MUSTScore"
* insert ProfileMetadata(nl-base-MUSTScore)
* insert Purpose(MUSTScore, 3.1, Observation)

* . obeys zib-MUSTScore-1 and zib-MUSTScore-2
* code = http://snomed.info/sct#414648004
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger 0..
  * ^condition[+] = zib-MUSTScore-2
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    bmiScore 0..1 and
    weightLossScore 0..1 and
    illnessScore 0..1
* component[bmiScore]
  * ^condition[+] = zib-MUSTScore-1
  * ^condition[+] = zib-MUSTScore-2
* component[bmiScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4005003
* component[bmiScore].value[x]
  * ^condition[+] = zib-MUSTScore-1
  * ^condition[+] = zib-MUSTScore-2
* component[bmiScore].value[x] only CodeableConcept
* component[bmiScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.5.1--20200901000000 (preferred)
* component[weightLossScore]
  * ^condition[+] = zib-MUSTScore-1
  * ^condition[+] = zib-MUSTScore-2
* component[weightLossScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4005004
* component[weightLossScore].value[x]
  * ^condition[+] = zib-MUSTScore-1
  * ^condition[+] = zib-MUSTScore-2
* component[weightLossScore].value[x] only CodeableConcept
* component[weightLossScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.5.2--20200901000000 (preferred)
* component[illnessScore]
  * ^condition[+] = zib-MUSTScore-1
  * ^condition[+] = zib-MUSTScore-2
* component[illnessScore].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4005005
* component[illnessScore].value[x]
  * ^condition[+] = zib-MUSTScore-1
  * ^condition[+] = zib-MUSTScore-2
* component[illnessScore].value[x] only CodeableConcept
* component[illnessScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.5.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    The Malnutrition Universal Screening Tool (MUST) is a (validated) diagnostic screening tool for determining the extent of a patient’s malnutrition.
    For this screening tool, every patient’s Body Mass Index (BMI) and
    weight loss percentage is calculated, after which the patient is assigned a disease factor. The MUST helps to recognize and treat malnutrition at an early stage.
    
    (Source: Guidelines for Screening and Treating Malnutrition.)
    """
* .
  * ^short = "MUSTScore"
  * ^alias[+] = "MUSTScore"
* effectiveDateTime
  * ^short = "MUSTScoreDateTime"
  * ^alias[+] = "MUSTScoreDatumTijd"
  * ^definition = "The date and time at which the MUST score was determined."
* valueInteger
  * ^short = "TotalScore"
  * ^alias[+] = "TotaalScore"
  * ^definition = "The total score is the sum of all the individual scores. The total score has a range from 0 - 6."
  * ^comment = "The individual scores are communicated using the different `Observation.component` slices. The ordinal values of these indivdual scores, which are used to calculate the total score, are defined by the underlying code system and are registered in the ValueSet resources bound on these slices, using the [ordinalValue](http://hl7.org/fhir/StructureDefinition/ordinalValue) extension."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the circumstances during the measurement."
* component[bmiScore].value[x]
  * ^short = "BMIScore"
  * ^alias[+] = "BMIScore"
  * ^definition = "A person’s Body Mass Index (BMI), also known as their Quetelet index (QI), is an index indicating the ratio between a person’s height and weight. This BMI is expressed in kg/m2."
* component[weightLossScore].value[x]
  * ^short = "WeightLossScore"
  * ^alias[+] = "GewichtsverliesScore"
  * ^definition = "The percentage of undesired weight loss over the past 3-6 months."
* component[illnessScore].value[x]
  * ^short = "IllnessScore"
  * ^alias[+] = "ZiekteScore"
  * ^definition = """
    Illness can result in reduced food intake, leading to a higher risk of malnutrition. 
    The IllnessScore concept is used to indicate that the patient is seriously ill and that the patient has not eaten for more than 5 days or that there is a chance that the patient has not eaten for more than 5 days.
    """

Invariant: zib-MUSTScore-1
Description: "If one of the component codes is present, all SHALL be present."
Severity: #error
Expression: "component.where(code.coding.system='urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1' and code.coding.code.subsetOf('4005003'|'4005004'|'4005005')).count().subsetOf(0|3)"

Invariant: zib-MUSTScore-2
Description: "If the component codes are not all present, the value SHALL be present."
Severity: #error
Expression: "value.empty().not() or component.where(code.coding.system='urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1' and code.coding.code.subsetOf('4005003'|'4005004'|'4005005')).count()=3"

Mapping: NlbaseMUSTScore-to-zib-mustscore-v3.1-2020EN
Id: zib-mustscore-v3.1-2020EN
Title: "zib MUSTScore-v3.1(2020EN)"
Source: NlbaseMUSTScore
Target: "https://zibs.nl/wiki/MUSTScore-v3.1(2020EN)"
*  -> "NL-CM:4.5.1" "MUSTScore"
* effectiveDateTime -> "NL-CM:4.5.6" "MUSTScoreDateTime"
* valueInteger -> "NL-CM:4.5.2" "TotalScore"
* note.text -> "NL-CM:4.5.7" "Comment"
* component[bmiScore].value[x] -> "NL-CM:4.5.3" "BMIScore"
* component[weightLossScore].value[x] -> "NL-CM:4.5.4" "WeightLossScore"
* component[illnessScore].value[x] -> "NL-CM:4.5.5" "IllnessScore"
