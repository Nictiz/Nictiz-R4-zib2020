Profile: NlcoreAddressInformation
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AddressInformation
Id: nl-core-AddressInformation
Title: "nl core AddressInformation"
* insert ProfileMetadata(nl-core-AddressInformation)
* ^purpose = "This Address datatype represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AddressInformation v1.1 (2020)](https://zibs.nl/wiki/AddressInformation-v1.1(2020EN))."

* extension[addressType] ..1
* use from http://hl7.org/fhir/ValueSet/address-use|4.0.1 (required)
* type from http://hl7.org/fhir/ValueSet/address-type|4.0.1 (required)
* line.extension[streetName] ..1
* line.extension[houseNumber] ..1
* line.extension[houseNumberLetter-houseNumberAddition] ..1
* line.extension[houseNumberIndication] ..1
* line.extension[houseNumberIndication].value[x] obeys houseNumberIndication
* line.extension[additionalInformation] ..1
* country.extension[countryCode] ..1
* country.extension[countryCode].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.10--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "Address information includes data where a person resides (temporarily, permanently) or where a building is located."
* . ^alias[+] = "nl-core-AddressInformation"
