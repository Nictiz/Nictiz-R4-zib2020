Profile: NlcoreTreatmentObjective
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-TreatmentObjective
Id: nl-core-TreatmentObjective
Title: "nl core TreatmentObjective"
* insert ProfileMetadata(nl-core-TreatmentObjective)
* insert Purpose(TreatmentObjective, 3.2, Goal)

* target.measure from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.4--20200901000000 (required)
* target.detailCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.3--20200901000000 (required)
* addresses ..1
* addresses only Reference(http://hl7.org/fhir/StructureDefinition/Condition or http://hl7.org/fhir/StructureDefinition/Observation or http://hl7.org/fhir/StructureDefinition/MedicationStatement or http://hl7.org/fhir/StructureDefinition/NutritionOrder or http://hl7.org/fhir/StructureDefinition/ServiceRequest or http://hl7.org/fhir/StructureDefinition/RiskAssessment or http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* note ..1

// Short, alias, definition and comment texts
* ^description = "The treatment objective describes the desired result of the treatment/interventions in terms of the patient’s diagnosed problem. The objective and target date are entered in addition to the target value. Comparing the healthcare results to the treatment objective provides insight into the effectivity of the treatment/interventions."
* .
  * ^alias[+] = "nl-core-TreatmentObjective"
  * ^comment = "On the zib level, zib TreatmentObjective uses a reference to zib FunctionalOrMentalStatus (in future context). In FHIR the concepts from FunctionalOrMentalStatus are represented directly in the the Goal resource, with the exception of the reference to zib MedicalDevice; this reference is represented by the core extension resource-pertainsToGoal in the [nl-core-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice) profile."
