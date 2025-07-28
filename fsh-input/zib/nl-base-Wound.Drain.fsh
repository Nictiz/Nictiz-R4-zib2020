Profile: NlbaseWoundDrain
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice
Id: nl-base-Wound.Drain
Title: "nl base Wound.Drain"
* insert ProfileMetadata(nl-base-Wound.Drain)
* ^purpose = "This DeviceUseStatement resource represents the adaptations for the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN)) of [zib MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."

* device only Reference(Device or http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound.Drain.Product)
* reasonReference[stoma] 0..0
* reasonReference contains wound 0..
* reasonReference[wound] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound)

// Short, alias, definition and comment texts
* ^description = "A drain is a medical aid placed to drain blood and exudate from the wound area."
* .
  * ^short = "MedicalDevice / Drain"
  * ^alias[+] = "Drain"
  * ^definition = "A drain is a medical aid placed to drain blood and exudate from the wound area."
  * ^comment = "This is a specialization of the [nl-base-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice) profile to represent Drain devices within the context of zib Wound."
* reasonReference[wound]
  * ^short = "Wound"
  * ^alias[+] = "Wond"
  * ^comment = "Please note that on a functional level, zib Wound references zib MedicalDevice, but in FHIR this direction is reversed."

Mapping: NlbaseWoundDrain-to-zib-wound-v3.3-2020EN
Id: zib-wound-v3.3-2020EN
Title: "zib Wound-v3.3(2020EN)"
Source: NlbaseWoundDrain
Target: "https://zibs.nl/wiki/Wound-v3.3(2020EN)"
*  -> "NL-CM:19.2.17" "Drain"
* reasonReference[wound] -> "NL-CM:19.2.17" "Reversed reference for zib Wound.Drain"
