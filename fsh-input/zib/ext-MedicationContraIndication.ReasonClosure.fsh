Extension: ExtMedicationContraIndicationReasonClosure
Id: ext-MedicationContraIndication.ReasonClosure
Title: "ext MedicationContraIndication.ReasonClosure"
Context: Flag
* insert ProfileMetadata(ext-MedicationContraIndication.ReasonClosure)

* value[x] only string

// Short, alias, definition and comment texts
* ^description = "An extension to provide a textual explanation of why the medication contraindication has been closed."
* ^purpose = "This extension represents the ReasonClosure concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) MedicationContraIndication](https://zibs.nl/wiki/MedicationContraIndication-v1.0(2020EN))."
* value[x]
  * ^short = "ReasonClosure"
  * ^alias[+] = "RedenVanAfsluiten"
  * ^definition = "Reason for closing the medication contraindication."

Mapping: ExtMedicationContraIndicationReasonClosure-to-zib-medicationcontraindication-v1.0-2020EN
Id: zib-medicationcontraindication-v1.0-2020EN
Title: "zib MedicationContraIndication-v1.0(2020EN)"
Source: ExtMedicationContraIndicationReasonClosure
Target: "https://zibs.nl/wiki/MedicationContraIndication-v1.0(2020EN)"
* value[x] -> "NL-CM:9.14.4" "ReasonClosure"
