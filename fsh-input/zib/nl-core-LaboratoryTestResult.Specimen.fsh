Profile: NlcoreLaboratoryTestResultSpecimen
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult.Specimen
Id: nl-core-LaboratoryTestResult.Specimen
Title: "nl core LaboratoryTestResult.Specimen"
* insert ProfileMetadata(nl-core-LaboratoryTestResult.Specimen)
* ^purpose = "This Specimen resource represents the Specimen concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LaboratoryTestResult v4.6 (2020)](https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN))."

* type from http://nictiz.nl/fhir/ValueSet/Monstermateriaal-en-Microorganisme-Codelijsten (required)
* subject only Reference(http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/Group or http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/Substance or http://hl7.org/fhir/StructureDefinition/Location or http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult.SpecimenSource)
* parent only Reference(http://hl7.org/fhir/StructureDefinition/Specimen or http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult.Specimen)
* collection.method ^binding.strength = #required
* collection.bodySite ^binding.strength = #required
* collection.bodySite.extension[morphology] ..1
* container.type ^binding.strength = #extensible
* note ..1

// Short, alias, definition and comment texts
* ^description = "Obtained specimen material or a microbial isolate that is used in a laboratory analysis."
* . ^alias[+] = "nl-core-LaboratoryTestResult.Specimen"
* subject ^comment = "If zib concept SpecimenSource (NL-CM:13.1.29) is used, it can be recorded here using a reference to an instance of the [nl-core-LaboratoryTestResult.SpecimenSource](http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult.SpecimenSource) profile."
