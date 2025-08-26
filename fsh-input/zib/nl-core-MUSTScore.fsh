Profile: NlcoreMUSTScore
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MUSTScore
Id: nl-core-MUSTScore
Title: "nl core MUSTScore"
* insert ProfileMetadata(nl-core-MUSTScore)
* insert Purpose(MUSTScore, 3.1, Observation)

* . obeys zib-MUSTScore-1 and zib-MUSTScore-2
* insert NlCorePatientForObservation
* valueInteger
  * ^minValueInteger = 0
  * ^maxValueInteger = 6
* note ..1
* component[bmiScore] ..1
* component[bmiScore].value[x] ^binding.strength = #required
* component[weightLossScore] ..1
* component[weightLossScore].value[x] ^binding.strength = #required
* component[illnessScore] ..1
* component[illnessScore].value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    The Malnutrition Universal Screening Tool (MUST) is a (validated) diagnostic screening tool for determining the extent of a patient’s malnutrition.
    For this screening tool, every patient’s Body Mass Index (BMI) and
    weight loss percentage is calculated, after which the patient is assigned a disease factor. The MUST helps to recognize and treat malnutrition at an early stage.
    
    (Source: Guidelines for Screening and Treating Malnutrition.)
    """
* . ^alias[+] = "nl-core-MUSTScore"
