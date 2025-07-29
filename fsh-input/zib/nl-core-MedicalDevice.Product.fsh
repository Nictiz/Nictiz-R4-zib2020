Profile: NlcoreMedicalDeviceProduct
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice.Product
Id: nl-core-MedicalDevice.Product
Title: "nl core MedicalDevice.Product"
* insert ProfileMetadata(nl-core-MedicalDevice.Product)
* ^purpose = "This Device resource represents the Product concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."

* identifier ..1
* identifier[gs1ProductID] ..1
* identifier[hibcProductID] ..1
* udiCarrier ..1
* udiCarrier[gs1UdiCarrier] ..1
* udiCarrier[hibcUdiCarrier] ..1
* type ^binding.strength = #required
* note ..1

// Short, alias, definition and comment texts
* ^description = "Medical devices are any internally implanted and external devices and/or aids used by the patient (in the past) to reduce the effects of functional limitations in organ systems or to facilitate the treatment of a disease."
* . ^alias[+] = "nl-core-MedicalDevice.Product"
