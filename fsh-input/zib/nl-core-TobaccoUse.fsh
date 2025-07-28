Profile: NlcoreTobaccoUse
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-TobaccoUse
Id: nl-core-TobaccoUse
Title: "nl core TobaccoUse"
* insert ProfileMetadata(nl-core-TobaccoUse)
* insert Purpose(TobaccoUse, 3.2, Observation)

* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.2.2--20200901000000 (extensible)
* note ..1
* component[typeOfTobaccoUsed] ..1
* component[typeOfTobaccoUsed].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.2.3--20200901000000 (extensible)
* component[amount] ..1
* component[packYears] ..1

// Short, alias, definition and comment texts
* ^description = "Tobacco is a product that comes from the leaves of the tobacco plant, which is smoked as a drug. Smokable forms of tobacco include rolling tobacco, cigarettes, cigars and pipe tobacco. This information model describes the information asked of the patient about their use of tobacco."
* . ^alias[+] = "nl-core-TobaccoUse"
