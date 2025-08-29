Profile: NlcoreLaboratoryTestResultSpecimen
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult.Specimen
Id: nl-core-LaboratoryTestResult.Specimen
Title: "nl core LaboratoryTestResult.Specimen"
* insert ProfileMetadata(nl-core-LaboratoryTestResult.Specimen)
* ^purpose = "This Specimen resource represents the Specimen concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LaboratoryTestResult v4.6 (2020)](https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN))."

* type from http://nictiz.nl/fhir/ValueSet/Monstermateriaal-en-Microorganisme-Codelijsten (required)
* subject only Reference(Patient or Group or Device or Substance or Location or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult.SpecimenSource)
* parent only Reference(Specimen or http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult.Specimen)
* collection.method ^binding.strength = #required
* collection.bodySite insert PatternNlCoreAnatomicalLocation
* collection.bodySite.extension[morphology] ..1
* container.type from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.9--20220610000000 (extensible)
* note ..1

// Short, alias, definition and comment texts
* ^description = "Obtained specimen material or a microbial isolate that is used in a laboratory analysis."
* . ^alias[+] = "nl-core-LaboratoryTestResult.Specimen"
* subject ^comment = "If zib concept SpecimenSource (NL-CM:13.1.29) is used, it can be recorded here using a reference to an instance of the [nl-core-LaboratoryTestResult.SpecimenSource](http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult.SpecimenSource) profile. In this case, the patient is communicated using `Device.patient` in the referenced resource."
* container.type ^comment = "Note: ValueSet is from Zib Release 2022-1. Adds \"is-a 706046003 | Specimen receptacle (physical object) | \". See https://bits.nictiz.nl/browse/ZIB-1552 for more information."

Mapping: NlcoreLaboratoryTestResult-to-zib-laboratorytestresult-v5.1-2022EN
Id: zib-laboratorytestresult-v5.1-2022EN
Title: "zib LaboratoryTestResult-v5.1(2022EN)"
Source: NlbaseLaboratoryTestResultSpecimen
Target: "https://zibs.nl/wiki/LaboratoryTestResult-v5.1(2022EN)"
* container.type -> "NL-CM:13.1.21" "ContainerType"
