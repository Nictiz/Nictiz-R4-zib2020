Profile: NlcoreDrugUse
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-DrugUse
Id: nl-core-DrugUse
Title: "nl core DrugUse"
* insert ProfileMetadata(nl-core-DrugUse)
* insert Purpose(DrugUse, 3.3, Observation)

* insert NlCorePatientForObservation
* valueCodeableConcept ^binding.strength = #extensible
* note ..1
* component[amount] ..1
* component[drugOrMedicationType] ..1
* component[drugOrMedicationType].value[x] ^binding.strength = #extensible
* component[routeOfAdministration].value[x] ^binding.strength = #extensible

// Short, alias, definition and comment texts
* ^description = """
    Drugs (or: narcotics, amphetamines, intoxicants, highs, hallucinogenics, illegal substances or dope) is a collective term for drugs and chemical substances with a more or less ‘drugging' (anesthetic, boosting and/or hallucinogenic) effect and which can lead to addiction. Drug [Online] Available at: nl.Wikipedia.org/wiki/drug [Accessed: 11 February 2015].
    
    This information model describes the information asked of the patient about their drug use.
    """
* . ^alias[+] = "nl-core-DrugUse"
