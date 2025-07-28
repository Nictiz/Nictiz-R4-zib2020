Profile: NlcoreSNAQrcScore
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-SNAQrcScore
Id: nl-core-SNAQrcScore
Title: "nl core SNAQrcScore"
* insert ProfileMetadata(nl-core-SNAQrcScore)
* insert Purpose(SNAQrcScore, 1.1, Observation)

* . obeys zib-SNAQrcScore-1 and zib-SNAQrcScore-2
* note ..1
* component[weightLossScore] ..1
* component[weightLossScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.29.1--20200901000000 (required)
* component[appetiteScore] ..1
* component[appetiteScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.29.2--20200901000000 (required)
* component[bmiScore] ..1
* component[bmiScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.29.3--20200901000000 (required)
* component[assistedEating] ..1
* component[assistedEating].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.29.4--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    The Short Nutritional Assessment Questionnaire for Residential Care (SNAQ rc is a (validated) measuring tool for determining the extent of a patient’s malnutrition. The tool comprises three questions, each of which is assigned a score. The total score determines the extent of malnutrition.
    The SNAQrc helps to recognize and treat malnutrition at an early stage.
    Four varieties of the measuring tool were developed for different care settings: hospitals (adults & children), nursing and retirement homes and independently living seniors. This concept describes the tool intended for the nursing and retirement homes setting.
    """
* . ^alias[+] = "nl-core-SNAQrcScore"
