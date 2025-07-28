Extension: ExtTreatmentDirective2SpecificationOther
Id: ext-TreatmentDirective2.SpecificationOther
Title: "ext TreatmentDirective2.SpecificationOther"
Context: Consent
* insert ProfileMetadata(ext-TreatmentDirective2.SpecificationOther)

* . 0..1
* . ?!
* . ^isModifierReason = "This extension extends the options of _deny_ and _permit_ of `Consent.provision.type` with the opportunity to provide free text. The `Consent.provision` cannot be safely interpreted if the free text in this extension is omitted, hence the reason for labeling this extension as a modifier."
* value[x] only string

// Short, alias, definition and comment texts
* ^description = "An extension to provide the specification of the treatment decision when the decision is 'Other'."
* ^purpose = "This extension represents the SpecificationOther concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) TreatmentDirective2 v1.0 (2020)](https://zibs.nl/wiki/TreatmentDirective2-v1.0(2020EN))."
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
