Profile: NlcoreAbilityToPerformMouthcareActivitiesProsthesis
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToPerformMouthcareActivities.Prosthesis
Id: nl-core-AbilityToPerformMouthcareActivities.Prosthesis
Title: "nl core AbilityToPerformMouthcareActivities.Prosthesis"
* insert ProfileMetadata(nl-core-AbilityToPerformMouthcareActivities.Prosthesis)
* ^purpose = "This DeviceUseStatement resource represents the adaptations for the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AbilityToPerformMouthcareActivities v3.1 (2020)](https://zibs.nl/wiki/AbilityToPerformMouthcareActivities-v3.1(2020EN)) of [zib MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."

* insert NlCoreMedicalDeviceRestrictions
* insert NlCorePatientForDeviceUseStatement
* device only Reference(Device or http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToPerformMouthcareActivities.Prosthesis.Product)

// Short, alias, definition and comment texts
* ^description = "Information on the dental aids used by the patient."
* .
  * ^alias[+] = "nl-core-AbilityToPerformMouthcareActivities.Prosthesis"
  * ^comment = "This is a specialization of the [nl-core-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice) profile to represent Prosthesis devices within the context of zib AbilityToPerformMouthcareActivities."