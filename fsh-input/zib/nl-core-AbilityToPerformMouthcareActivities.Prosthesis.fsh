Profile: NlcoreAbilityToPerformMouthcareActivitiesProsthesis
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToPerformMouthcareActivities.Prosthesis
Id: nl-core-AbilityToPerformMouthcareActivities.Prosthesis
Title: "nl core AbilityToPerformMouthcareActivities.Prosthesis"
* insert ProfileMetadata(nl-core-AbilityToPerformMouthcareActivities.Prosthesis)
* ^purpose = "This DeviceUseStatement resource represents the adaptations for the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AbilityToPerformMouthcareActivities v3.1 (2020)](https://zibs.nl/wiki/AbilityToPerformMouthcareActivities-v3.1(2020EN)) of [zib MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."

* extension[healthProfessional] 0..1
* extension[healthProfessional].value[x] insert PatternNlCoreHealthProfessional
* extension[healthProfessional].value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* extension[location] 0..1
* extension[location].value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider)

* insert NlCorePatientForDeviceUseStatement

* derivedFrom[procedure-request] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-request)
* derivedFrom[procedure-event] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-event)
* device only Reference(Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-AbilityToPerformMouthcareActivities.Prosthesis.Product)

* reasonReference[indication] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* reasonReference[stoma] ..0

* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AnatomicalLocation
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (required)

* note 0..1

// Short, alias, definition and comment texts
* ^description = "Information on the dental aids used by the patient."
* .
  * ^alias[+] = "nl-core-AbilityToPerformMouthcareActivities.Prosthesis"
  * ^comment = "This is a specialization of the [nl-core-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice) profile to represent Prosthesis devices within the context of zib AbilityToPerformMouthcareActivities."
* extension[location].value[x] ^comment = """
  Please note that this zib concept (Location::HealthcareProvider) is also mapped on the `Procedure.location` element in profile [nl-core-Procedure-event](http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-event). The reason for this is that this zib concept aligns with the Location::HealthcareProvider concept in zib Procedure (NL-CM:14.1.5), but only for the situation that the Procedure is about placing the implant which is described using this instance of zib MedicalDevice. In this situation, the current extension is redundant and it is advised to only use `Procedure.location` in profile nl-core-Procedure-event to represent the Location concept.
  """
