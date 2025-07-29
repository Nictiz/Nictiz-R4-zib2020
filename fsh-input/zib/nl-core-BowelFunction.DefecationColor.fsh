Profile: NlcoreBowelFunctionDefecationColor
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.DefecationColor
Id: nl-core-BowelFunction.DefecationColor
Title: "nl core BowelFunction.DefecationColor"
* insert ProfileMetadata(nl-core-BowelFunction.DefecationColor)
* ^purpose = "This Observation resource represents the DefecationColor concept (NL-CM:4.15.10) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."

* value[x] ^binding.strength = #extensible

// Short, alias, definition and comment texts
* ^description = "The color of feces is possibly relevant for identifying underlying diseases, such as bleeding or biliary tract disease."
* . ^alias[+] = "nl-core-BowelFunction.DefecationColor"
