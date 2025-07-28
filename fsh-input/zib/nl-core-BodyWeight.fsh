Profile: NlcoreBodyWeight
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BodyWeight
Id: nl-core-BodyWeight
Title: "nl core BodyWeight"
* insert ProfileMetadata(nl-core-BodyWeight)
* insert Purpose(BodyWeight, 3.2, Observation)

* value[x] from http://nictiz.nl/fhir/ValueSet/zib-BodyWeight-units (required)
* note ..1
* component[clothing] ..1
* component[clothing].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.1.1--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "Body weight is the common name for (human) body mass."
* . ^alias[+] = "nl-core-BodyWeight"
