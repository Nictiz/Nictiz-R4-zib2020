Extension: ExtAnatomicalLocationLaterality
Id: ext-AnatomicalLocation.Laterality
Title: "ext AnatomicalLocation.Laterality"
Context: CodeableConcept
* insert ProfileMetadata(ext-AnatomicalLocation.Laterality)

* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.20.7.2--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "An extension to provide information about body site to the anatomic location, e.g. left."
* ^purpose = "This extension represents the Laterality concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AnatomicalLocation v1.0 (2020)](https://zibs.nl/wiki/AnatomicalLocation-v1.0(2020EN)). It is to be used together with the <http://nictiz.nl/fhir/StructureDefinition/zib-AnatomicalLocation> datatype profile."
* value[x]
  * ^short = "Laterality"
  * ^alias[+] = "Lateraliteit"
  * ^definition = "Laterality adds information about body site to the anatomic location, e.g. left."

Mapping: ExtAnatomicalLocationLaterality-to-zib-anatomicallocation-v1.0-2020EN
Id: zib-anatomicallocation-v1.0-2020EN
Title: "zib AnatomicalLocation-v1.0(2020EN)"
Source: ExtAnatomicalLocationLaterality
Target: "https://zibs.nl/wiki/AnatomicalLocation-v1.0(2020EN)"
* value[x] -> "NL-CM:20.7.3" "Laterality"
