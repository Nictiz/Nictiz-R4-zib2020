Extension: ExtTimeIntervalPeriod
Id: ext-TimeInterval.Period
Title: "ext TimeInterval.Period"
Context: MedicationRequest
* insert ProfileMetadata(ext-TimeInterval.Period)

* value[x] only Period
* value[x] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-TimeInterval

// Short, alias, definition and comment texts
* ^description = "An extension to provide all concepts of zib TimeInterval, to be used in resources where none of these concepts are natively supported."
