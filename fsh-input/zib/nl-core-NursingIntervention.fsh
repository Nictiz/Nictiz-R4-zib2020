Profile: NlcoreNursingIntervention
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-NursingIntervention
Id: nl-core-NursingIntervention
Title: "nl core NursingIntervention"
* insert ProfileMetadata(nl-core-NursingIntervention)
* insert Purpose(NursingIntervention, 3.2, CarePlan)

* . obeys zib-NursingIntervention-1
* category 1..
* category[nursingInterventionCode] 1..1
* subject only Reference(Patient or Group or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* contributor[requester] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* contributor[requester].extension 1..
* contributor[requester].extension[contributorIsRequester] 1..1
* addresses ..1
* addresses only Reference(Condition or http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* goal ..1
* goal only Reference(Goal or http://nictiz.nl/fhir/StructureDefinition/nl-core-TreatmentObjective)
* activity ..1
* activity.detail.extension[medicalDevice].value[x] only Reference(DeviceUseStatement or http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice)
* activity.detail.code ^binding.strength = #required
* activity.detail.performer ..1
* activity.detail.performer[healthcareProvider] ..1
* activity.detail.performer[healthcareProvider] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* activity.detail.performer[caregiver] ..1
* activity.detail.performer[caregiver] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson)
* activity.detail.performer[patient] ..1
* activity.detail.performer[patient] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* note ..1

// Short, alias, definition and comment texts
* ^description = """
    A nursing intervention is the care and/or treatment carried out by a nurse based on an expert opinion and clinical knowledge. It is part of the nursing process; interventions are determined as a result of indexed healthcare problems (nursing diagnoses) and based on treatment goals. Following the NEN-EN-ISO 18104 norm, it is possible to structure nursing interventions (or actions) in a hierarchy, where one intervention can be part of another intervention.
    
    In a home care situation some actions can also be performed by the patient or a caregiver after a relevant instruction.
    """
* . ^alias[+] = "nl-core-NursingIntervention"
* contributor[requester] insert PatternNlCoreHealthProfessional
* activity.detail.performer[healthcareProvider] insert PatternNlCoreHealthProfessional
