Profile: NlcoreHeadCircumference
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-HeadCircumference
Id: nl-core-HeadCircumference
Title: "nl core HeadCircumference"
* insert ProfileMetadata(nl-core-HeadCircumference)
* insert Purpose(HeadCircumference, 1.3, Observation)

* subject only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* note ..1
* method ^binding.strength = #extensible

// Short, alias, definition and comment texts
* ^description = "The head circumference is the size of the head as measured around the head."
* . ^alias[+] = "nl-core-HeadCircumference"
