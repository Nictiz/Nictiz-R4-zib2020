Profile: NlcoreBowelFunctionDefecationConsistency
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.DefecationConsistency
Id: nl-core-BowelFunction.DefecationConsistency
Title: "nl core BowelFunction.DefecationConsistency"
* insert ProfileMetadata(nl-core-BowelFunction.DefecationConsistency)
* ^purpose = "This Observation resource represents the DefecationConsistency concept (NL-CM:4.15.9) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."

* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.15.2--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "The consistency of the feces indicates the hardness of the stool. The Bristol Stool scale is used to determine this."
* . ^alias[+] = "nl-core-BowelFunction.DefecationConsistency"
