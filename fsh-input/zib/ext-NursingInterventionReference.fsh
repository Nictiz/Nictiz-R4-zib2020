Extension: ExtNursingInterventionReference
Id: ext-NursingInterventionReference
Title: "ext NursingInterventionReference"
Context: Resource
* insert ProfileMetadata(ext-NursingInterventionReference)

* value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-NursingIntervention)

// Short, alias, definition and comment texts
* ^description = "This extension provides a generic method to extend profiles with a reference to zib-NursingIntervention. Often it is not possible to reference a CarePlan resource, on which zib-NursingIntervention is mapped, in an element whose definition matches that of zib-NursingIntervention."
