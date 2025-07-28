Profile: NlcoreSNAQ65plusScore
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-SNAQ65plusScore
Id: nl-core-SNAQ65plusScore
Title: "nl core SNAQ65plusScore"
* insert ProfileMetadata(nl-core-SNAQ65plusScore)
* ^purpose = "This Observation resource represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) SNAQ65+Score v1.2 (2020)](https://zibs.nl/wiki/SNAQ65%2BScore-v1.2(2020EN))."

* . obeys zib-SNAQ65PlusScore-1 and zib-SNAQ65PlusScore-2
* note ..1
* component[weightLossScore] ..1
* component[weightLossScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.30.1--20200901000000 (required)
* component[upperarmCircumference] ..1
* component[upperarmCircumference].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.30.4--20200901000000 (required)
* component[appetiteScore] ..1
* component[appetiteScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.30.2--20200901000000 (required)
* component[exerciseScore] ..1
* component[exerciseScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.30.3--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    The Short Nutritional Assessment Questionnaire 65+ (SNAQ65+) is a (validated) measuring tool for determining the extent of a patient’s malnutrition. The tool comprises a number of questions, each of which is assigned a score. The total score determines the extent of malnutrition.
    The SNAQ helps to recognize and treat malnutrition at an early stage.
    Three varieties of the measuring tool were developed for different care settings: hospitals (adults and children), nursing and retirement homes and independently living seniors. This concept describes the tool intended for the setting of independently living elderly.
    """
* . ^alias[+] = "nl-core-SNAQ65plusScore"
