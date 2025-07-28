Profile: NlbaseAbilityToPerformMouthcareActivitiesProsthesis
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice
Id: nl-base-AbilityToPerformMouthcareActivities.Prosthesis
Title: "nl base AbilityToPerformMouthcareActivities.Prosthesis"
* insert ProfileMetadata(nl-base-AbilityToPerformMouthcareActivities.Prosthesis)
* ^purpose = "This DeviceUseStatement resource represents the adaptations for the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AbilityToPerformMouthcareActivities v3.1 (2020)](https://zibs.nl/wiki/AbilityToPerformMouthcareActivities-v3.1(2020EN)) of [zib MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."

* device only Reference(Device or http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToPerformMouthcareActivities.Prosthesis.Product)
* reasonReference[stoma] 0..0

// Short, alias, definition and comment texts
* ^description = "Information on the dental aids used by the patient."
* .
  * ^short = "Prosthesis / MedicalDevice"
  * ^alias[+] = "Prothese"
  * ^definition = "Information on the dental aids used by the patient."
  * ^comment = "This is a specialization of the [nl-base-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice) profile to represent Prosthesis devices within the context of zib AbilityToPerformMouthcareActivities."

Mapping: NlbaseAbilityToPerformMouthcareActivitiesProsthesis-to-zib-abilitytoperformmouthcareactivities-v3.1-2020EN
Id: zib-abilitytoperformmouthcareactivities-v3.1-2020EN
Title: "zib AbilityToPerformMouthcareActivities-v3.1(2020EN)"
Source: NlbaseAbilityToPerformMouthcareActivitiesProsthesis
Target: "https://zibs.nl/wiki/AbilityToPerformMouthcareActivities-v3.1(2020EN)"
*  -> "NL-CM:4.13.4" "Prosthesis"
