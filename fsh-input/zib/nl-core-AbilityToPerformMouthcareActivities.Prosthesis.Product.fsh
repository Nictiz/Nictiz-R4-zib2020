Profile: NlcoreAbilityToPerformMouthcareActivitiesProsthesisProduct
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AbilityToPerformMouthcareActivities.Prosthesis.Product
Id: nl-core-AbilityToPerformMouthcareActivities.Prosthesis.Product
Title: "nl core AbilityToPerformMouthcareActivities.Prosthesis.Product"
* insert ProfileMetadata(nl-core-AbilityToPerformMouthcareActivities.Prosthesis.Product)
* ^purpose = "This Device resource represents the Product container of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)) adjusted to the requirements of [zib AbilityToPerformMouthcareActivities v3.1 (2020)](https://zibs.nl/wiki/AbilityToPerformMouthcareActivities-v3.1(2020EN))."

// Since we're inheriting from the base layer of the AbilityToPerformMouthcareActivities zib, the nl-core-MedicalDevice
// profile is sidelined and we have to apply the restrictions defined there here as well.
* identifier 0..1
* udiCarrier 0..1
* type from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.10.1.1--20200901000000 (required)
* note 0..1

// Short, alias, definition and comment texts
* ^description = "A specification of the type of medical aids used by the patient, such as a prosthesis or orthesis."
* . ^alias[+] = "nl-core-AbilityToPerformMouthcareActivities.Prosthesis.Product"
