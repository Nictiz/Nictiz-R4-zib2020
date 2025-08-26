Profile: NlcoreLaboratoryTestResultSpecimenSource
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult.SpecimenSource
Id: nl-core-LaboratoryTestResult.SpecimenSource
Title: "nl core LaboratoryTestResult.SpecimenSource"
* insert ProfileMetadata(nl-core-LaboratoryTestResult.SpecimenSource)
* ^purpose = "This Device resource represents the SpecimenSource concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LaboratoryTestResult v4.6 (2020)](https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN))."

* deviceName 1..1
* patient only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)

// Short, alias, definition and comment texts
* ^description = "Source of obtained specimen material or a microbial isolate that is used in a laboratory analysis."
* . ^alias[+] = "nl-core-LaboratoryTestResult.SpecimenSource"
* patient
  * ^short = "Patient"
  * ^alias[+] = "Patiënt"

Mapping: NlcoreLaboratoryTestResultSpecimenSource-to-lu-dataset-laboratory-exchange-20210222
Id: lu-dataset-laboratory-exchange-20210222
Title: "ART-DECOR Dataset Lab Exchange 20210222T00:00:00"
Source: NlcoreLaboratoryTestResultSpecimenSource
Target: "https://decor.nictiz.nl/ad/#/lu-/datasets/dataset/2.16.840.1.113883.2.4.3.11.60.25.1.2/2021-02-22T00:00:00"
* patient -> "lu-concept-v2-4303" "Patient"
