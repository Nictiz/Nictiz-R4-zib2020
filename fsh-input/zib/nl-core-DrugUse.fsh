Profile: NlcoreDrugUse
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-DrugUse
Id: nl-core-DrugUse
Title: "nl core DrugUse"
* insert ProfileMetadata(nl-core-DrugUse)
* insert Purpose(DrugUse, 3.3, Observation)

* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.4.2--20200901000000 (extensible)
* note ..1
* component[amount] ..1
* component[drugOrMedicationType] ..1
* component[drugOrMedicationType].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.4.1--20200901000000 (extensible)
* component[routeOfAdministration].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.4.3--20200901000000 (extensible)

// Short, alias, definition and comment texts
* ^description = """
    Drugs (or: narcotics, amphetamines, intoxicants, highs, hallucinogenics, illegal substances or dope) is a collective term for drugs and chemical substances with a more or less ‘drugging' (anesthetic, boosting and/or hallucinogenic) effect and which can lead to addiction. Drug [Online] Available at: nl.Wikipedia.org/wiki/drug [Accessed: 11 February 2015].
    
    This information model describes the information asked of the patient about their drug use.
    """
* . ^alias[+] = "nl-core-DrugUse"
