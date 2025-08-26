Extension: ExtCopyIndicator
Id: ext-CopyIndicator
Title: "ext CopyIndicator"
Context: MedicationStatement, MedicationDispense, Observation, Specimen, Device, AllergyIntolerance.reaction
* insert ProfileMetadata(ext-CopyIndicator)

* . ^max = "1"
* value[x] only boolean

// Short, alias, definition and comment texts
* ^description = "This extension provides an indication whether the resource is original (false) or a copy from a different source (true)."
* value[x]
  * ^short = "CopyIndicator"
  * ^alias[+] = "KopieIndicator"
  * ^definition = "An indication whether the resource is original (false) or a copy from a different source (true)."

Mapping: ExtCopyIndicator-to-lu-dataset-laboratory-exchange-20210222
Id: lu-dataset-laboratory-exchange-20210222
Title: "ART-DECOR Dataset Lab Exchange 20210222T00:00:00"
Source: ExtCopyIndicator
Target: "https://decor.nictiz.nl/ad/#/lu-/datasets/dataset/2.16.840.1.113883.2.4.3.11.60.25.1.2/2021-02-22T00:00:00"
* value[x] -> "lu-concept-v2-4297" "CopyIndicator"
