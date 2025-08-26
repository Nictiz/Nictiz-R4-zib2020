Profile: NlbaseContactInformationEmailAddresses
Parent: ContactPoint
Id: nl-base-ContactInformation-EmailAddresses
Title: "nl base ContactInformation EmailAddresses"
* insert ProfileMetadata(nl-base-ContactInformation-EmailAddresses)
* ^purpose = "This ContactPoint resource represents the EmailAddresses concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) ContactInformation v1.2 (2020)](https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)).

To implement the entire zib, the complementary profile [nl-base-ContactInformation-TelephoneNumbers](http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-TelephoneNumbers) should be used. Both profiles can be added in a slice with the discriminator set to `profile`/`$this`."

* use from http://nictiz.nl/fhir/ValueSet/ContactInformation-EmailAddressesUse (required)
* use insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/EmailSoortCodelijst-to-ContactInformation-EmailAddressesUse, EmailSoortCodelijst-to-ContactInformation-EmailAddressesUse, ContactInformation-EmailAddressesUse)

// Short, alias, definition and comment texts
* ^description = "Contact information includes a person's telephone numbers en e-mail addresses."
* .
  * ^short = "EmailAddresses"
  * ^alias[+] = "EmailAdressen"
  * ^comment = "Implementation of the \"EmailAddresses\" concept of zib ContactInformation."
* system ^short = "email"
* system = #email
* value
  * ^short = "EmailAddress"
  * ^alias[+] = "EmailAdres"
  * ^definition = "The person's e-mail address"
* use
  * ^short = "EmailAddressType"
  * ^alias[+] = "EmailSoort"
  * ^definition = "EmailAddressType indicates whether it is a private or business e-mail address."

Mapping: NlbaseContactInformationEmailAddresses-to-zib-contactinformation-v1.2-2020EN
Id: zib-contactinformation-v1.2-2020EN
Title: "zib ContactInformation-v1.2(2020EN)"
Source: NlbaseContactInformationEmailAddresses
Target: "https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)"
*  -> "NL-CM:20.6.3" "EmailAddresses"
* value -> "NL-CM:20.6.7" "EmailAddress"
* use -> "NL-CM:20.6.8" "EmailAddressType"
