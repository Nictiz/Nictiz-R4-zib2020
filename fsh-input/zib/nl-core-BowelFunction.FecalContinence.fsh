Profile: NlcoreBowelFunctionFecalContinence
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.FecalContinence
Id: nl-core-BowelFunction.FecalContinence
Title: "nl core BowelFunction.FecalContinence"
* insert ProfileMetadata(nl-core-BowelFunction.FecalContinence)
* ^purpose = "This Observation resource represents the FecalContinence concept (NL-CM:4.15.2) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."

* insert NlCorePatientForObservation
* value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "Fecal continence is the voluntary control over the excretion of feces."
* . ^alias[+] = "nl-core-BowelFunction.FecalContinence"
