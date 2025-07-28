Extension: ExtTreatmentDirective2ReasonForEnding
Id: ext-TreatmentDirective2.ReasonForEnding
Title: "ext TreatmentDirective2.ReasonForEnding"
Context: Consent.provision
* insert ProfileMetadata(ext-TreatmentDirective2.ReasonForEnding)

* . 0..1
* value[x] only string

// Short, alias, definition and comment texts
* ^description = "An extension to provide the reason why the agreement on a treatment directive no longer applies."
* ^purpose = "This extension represents the ReasonForEnding concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) TreatmentDirective2 v1.0 (2020)](https://zibs.nl/wiki/TreatmentDirective2-v1.0(2020EN))."
* value[x]
  * ^short = "ReasonForEnding"
  * ^alias[+] = "RedenBeeindigd"
  * ^definition = "Reason why the agreement on a treatment directive no longer applies."

Mapping: ExtTreatmentDirective2ReasonForEnding-to-zib-treatmentdirective2-v1.0-2020EN
Id: zib-treatmentdirective2-v1.0-2020EN
Title: "zib TreatmentDirective2-v1.0(2020EN)"
Source: ExtTreatmentDirective2ReasonForEnding
Target: "https://zibs.nl/wiki/TreatmentDirective2-v1.0(2020EN)"
* value[x] -> "NL-CM:2.2.7" "ReasonForEnding"
