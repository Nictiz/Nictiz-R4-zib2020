Profile: NlcoreBodyTemperature
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BodyTemperature
Id: nl-core-BodyTemperature
Title: "nl core BodyTemperature"
* insert ProfileMetadata(nl-core-BodyTemperature)
* insert Purpose(BodyTemperature, 3.1.2, Observation)

* code.coding[BodyTempCode] 1..1
* code.coding[temperatureType] ..1
* code.coding[temperatureType] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.6.1--20200901000000 (required)
* note ..1

// Short, alias, definition and comment texts
* ^description = "Measuring and documenting the body temperature of a person as a surrogate for a person’s central body temperature (the highest temperature at the centre of the torso)"
* . ^alias[+] = "nl-core-BodyTemperature"
