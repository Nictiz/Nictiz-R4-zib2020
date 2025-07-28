Profile: NlcoreWoundDrainProduct
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound.Drain.Product
Id: nl-core-Wound.Drain.Product
Title: "nl core Wound.Drain.Product"
* insert ProfileMetadata(nl-core-Wound.Drain.Product)
* ^purpose = "This Device resource represents the Product concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)) adjusted to the requirements of the [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN))."

* type from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.19.2.7--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "Type of drain applied to the wound."
* . ^alias[+] = "nl-core-Wound.Drain.Product"
