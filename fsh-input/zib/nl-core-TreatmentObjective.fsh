Profile: NlcoreTreatmentObjective
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-TreatmentObjective
Id: nl-core-TreatmentObjective
Title: "nl core TreatmentObjective"
* insert ProfileMetadata(nl-core-TreatmentObjective)
* insert Purpose(TreatmentObjective, 3.2, Goal)

* subject only Reference(Patient or Group or Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* target.measure ^binding.strength = #required
* target.detailCodeableConcept ^binding.strength = #required
* addresses ..1
* addresses only Reference(Condition or Observation or MedicationStatement or NutritionOrder or ServiceRequest or RiskAssessment or http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* note ..1

// Short, alias, definition and comment texts
* ^description = "The treatment objective describes the desired result of the treatment/interventions in terms of the patient’s diagnosed problem. The objective and target date are entered in addition to the target value. Comparing the healthcare results to the treatment objective provides insight into the effectivity of the treatment/interventions."
* .
  * ^alias[+] = "nl-core-TreatmentObjective"
  * ^comment = "On the zib level, zib TreatmentObjective uses a reference to zib FunctionalOrMentalStatus (in future context). In FHIR the concepts from FunctionalOrMentalStatus are represented directly in the the Goal resource, with the exception of the reference to zib MedicalDevice; this reference is represented by the core extension resource-pertainsToGoal in the [nl-core-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice) profile."
