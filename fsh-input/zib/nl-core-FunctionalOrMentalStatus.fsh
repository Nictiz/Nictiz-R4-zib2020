Profile: NlcoreFunctionalOrMentalStatus
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-FunctionalOrMentalStatus
Id: nl-core-FunctionalOrMentalStatus
Title: "nl core FunctionalOrMentalStatus"
* insert ProfileMetadata(nl-core-FunctionalOrMentalStatus)
* insert Purpose(FunctionalOrMentalStatus, 3.2, Observation)

* insert NlCorePatientForObservation
* extension[medicalDevice].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/Resource or http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice)
* category 1..
  * obeys zib-FunctionalOrMentalStatus-1
* category[functionalStatusFinding] ..1
* category[mentalStatusFinding] ..1
* code ^binding.strength = #required
* valueCodeableConcept ^binding.strength = #required
* note ..1

// Short, alias, definition and comment texts
* ^description = "The functional or mental status provides insight into the patient’s functional and mental limitations."
* . ^alias[+] = "nl-core-FunctionalOrMentalStatus"
