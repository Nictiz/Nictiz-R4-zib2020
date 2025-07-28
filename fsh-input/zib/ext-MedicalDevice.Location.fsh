Extension: ExtMedicalDeviceLocation
Id: ext-MedicalDevice.Location
Title: "ext MedicalDevice.Location"
Context: DeviceUseStatement
* insert ProfileMetadata(ext-MedicalDevice.Location)

* value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider)

// Short, alias, definition and comment texts
* ^description = "An extension to provide the healthcare provider at which use of the medical device was initiated or where the aid was implanted."
* value[x]
  * ^short = "Location"
  * ^alias[+] = "Locatie"
  * ^definition = "The healthcare provider at which use of the medical device was initiated or where the aid was implanted."

Mapping: ExtMedicalDeviceLocation-to-zib-medicaldevice-v3.3.1-2020EN
Id: zib-medicaldevice-v3.3.1-2020EN
Title: "zib MedicalDevice-v3.3.1(2020EN)"
Source: ExtMedicalDeviceLocation
Target: "https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)"
* value[x] -> "NL-CM:10.1.8" "Location"
