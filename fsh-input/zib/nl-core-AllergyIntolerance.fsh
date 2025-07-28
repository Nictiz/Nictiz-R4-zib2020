Profile: NlcoreAllergyIntolerance
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AllergyIntolerance
Id: nl-core-AllergyIntolerance
Title: "nl core AllergyIntolerance"
* insert ProfileMetadata(nl-core-AllergyIntolerance)
* insert Purpose(AllergyIntolerance, 3.3, AllergyIntolerance)

* clinicalStatus from http://hl7.org/fhir/ValueSet/allergyintolerance-clinical|4.0.1 (required)
* verificationStatus from http://hl7.org/fhir/ValueSet/allergyintolerance-verification|4.0.1 (required)
* category ..1
* category from http://hl7.org/fhir/ValueSet/allergy-intolerance-category|4.0.1 (required)
* category.extension[allergyCategoryCodelist] ..1
* category.extension[allergyCategoryCodelist].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.2.2--20200901000000 (required)
* criticality from http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality|4.0.1 (required)
* criticality.extension[criticalExtentCodelist] ..1
* criticality.extension[criticalExtentCodelist].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.2.4--20200901000000 (required)
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.2--20200901000000 (required)
* note ..1
* reaction.substance from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.1--20200901000000 (required)
* reaction.manifestation from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.2.5--20200901000000 (extensible)
* reaction.severity from http://hl7.org/fhir/ValueSet/reaction-event-severity|4.0.1 (required)
* reaction.exposureRoute from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.2.12--20200901000000 (required)

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
