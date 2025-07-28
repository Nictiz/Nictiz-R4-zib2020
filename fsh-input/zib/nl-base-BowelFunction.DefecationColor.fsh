Profile: NlbaseBowelFunctionDefecationColor
Parent: Observation
Id: nl-base-BowelFunction.DefecationColor
Title: "nl base BowelFunction.DefecationColor"
* insert ProfileMetadata(nl-base-BowelFunction.DefecationColor)
* ^purpose = "This Observation resource represents the DefecationColor concept (NL-CM:4.15.10) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."

* code = http://loinc.org#9397-1
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.15.5--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "The color of feces is possibly relevant for identifying underlying diseases, such as bleeding or biliary tract disease."
* . ^comment = "This Observation resource represents the DefecationColor concept (NL-CM:4.15.10) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."
* value[x]
  * ^short = "DefecationColor"
  * ^alias[+] = "DefecatieKleur"
  * ^definition = "The color of feces is possibly relevant for identifying underlying diseases, such as bleeding or biliary tract disease."

Mapping: NlbaseBowelFunctionDefecationColor-to-zib-bowelfunction-v3.1.1-2020EN
Id: zib-bowelfunction-v3.1.1-2020EN
Title: "zib BowelFunction-v3.1.1(2020EN)"
Source: NlbaseBowelFunctionDefecationColor
Target: "https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN)"
* value[x] -> "NL-CM:4.15.10" "DefecationColor"
