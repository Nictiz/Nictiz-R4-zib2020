Profile: NlcoreFunctionalOrMentalStatus
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-FunctionalOrMentalStatus
Id: nl-core-FunctionalOrMentalStatus
Title: "nl core FunctionalOrMentalStatus"
* insert ProfileMetadata(nl-core-FunctionalOrMentalStatus)
* insert Purpose(FunctionalOrMentalStatus, 3.2, Observation)

* extension[medicalDevice].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/Resource or http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice)
* category 1..
  * obeys zib-FunctionalOrMentalStatus-1
* category[functionalStatusFinding] ..1
* category[mentalStatusFinding] ..1
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.4--20200901000000 (required)
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.3--20200901000000 (required)
* note ..1

// Short, alias, definition and comment texts
* ^description = "The functional or mental status provides insight into the patient’s functional and mental limitations."
* . ^alias[+] = "nl-core-FunctionalOrMentalStatus"
