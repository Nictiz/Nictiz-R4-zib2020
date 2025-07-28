Profile: NlbaseBowelFunctionFecalContinence
Parent: Observation
Id: nl-base-BowelFunction.FecalContinence
Title: "nl base BowelFunction.FecalContinence"
* insert ProfileMetadata(nl-base-BowelFunction.FecalContinence)
* ^purpose = "This Observation resource represents the FecalContinence concept (NL-CM:4.15.2) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."

* code = http://snomed.info/sct#129008009
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.15.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Fecal continence is the voluntary control over the excretion of feces."
* . ^comment = "This Observation resource represents the FecalContinence concept (NL-CM:4.15.2) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."
* value[x]
  * ^short = "FecalContinence"
  * ^alias[+] = "FecesContinentie"
  * ^definition = "Fecal continence is the voluntary control over the excretion of feces."

Mapping: NlbaseBowelFunctionFecalContinence-to-zib-bowelfunction-v3.1.1-2020EN
Id: zib-bowelfunction-v3.1.1-2020EN
Title: "zib BowelFunction-v3.1.1(2020EN)"
Source: NlbaseBowelFunctionFecalContinence
Target: "https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN)"
* value[x] -> "NL-CM:4.15.2" "FecalContinence"
