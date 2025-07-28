Extension: ExtTreatmentDirective2SpecificationOther
Id: ext-TreatmentDirective2.SpecificationOther
Title: "ext TreatmentDirective2.SpecificationOther"
Context: Consent
* insert ProfileMetadata(ext-TreatmentDirective2.SpecificationOther)

* value[x] only string

// Short, alias, definition and comment texts
* ^description = "An extension to provide the specification of the treatment decision when the decision is 'Other'."
* value[x]
  * ^short = "SpecificationOther"
  * ^alias[+] = "SpecificatieAnders"
  * ^definition = "Specification of the treatment decision when the decision is 'Other'."

Mapping: ExtTreatmentDirective2SpecificationOther-to-zib-treatmentdirective2-v1.0-2020EN
Id: zib-treatmentdirective2-v1.0-2020EN
Title: "zib TreatmentDirective2-v1.0(2020EN)"
Source: ExtTreatmentDirective2SpecificationOther
Target: "https://zibs.nl/wiki/TreatmentDirective2-v1.0(2020EN)"
* value[x] -> "NL-CM:2.2.4" "SpecificationOther"
