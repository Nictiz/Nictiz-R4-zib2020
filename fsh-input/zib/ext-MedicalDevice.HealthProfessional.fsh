Extension: ExtMedicalDeviceHealthProfessional
Id: ext-MedicalDevice.HealthProfessional
Title: "ext MedicalDevice.HealthProfessional"
Context: DeviceUseStatement
* insert ProfileMetadata(ext-MedicalDevice.HealthProfessional)

* . 0..1
* value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)

// Short, alias, definition and comment texts
* ^description = "An extension to provide the health professional involved in the indication for use of the medical device implant."
* ^purpose = "This extension represents the HealthProfessional concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."
* value[x]
  * ^short = "HealthProfessional"
  * ^alias[+] = "Zorgverlener"
  * ^definition = "The health professional involved in the indication for use of the medical device implant."
  * insert PatternNlBaseHealthProfessional

Mapping: ExtMedicalDeviceHealthProfessional-to-zib-medicaldevice-v3.3.1-2020EN
Id: zib-medicaldevice-v3.3.1-2020EN
Title: "zib MedicalDevice-v3.3.1(2020EN)"
Source: ExtMedicalDeviceHealthProfessional
Target: "https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)"
* value[x] -> "NL-CM:10.1.9" "HealthProfessional"
