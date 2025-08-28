Profile: NlcoreWoundDrain
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound.Drain
Id: nl-core-Wound.Drain
Title: "nl core Wound.Drain"
* insert ProfileMetadata(nl-core-Wound.Drain)
* ^purpose = "This DeviceUseStatement resource represents the adaptations for the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN)) of [zib MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."

* insert NlCoreMedicalDeviceRestrictions
* device only Reference(Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-Wound.Drain.Product)
* reasonReference[stoma] ..0
* reasonReference[wound] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Wound)

// Short, alias, definition and comment texts
* ^description = "A drain is a medical aid placed to drain blood and exudate from the wound area."
* .
  * ^alias[+] = "nl-core-Wound.Drain"
  * ^comment = """
    This is a specialization of the profile for zib MedicalDevice to represent Drain devices within the context of zib Wound.
    
    Note: because of the way derivation works in FHIR, this profile is not based on the [nl-core-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice) profile but derived from a specialization in the zib layer."""
