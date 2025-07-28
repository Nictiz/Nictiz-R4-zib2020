Profile: NlbaseBowelFunctionFrequency
Parent: Observation
Id: nl-base-BowelFunction.Frequency
Title: "nl base BowelFunction.Frequency"
* insert ProfileMetadata(nl-base-BowelFunction.Frequency)
* ^purpose = "This Observation resource represents the Frequency concept (NL-CM:4.15.4) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."

* code = http://snomed.info/sct#162098000
* value[x] only Quantity

// Short, alias, definition and comment texts
* ^description = "The defecation frequency."
* . ^comment = "This Observation resource represents the Frequency concept (NL-CM:4.15.4) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."
* value[x]
  * ^short = "Frequency"
  * ^alias[+] = "Frequentie"
  * ^definition = "The defecation frequency."

Mapping: NlbaseBowelFunctionFrequency-to-zib-bowelfunction-v3.1.1-2020EN
Id: zib-bowelfunction-v3.1.1-2020EN
Title: "zib BowelFunction-v3.1.1(2020EN)"
Source: NlbaseBowelFunctionFrequency
Target: "https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN)"
* value[x] -> "NL-CM:4.15.4" "Frequency"
