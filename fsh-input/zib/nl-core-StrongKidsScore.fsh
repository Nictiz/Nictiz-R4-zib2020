Profile: NlcoreStrongKidsScore
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-StrongKidsScore
Id: nl-core-StrongKidsScore
Title: "nl core StrongKidsScore"
* insert ProfileMetadata(nl-core-StrongKidsScore)
* insert Purpose(StrongKidsScore, 1.1, Observation)

* . obeys zib-StrongKidsScore-1 and zib-StrongKidsScore-2
* note ..1
* component[weightLossScore] ..1
* component[weightLossScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.28.1--20200901000000 (required)
* component[conditionScore] ..1
* component[conditionScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.28.2--20200901000000 (required)
* component[nutritionScore] ..1
* component[nutritionScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.28.3--20200901000000 (required)
* component[nutritionStatusScore] ..1
* component[nutritionStatusScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.28.4--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    The StrongKids score is a (validated) measuring tool for determining the extent of a child’s malnutrition.
    StrongKids is developed to recognize and treat malnutrition in children aged > 1 month to 18 years in a hospital setting.
    The tool comprises four questions, each of which is assigned a score. The total score determines the extent of malnutrition.
    (STRONGkids= Screening Tool Risk On Nutritional Status and Growth)
    """
* . ^alias[+] = "nl-core-StrongKidsScore"
