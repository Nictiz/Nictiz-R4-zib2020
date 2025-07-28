Extension: ExtTreatmentDirective2AdvanceDirective
Id: ext-TreatmentDirective2.AdvanceDirective
Title: "ext TreatmentDirective2.AdvanceDirective"
Context: Consent
* insert ProfileMetadata(ext-TreatmentDirective2.AdvanceDirective)

* value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-AdvanceDirective)

// Short, alias, definition and comment texts
* ^description = "An extension to provide a (written) statement in which a person indicates wishes concerning future medical action, in the event that this person is at that point no longer (deemed) capable of taking decisions on the matter."
* value[x]
  * ^short = "AdvanceDirective"
  * ^alias[+] = "Wilsverklaring"
  * ^definition = "A (written) statement in which a person indicates wishes concerning future medical action, in the event that this person is at that point no longer (deemed) capable of taking decisions on the matter."

Mapping: ExtTreatmentDirective2AdvanceDirective-to-zib-treatmentdirective2-v1.0-2020EN
Id: zib-treatmentdirective2-v1.0-2020EN
Title: "zib TreatmentDirective2-v1.0(2020EN)"
Source: ExtTreatmentDirective2AdvanceDirective
Target: "https://zibs.nl/wiki/TreatmentDirective2-v1.0(2020EN)"
* value[x] -> "NL-CM:2.2.8" "AdvanceDirective"
