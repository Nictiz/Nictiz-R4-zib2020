Extension: ExtAdvanceDirectiveDisorder
Id: ext-AdvanceDirective.Disorder
Title: "ext AdvanceDirective.Disorder"
Context: Consent
* insert ProfileMetadata(ext-AdvanceDirective.Disorder)

* value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)

// Short, alias, definition and comment texts
* ^description = "An extension to provide the problem or disorder to which the living will applies."
* ^purpose = "This extension represents the Disorder concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AdvanceDirective v3.1.1 (2020)](https://zibs.nl/wiki/AdvanceDirective-v3.1.1(2020EN))."
* value[x]
  * ^short = "Disorder"
  * ^alias[+] = "Aandoening"
  * ^definition = "The problem or disorder to which the living will applies."

Mapping: ExtAdvanceDirectiveDisorder-to-zib-advancedirective-v3.1.1-2020EN
Id: zib-advancedirective-v3.1.1-2020EN
Title: "zib AdvanceDirective-v3.1.1(2020EN)"
Source: ExtAdvanceDirectiveDisorder
Target: "https://zibs.nl/wiki/AdvanceDirective-v3.1.1(2020EN)"
* value[x] -> "NL-CM:7.15.4" "Disorder"
