Profile: NlbaseBowelFunctionDefecationConsistency
Parent: Observation
Id: nl-base-BowelFunction.DefecationConsistency
Title: "nl base BowelFunction.DefecationConsistency"
* insert ProfileMetadata(nl-base-BowelFunction.DefecationConsistency)
* ^purpose = "This Observation resource represents the DefecationConsistency concept (NL-CM:4.15.9) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."

* code = http://snomed.info/sct#443172007
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.15.2--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "The consistency of the feces indicates the hardness of the stool. The Bristol Stool scale is used to determine this."
* . ^comment = "This Observation resource represents the DefecationConsistency concept (NL-CM:4.15.9) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) BowelFunction v3.1.1 (2020)](https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN))."
* value[x]
  * ^short = "DefecationConsistency"
  * ^alias[+] = "DefecatieConsistentie"
  * ^definition = "The consistency of the feces indicates the hardness of the stool. The Bristol Stool scale is used to determine this."

Mapping: NlbaseBowelFunctionDefecationConsistency-to-zib-bowelfunction-v3.1.1-2020EN
Id: zib-bowelfunction-v3.1.1-2020EN
Title: "zib BowelFunction-v3.1.1(2020EN)"
Source: NlbaseBowelFunctionDefecationConsistency
Target: "https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN)"
* value[x] -> "NL-CM:4.15.9" "DefecationConsistency"
