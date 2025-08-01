Profile: NlcoreBowelFunctionDefecationConsistency
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.DefecationConsistency
Id: nl-core-BowelFunction.DefecationConsistency
Title: "nl core BowelFunction.DefecationConsistency"
* insert ProfileMetadata(nl-core-BowelFunction.DefecationConsistency)
* ^purpose = "This Observation resource represents the DefecationConsistency concept (NL-CM:4.15.9) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."

* insert NlCorePatientForObservation
* value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "The consistency of the feces indicates the hardness of the stool. The Bristol Stool scale is used to determine this."
* . ^alias[+] = "nl-core-BowelFunction.DefecationConsistency"
