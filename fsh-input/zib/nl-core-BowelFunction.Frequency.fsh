Profile: NlcoreBowelFunctionFrequency
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.Frequency
Id: nl-core-BowelFunction.Frequency
Title: "nl core BowelFunction.Frequency"
* insert ProfileMetadata(nl-core-BowelFunction.Frequency)
* ^purpose = "This Observation resource represents the Frequency concept (NL-CM:4.15.4) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."

* insert NlCorePatientForObservation

// Short, alias, definition and comment texts
* ^description = "The defecation frequency."
* . ^alias[+] = "nl-core-BowelFunction.Frequency"
