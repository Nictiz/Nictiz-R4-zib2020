Profile: NlcoreBodyTemperature
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BodyTemperature
Id: nl-core-BodyTemperature
Title: "nl core BodyTemperature"
* insert ProfileMetadata(nl-core-BodyTemperature)
* insert Purpose(BodyTemperature, 3.1.2, Observation)

* code.coding[BodyTempCode] 1..1
* code.coding[temperatureType] ..1
* code.coding[temperatureType] ^binding.strength = #required
* subject only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* note ..1

// Short, alias, definition and comment texts
* ^description = "Measuring and documenting the body temperature of a person as a surrogate for a person’s central body temperature (the highest temperature at the centre of the torso)"
* . ^alias[+] = "nl-core-BodyTemperature"
