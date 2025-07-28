Profile: NlcoreContactInformationTelephoneNumbers
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-TelephoneNumbers
Id: nl-core-ContactInformation-TelephoneNumbers
Title: "nl core ContactInformation TelephoneNumbers"
* insert ProfileMetadata(nl-core-ContactInformation-TelephoneNumbers)
* ^purpose = "This ContactPoint resource represents the TelephoneNumbers concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) ContactInformation v1.2 (2020)](https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)).

For the entire zib, the complementary profile [zib-ContactInformation-EmailAddresses](http://nictiz.nl/fhir/StructureDefinition/zib-ContactInformation-EmailAddresses) should be used. Both profiles can be added in a slice with the discriminator set to `profile`/`$this`."

* extension[comment] ..1
* system 1..
* system from http://nictiz.nl/fhir/ValueSet/ContactInformation-TelephoneNumbersSystem (required)
* system.extension[telecomType] ..1
* system.extension[telecomType].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.20.6.1--20200901000000 (required)
* use from http://nictiz.nl/fhir/ValueSet/ContactInformation-TelephoneNumbersUse (required)

// Short, alias, definition and comment texts
* ^description = "Contact information includes a person's telephone numbers en e-mail addresses."
* . ^alias[+] = "nl-core-ContactInformation-TelephoneNumbers"
