Profile: NlcoreAllergyIntolerance
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AllergyIntolerance
Id: nl-core-AllergyIntolerance
Title: "nl core AllergyIntolerance"
* insert ProfileMetadata(nl-core-AllergyIntolerance)
* insert Purpose(AllergyIntolerance, 3.3, AllergyIntolerance)

* category ..1
* category.extension[allergyCategoryCodelist] ..1
* category.extension[allergyCategoryCodelist] ^binding.strength = #required
* criticality.extension[criticalExtentCodelist] ..1
* criticality.extension[criticalExtentCodelist] ^binding.strength = #required
* code ^binding.strength = #required
* patient only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* note ..1
* reaction.substance ^binding.strength = #required
* reaction.manifestation ^binding.strength = #extensible
* reaction.severity ^binding.strength = #required
* reaction.exposureRoute ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    An allergy or intolerance describes a patient’s tendency towards hypersensitivity to a certain substance, so that an unwanted physiological reaction is expected after exposure to the substance, while most people would not exhibit such a reaction to that amount. The observed physiological changes are usually the result of an immunological reaction.
    The substances can be categorized as follows:
    * Medicine
    * Medicine category
    * Ingredient/addition
    * Nutrition
    * Environmental factor
    * Animal
    * Plants
    * Chemicals
    * Inhaled allergenic
    """
* . ^alias[+] = "nl-core-AllergyIntolerance"
