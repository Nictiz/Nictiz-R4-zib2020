Profile: NlcoreStrongKidsScore
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-StrongKidsScore
Id: nl-core-StrongKidsScore
Title: "nl core StrongKidsScore"
* insert ProfileMetadata(nl-core-StrongKidsScore)
* insert Purpose(StrongKidsScore, 1.1, Observation)

* . obeys zib-StrongKidsScore-1 and zib-StrongKidsScore-2
* note ..1
* component[weightLossScore] ..1
* component[weightLossScore].value[x] ^binding.strength = #required
* component[conditionScore] ..1
* component[conditionScore].value[x] ^binding.strength = #required
* component[nutritionScore] ..1
* component[nutritionScore].value[x] ^binding.strength = #required
* component[nutritionStatusScore] ..1
* component[nutritionStatusScore].value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    The StrongKids score is a (validated) measuring tool for determining the extent of a child’s malnutrition.
    StrongKids is developed to recognize and treat malnutrition in children aged > 1 month to 18 years in a hospital setting.
    The tool comprises four questions, each of which is assigned a score. The total score determines the extent of malnutrition.
    (STRONGkids= Screening Tool Risk On Nutritional Status and Growth)
    """
* . ^alias[+] = "nl-core-StrongKidsScore"
