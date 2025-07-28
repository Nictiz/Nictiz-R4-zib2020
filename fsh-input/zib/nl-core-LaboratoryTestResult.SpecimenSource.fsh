Profile: NlcoreLaboratoryTestResultSpecimenSource
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult.SpecimenSource
Id: nl-core-LaboratoryTestResult.SpecimenSource
Title: "nl core LaboratoryTestResult.SpecimenSource"
* insert ProfileMetadata(nl-core-LaboratoryTestResult.SpecimenSource)
* ^purpose = "This Device resource represents the SpecimenSource concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LaboratoryTestResult v4.6 (2020)](https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN))."

* deviceName 1..1

// Short, alias, definition and comment texts
* ^description = "Source of obtained specimen material or a microbial isolate that is used in a laboratory analysis."
* . ^alias[+] = "nl-core-LaboratoryTestResult.SpecimenSource"
