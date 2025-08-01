Profile: NlcoreContactInformationTelephoneNumbers
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-TelephoneNumbers
Id: nl-core-ContactInformation-TelephoneNumbers
Title: "nl core ContactInformation TelephoneNumbers"
* insert ProfileMetadata(nl-core-ContactInformation-TelephoneNumbers)
* ^purpose = "This ContactPoint resource represents the TelephoneNumbers concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) ContactInformation v1.2 (2020)](https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)).

For the entire zib, the complementary profile [zib-ContactInformation-EmailAddresses](http://nictiz.nl/fhir/StructureDefinition/zib-ContactInformation-EmailAddresses) should be used. Both profiles can be added in a slice with the discriminator set to `profile`/`$this`."

* extension[comment] ..1
* system 1..
* system.extension[telecomType] ..1
* system.extension[telecomType].value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "Contact information includes a person's telephone numbers en e-mail addresses."
* . ^alias[+] = "nl-core-ContactInformation-TelephoneNumbers"
