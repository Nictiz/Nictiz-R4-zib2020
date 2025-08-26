Profile: NlcoreVisualAcuity
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-VisualAcuity
Id: nl-core-VisualAcuity
Title: "nl core VisualAcuity"
* insert ProfileMetadata(nl-core-VisualAcuity)
* insert Purpose(VisualAcuity, 1.0, Observation)

* device only Reference(Device or DeviceMetric or http://nictiz.nl/fhir/StructureDefinition/nl-core-VisualAcuity.VisualAcuityMeasurementDevice)
* component[visualAcuityType] ..1
* component[visualAcuityType].value[x] ^binding.strength = #extensible
* component[visualAcuityMeasurementChart] ..1
* component[visualAcuityMeasurementChart].value[x] ^binding.strength = #extensible
* component[distanceFromChart] ..1

// Short, alias, definition and comment texts
* ^description = "Visual acuity is a measurement of sharpness of vision. It is a measure of the smallest details that someone can still distinguish."
* . ^alias[+] = "nl-core-VisualAcuity"
