Profile: NlcorePayerOrganization
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Payer-Organization
Id: nl-core-Payer-Organization
Title: "nl core Payer Organization"
* insert ProfileMetadata(nl-core-Payer-Organization)
* insert Purpose(Payer, 3.1.1, Organization)

* identifier[uzovi] ..1
* telecom[telephoneNumbers] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactInformation-TelephoneNumbers
* telecom[emailAddresses] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactInformation-EmailAddresses
* address ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AddressInformation


// Short, alias, definition and comment texts
* ^description = "Payers are organizations or individuals that pay for the healthcare supplied to the patient. These organizations or individuals can be: facilities or people who financially guarantee or who are responsible for the patient (such as parents or guardians of minors), organizations with direct financial responsibility, combinations of these or the patient themselves."
* . ^alias[+] = "nl-core-Payer-Organization"
