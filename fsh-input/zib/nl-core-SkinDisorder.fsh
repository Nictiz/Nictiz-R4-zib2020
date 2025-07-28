Profile: NlcoreSkinDisorder
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-SkinDisorder
Id: nl-core-SkinDisorder
Title: "nl core SkinDisorder"
* insert ProfileMetadata(nl-core-SkinDisorder)
* insert Purpose(SkinDisorder, 3.3, Observation)

* extension[cause] ..1
* category 1..
* category[skinDisorderCode] 1..1
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.19.3.1--20200901000000 (extensible)
* bodySite ..1
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (required)
* note ..1

// Short, alias, definition and comment texts
* ^description = "A skin condition is a disturbance of the organ skin caused by a source to be specified later on."
* . ^alias[+] = "nl-core-SkinDisorder"
