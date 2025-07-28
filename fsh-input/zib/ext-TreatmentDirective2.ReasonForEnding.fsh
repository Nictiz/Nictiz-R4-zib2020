Extension: ExtTreatmentDirective2ReasonForEnding
Id: ext-TreatmentDirective2.ReasonForEnding
Title: "ext TreatmentDirective2.ReasonForEnding"
Context: Consent.provision
* insert ProfileMetadata(ext-TreatmentDirective2.ReasonForEnding)

* value[x] only string

// Short, alias, definition and comment texts
* ^description = "An extension to provide the reason why the agreement on a treatment directive no longer applies."
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
