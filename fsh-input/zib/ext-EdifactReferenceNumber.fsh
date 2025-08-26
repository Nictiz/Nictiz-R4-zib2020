Extension: ExtEdifactReferenceNumber
Id: ext-EdifactReferenceNumber
Title: "ext EdifactReferenceNumber"
Context: Observation
* insert ProfileMetadata(ext-EdifactReferenceNumber)

* . ^max = "1"
* value[x] only string

// Short, alias, definition and comment texts
* ^description = "This extension can be used to register the reference number of the Edifact message from which (a part of) this healthcare information originates."
* value[x]
  * ^short = "EdifactReferenceNumber"
  * ^alias[+] = "EdifactReferentienummer"
  * ^definition = "A reference number of the Edifact message from which (a part of) this healthcare information originates."
  * ^comment = "Edifact MEDLAB 1.0 has the intended reference number in segment IDE 'Identificatie materiaal/aanvraag' field 2 Identificatienummer"

Mapping: ExtEdifactReferenceNumber-to-lu-dataset-laboratory-exchange-20210222
Id: lu-dataset-laboratory-exchange-20210222
Title: "ART-DECOR Dataset Lab Exchange 20210222T00:00:00"
Source: ExtEdifactReferenceNumber
Target: "https://decor.nictiz.nl/ad/#/lu-/datasets/dataset/2.16.840.1.113883.2.4.3.11.60.25.1.2/2021-02-22T00:00:00"
* value[x] -> "lu-concept-v2-4409" "EdifactReferenceNumber"
