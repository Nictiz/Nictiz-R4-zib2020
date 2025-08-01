Profile: NlcoreBodyWeight
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BodyWeight
Id: nl-core-BodyWeight
Title: "nl core BodyWeight"
* insert ProfileMetadata(nl-core-BodyWeight)
* insert Purpose(BodyWeight, 3.2, Observation)

* subject only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* value[x] from http://nictiz.nl/fhir/ValueSet/zib-BodyWeight-units (required)
* note ..1
* component[clothing] ..1
* component[clothing].value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "Body weight is the common name for (human) body mass."
* . ^alias[+] = "nl-core-BodyWeight"
