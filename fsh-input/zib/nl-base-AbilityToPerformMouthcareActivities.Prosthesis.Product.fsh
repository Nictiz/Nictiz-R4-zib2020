Profile: NlbaseAbilityToPerformMouthcareActivitiesProsthesisProduct
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice.Product
Id: nl-base-AbilityToPerformMouthcareActivities.Prosthesis.Product
Title: "nl base AbilityToPerformMouthcareActivities.Prosthesis.Product"
* insert ProfileMetadata(nl-base-AbilityToPerformMouthcareActivities.Prosthesis.Product)
* ^purpose = "This Device resource represents the Product container of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)) adjusted to the requirements of [zib AbilityToPerformMouthcareActivities v3.1 (2020)](https://zibs.nl/wiki/AbilityToPerformMouthcareActivities-v3.1(2020EN))."

* type insert AdditionalBinding(minimum, http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.13.2--20200901000000)

// Short, alias, definition and comment texts
* ^description = "A specification of the type of medical aids used by the patient, such as a prosthesis or orthesis."
* type ^definition = "A specification of the type of medical aids used by the patient, such as a prosthesis or orthesis."

Mapping: NlbaseAbilityToPerformMouthcareActivitiesProsthesisProduct-to-zib-abilitytoperformmouthcareactivities-v3.1-2020EN
Id: zib-abilitytoperformmouthcareactivities-v3.1-2020EN
Title: "zib AbilityToPerformMouthcareActivities-v3.1(2020EN)"
Source: NlbaseAbilityToPerformMouthcareActivitiesProsthesisProduct
Target: "https://zibs.nl/wiki/AbilityToPerformMouthcareActivities-v3.1(2020EN)"
* type -> "NL-CM:10.1.3" "ProductType"
