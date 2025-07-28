Extension: ExtLaboratoryTestResultSpecimenMorphology
Id: ext-LaboratoryTestResult.Specimen.Morphology
Title: "ext LaboratoryTestResult.Specimen.Morphology"
Context: Specimen.collection.bodySite
* insert ProfileMetadata(ext-LaboratoryTestResult.Specimen.Morphology)

* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.13--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "An extension to provide the morphological abnormalities of the anatomical location where the specimen material is taken, for example wound, ulcer."
* ^purpose = "This extension represents the Specimen.Morphology concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LaboratoryTestResult v4.6 (2020)](https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN))."
* value[x]
  * ^short = "Morphology"
  * ^alias[+] = "Morfologie"
  * ^definition = "Morphology describes morphological abnormalities of the anatomical location where the material is taken, for example wound, ulcer."

Mapping: ExtLaboratoryTestResultSpecimenMorphology-to-zib-laboratorytestresult-v4.6-2020EN
Id: zib-laboratorytestresult-v4.6-2020EN
Title: "zib LaboratoryTestResult-v4.6(2020EN)"
Source: ExtLaboratoryTestResultSpecimenMorphology
Target: "https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN)"
* value[x] -> "NL-CM:13.1.28" "Morphology"
