Profile: NlcoreMedicalDeviceProduct
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice.Product
Id: nl-core-MedicalDevice.Product
Title: "nl core MedicalDevice.Product"
* insert ProfileMetadata(nl-core-MedicalDevice.Product)
* ^purpose = "This Device resource represents the Product concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."

* insert NlcoreMedicalDeviceProductRestrictions
* patient ^comment = "According to <https://www.hl7.org/fhir/r4/compartmentdefinition-patient.html>, this reference may not be populated. Therefore, no reference to the nl-core-Patient profile is defined here."

// Short, alias, definition and comment texts
* ^description = "Medical devices are any internally implanted and external devices and/or aids used by the patient (in the past) to reduce the effects of functional limitations in organ systems or to facilitate the treatment of a disease."
* . ^alias[+] = "nl-core-MedicalDevice.Product"

/* Zib MedicalDevice is sometimes "derived" (specialized) in other zibs, introducing some derivation problems regarding
   nl-core. For example, zib HearingFunction derives zib MedicalDevice for the HearingAid concept, so the nl-base
   profiles for HearingAid are based on the nl-base profiles of zib MedicalDevice. Since The nl-core profiles for
   HearingAid are based on their nl-base profiles, there is no link with the nl-core profiles of zib-MedicalDevice.
   This RuleSet contains all the restrictions between nl-base-MedicalDevice.Product and nl-core-MedicalDevice.Product,
   so it can easily applied to the nl-core layer for MedicalDevice derived profiles.
*/
RuleSet: NlcoreMedicalDeviceProductRestrictions
* identifier ..1
* identifier[gs1ProductID] ..1
* identifier[hibcProductID] ..1
* udiCarrier ..1
* udiCarrier[gs1UdiCarrier] ..1
* udiCarrier[hibcUdiCarrier] ..1
* type ^binding.strength = #required
* note ..1
