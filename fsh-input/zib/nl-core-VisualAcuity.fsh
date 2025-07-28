Profile: NlcoreVisualAcuity
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-VisualAcuity
Id: nl-core-VisualAcuity
Title: "nl core VisualAcuity"
* insert ProfileMetadata(nl-core-VisualAcuity)
* insert Purpose(VisualAcuity, 1.0, Observation)

* component[visualAcuityType] ..1
* component[visualAcuityType].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.19.2--20200901000000 (extensible)
* component[visualAcuityMeasurementChart] ..1
* component[visualAcuityMeasurementChart].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.19.3--20200901000000 (extensible)
* component[distanceFromChart] ..1

// Short, alias, definition and comment texts
* ^description = "Visual acuity is a measurement of sharpness of vision. It is a measure of the smallest details that someone can still distinguish."
* . ^alias[+] = "nl-core-VisualAcuity"
