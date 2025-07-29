Profile: NlcoreSNAQScore
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-SNAQScore
Id: nl-core-SNAQScore
Title: "nl core SNAQScore"
* insert ProfileMetadata(nl-core-SNAQScore)
* insert Purpose(SNAQScore, 3.2, Observation)

* . obeys zib-SNAQScore-1 and zib-SNAQScore-2
* note ..1
* component[weightLossScore] ..1
* component[weightLossScore].value[x] ^binding.strength = #required
* component[appetiteScore] ..1
* component[appetiteScore].value[x] ^binding.strength = #required
* component[nutritionScore] ..1
* component[nutritionScore].value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    The Short Nutritional Assessment Questionnaire (SNAQ) is a (validated) measuring tool for determining the extent of a patient’s malnutrition. The tool comprises three questions, each of which is assigned a score. The total score determines the extent of malnutrition.
    The SNAQ helps to recognize and treat malnutrition at an early stage.
    Three varieties of the measuring tool were developed for different care settings: hospitals, nursing and retirement homes and independently living seniors. This concept describes the tool intended for the hospital setting.
    """
* . ^alias[+] = "nl-core-SNAQScore"
