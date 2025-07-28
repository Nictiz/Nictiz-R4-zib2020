Profile: NlbaseContactInformationTelephoneNumbers
Parent: ContactPoint
Id: nl-base-ContactInformation-TelephoneNumbers
Title: "nl base ContactInformation TelephoneNumbers"
* insert ProfileMetadata(nl-base-ContactInformation-TelephoneNumbers)
* ^purpose = "This ContactPoint resource represents the TelephoneNumbers concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) ContactInformation v1.2 (2020)](https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)).

For the entire zib, the complementary profile [zib-ContactInformation-EmailAddresses](http://nictiz.nl/fhir/StructureDefinition/zib-ContactInformation-EmailAddresses) should be used. Both profiles can be added in a slice with the discriminator set to `profile`/`$this`."

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-Comment named comment 0..1
* system insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/TelecomType-to-ContactInformation-TelephoneNumbersSystem)
* system from http://nictiz.nl/fhir/ValueSet/ContactInformation-TelephoneNumbersSystem (preferred)
* system.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification named telecomType 0..1
* system.extension[telecomType].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.20.6.1--20200901000000 (preferred)
* use insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/NummerSoortCodelijst-to-ContactInformation-TelephoneNumbersUse)
* use from http://nictiz.nl/fhir/ValueSet/ContactInformation-TelephoneNumbersUse (preferred)

// Short, alias, definition and comment texts
* ^description = "Contact information includes a person's telephone numbers en e-mail addresses."
* .
  * ^short = "TelephoneNumbers"
  * ^alias[+] = "Telefoonnummers"
  * ^comment = """
    Implementation of the \"TelephoneNumbers\" concept of zib ContactInformation.
    
    Please note that, although the zib concepts TelecomType and NumberType are functionally equivalent to the FHIR concepts `ContactPoint.system` and `ContactPoint.use` respectively, a mismatch occurs on the concept of mobile phone numbers; the zib uses the first concept and FHIR the second. For this reason, the ValueSet on `ContactPoint.system` is too narrow and the zib code will need to be communicated using the ext-CodeSpecification extension.
    """
* extension[comment].value[x]
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Explanation about the telephone number and how to use it. It can be indicated, for example, that it is a department number (for healthcare professionnels) or that availability by phone is only possible during a specified part of the day."
* system
  * ^short = "TelecomType"
  * ^alias[+] = "TelecomType"
  * ^definition = "The telecom or device type that the telephone number is connected to."
* system.extension[telecomType].value[x]
  * ^short = "TelecomType"
  * ^alias[+] = "TelecomType"
  * ^definition = "The telecom or device type that the telephone number is connected to."
* value
  * ^short = "TelephoneNumber"
  * ^alias[+] = "Telefoonnummer"
  * ^definition = "The person's telephone number."
* use
  * ^short = "NumberType"
  * ^alias[+] = "NummerSoort"
  * ^definition = "NumberType indicates whether the number is a landline, temporary, work telephone number."

Mapping: NlbaseContactInformationTelephoneNumbers-to-zib-contactinformation-v1.2-2020EN
Id: zib-contactinformation-v1.2-2020EN
Title: "zib ContactInformation-v1.2(2020EN)"
Source: NlbaseContactInformationTelephoneNumbers
Target: "https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)"
*  -> "NL-CM:20.6.2" "TelephoneNumbers"
* extension[comment].value[x] -> "NL-CM:20.6.9" "Comment"
* system -> "NL-CM:20.6.5" "TelecomType"
* system.extension[telecomType].value[x] -> "NL-CM:20.6.5" "TelecomType"
* value -> "NL-CM:20.6.4" "TelephoneNumber"
* use -> "NL-CM:20.6.6" "NumberType"
