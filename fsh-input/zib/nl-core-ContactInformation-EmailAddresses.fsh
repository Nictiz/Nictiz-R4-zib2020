Profile: NlcoreContactInformationEmailAddresses
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-EmailAddresses
Id: nl-core-ContactInformation-EmailAddresses
Title: "nl core ContactInformation EmailAddresses"
* insert ProfileMetadata(nl-core-ContactInformation-EmailAddresses)
* ^purpose = "This ContactPoint resource represents the EmailAddresses concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) ContactInformation v1.2 (2020)](https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)).

To implement the entire zib, the complementary profile [zib-ContactInformation-TelephoneNumbers](http://nictiz.nl/fhir/StructureDefinition/zib-ContactInformation-TelephoneNumbers) should be used. Both profiles can be added in a slice with the discriminator set to `profile`/`$this`."

* system 1..

// Short, alias, definition and comment texts
* ^description = "Contact information includes a person's telephone numbers en e-mail addresses."
* . ^alias[+] = "nl-core-ContactInformation-EmailAddresses"
