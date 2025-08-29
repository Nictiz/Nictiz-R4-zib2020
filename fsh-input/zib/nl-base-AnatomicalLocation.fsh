Profile: NlbaseAnatomicalLocation
Parent: CodeableConcept
Id: nl-base-AnatomicalLocation
Title: "nl base AnatomicalLocation"
* insert ProfileMetadata(nl-base-AnatomicalLocation)
* insert Purpose(AnatomicalLocation, 1.0, CodeableConcept)

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-AnatomicalLocation.Laterality named laterality 0..1

// Short, alias, definition and comment texts
* ^description = "An anatomical location specifies the location (e.g. foot) and laterality (e.g. left) of a body part."
* .
  * ^short = "Location"
  * ^alias[+] = "Locatie"
  * ^definition = "Localisation on/in the body."

Mapping: NlbaseAnatomicalLocation-to-zib-anatomicallocation-v1.0-2020EN
Id: zib-anatomicallocation-v1.0-2020EN
Title: "zib AnatomicalLocation-v1.0(2020EN)"
Source: NlbaseAnatomicalLocation
Target: "https://zibs.nl/wiki/AnatomicalLocation-v1.0(2020EN)"
*  -> "NL-CM:20.7.4" "Location"

// A data type profile cannot set bindings etc. on the root element, so this pattern can be used to apply them
RuleSet: PatternNlBaseAnatomicalLocation
* ^type.code = #CodeableConcept
* ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AnatomicalLocation
* ^binding.valueSet = "http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000"
* ^binding.strength = #preferred
