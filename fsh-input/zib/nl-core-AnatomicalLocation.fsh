Profile: NlcoreAnatomicalLocation
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AnatomicalLocation
Id: nl-core-AnatomicalLocation
Title: "nl core AnatomicalLocation"
* insert ProfileMetadata(nl-core-AnatomicalLocation)
* insert Purpose(AnatomicalLocation, 1.0, CodeableConcept)

* extension[laterality] ..1

// Short, alias, definition and comment texts
* ^description = "An anatomical location specifies the location (e.g. foot) and laterality (e.g. left) of a body part."
* . ^alias[+] = "nl-core-AnatomicalLocation"

// A data type profile cannot set bindings etc. on the root element, so this pattern can be used to apply them
RuleSet: PatternNlCoreAnatomicalLocation
* ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AnatomicalLocation
* ^binding.strength = #required
