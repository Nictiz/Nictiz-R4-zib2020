Profile: NlcoreBodyHeight
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BodyHeight
Id: nl-core-BodyHeight
Title: "nl core BodyHeight"
* insert ProfileMetadata(nl-core-BodyHeight)
* insert Purpose(BodyHeight, 3.1.1, Observation)

* value[x] from http://hl7.org/fhir/ValueSet/ucum-bodylength (required)
* note ..1
* component[position] ..1
* component[position].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.2.1--20200901000000 (extensible)

// Short, alias, definition and comment texts
* ^description = "A person’s body height."
* . ^alias[+] = "nl-core-BodyHeight"
