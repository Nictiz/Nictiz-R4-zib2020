Extension: ExtVaccinationPharmaceuticalProduct
Id: ext-Vaccination.PharmaceuticalProduct
Title: "ext Vaccination.PharmaceuticalProduct"
Context: Immunization
* insert ProfileMetadata(ext-Vaccination.PharmaceuticalProduct)

* value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-PharmaceuticalProduct)

// Short, alias, definition and comment texts
* ^description = "An extension to refer to zib PharmaceuticalProduct from an Immunization resource."
* value[x]
  * ^short = "PharmaceuticalProduct"
  * ^alias[+] = "FarmaceutischProduct"

Mapping: ExtVaccinationPharmaceuticalProduct-to-imm-Vaccination-Immunization-20211118
Id: imm-Vaccination-Immunization-20211118
Title: "ART-DECOR Dataset Vaccination-Immunization 20211118T10:06:34"
Source: ExtVaccinationPharmaceuticalProduct
Target: "https://decor.nictiz.nl/ad/#/imm-/datasets/dataset/2.16.840.1.113883.2.4.3.11.60.131.1.1/2021-11-18T10:06:34"
* value[x] -> "imm-dataelement-111" "PharmaceuticalProduct"
