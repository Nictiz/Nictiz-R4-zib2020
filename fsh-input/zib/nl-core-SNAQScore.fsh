Profile: NlcoreSNAQScore
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-SNAQScore
Id: nl-core-SNAQScore
Title: "nl core SNAQScore"
* insert ProfileMetadata(nl-core-SNAQScore)
* insert Purpose(SNAQScore, 3.2, Observation)

* . obeys zib-SNAQScore-1 and zib-SNAQScore-2
* note ..1
* component[weightLossScore] ..1
* component[weightLossScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.6.1--20200901000000 (required)
* component[appetiteScore] ..1
* component[appetiteScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.6.2--20200901000000 (required)
* component[nutritionScore] ..1
* component[nutritionScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.6.3--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    The Short Nutritional Assessment Questionnaire (SNAQ) is a (validated) measuring tool for determining the extent of a patient’s malnutrition. The tool comprises three questions, each of which is assigned a score. The total score determines the extent of malnutrition.
    The SNAQ helps to recognize and treat malnutrition at an early stage.
    Three varieties of the measuring tool were developed for different care settings: hospitals, nursing and retirement homes and independently living seniors. This concept describes the tool intended for the hospital setting.
    """
* . ^alias[+] = "nl-core-SNAQScore"
