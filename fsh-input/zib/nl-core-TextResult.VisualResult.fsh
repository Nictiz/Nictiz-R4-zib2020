Profile: NlcoreTextResultVisualResult
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-TextResult.VisualResult
Id: nl-core-TextResult.VisualResult
Title: "nl core TextResult.VisualResult"
* insert ProfileMetadata(nl-core-TextResult.VisualResult)
* ^purpose = "This Media resource represents the VisualResult concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) TextResult v4.4 (2020)](https://zibs.nl/wiki/TextResult-v4.4(2020EN))."

* subject only 	Reference(Patient or Practitioner or PractitionerRole or Group or Device or Specimen or Location or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)

// Short, alias, definition and comment texts
* ^description = "Visual examination results that are the starting point and reason for the textual report as represented by the zib TextResult. These results include visual material - e.g. radiological images, scopy images, medical photos and videos - as well as graphic recordings - e.g. ECGs, EEGs etc."
* . ^alias[+] = "nl-core-TextResult.VisualResult"
