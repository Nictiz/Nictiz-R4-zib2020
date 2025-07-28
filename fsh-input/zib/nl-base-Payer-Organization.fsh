Profile: NlbasePayerOrganization
Parent: Organization
Id: nl-base-Payer-Organization
Title: "nl base Payer Organization"
* insert ProfileMetadata(nl-base-Payer-Organization)
* insert Purpose(Payer, 3.1.1, Organization)

* identifier insert Discriminator(value, $this)
* identifier contains
    uzovi 0..1
* identifier[uzovi] ^patternIdentifier.system = "http://fhir.nl/fhir/NamingSystem/uzovi"
* telecom insert Discriminator(profile, $this)
* telecom contains
    telephoneNumbers 0.. and
    emailAddresses 0..
* telecom[telephoneNumbers] only ContactPoint
* telecom[telephoneNumbers] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-TelephoneNumbers
* telecom[emailAddresses] only ContactPoint
* telecom[emailAddresses] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-EmailAddresses
* address only Address
* address ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AddressInformation

// Short, alias, definition and comment texts
* ^description = "Payers are organizations or individuals that pay for the healthcare supplied to the patient. These organizations or individuals can be: facilities or people who financially guarantee or who are responsible for the patient (such as parents or guardians of minors), organizations with direct financial responsibility, combinations of these or the patient themselves."
* .
  * ^short = "InsuranceCompany"
  * ^alias[+] = "Verzekeraar"
  * ^comment = "The zib Payer is split into two focal profiles on Coverage based on the PayerPerson and InsuranceCompany containers. These profiles can refer to respectively an Organization as PayerPerson or an InsuranceCompany. This profile can thus represent either the PayerName or InsuranceCompany concept and both the AddressInformation and ContactInformation concepts of the zib."
* identifier[uzovi]
  * ^short = "IdentificationNumber"
  * ^alias[+] = "IdentificatieNummer"
  * ^definition = "Unique healthcare insurance company identification (the UZOVI number)."
* name
  * ^short = "OrganizationName / PayerName"
  * ^alias[+] = "OrganisatieNaam"
  * ^alias[+] = "BetalerNaam"
  * ^definition = "Full, official name of the healthcare insurance company or paying organization. If the UZOVI number is entered as an identification number, this will be the name as listed in the UZOVI register and the name which is returned in the Check for Right to Insurance (COV)."
* telecom
  * ^short = "ContactInformation"
  * ^alias[+] = "Contactgegevens"
  * ^definition = "The payer’s telephone number and/or e-mail address."
* address ^definition = "The payer’s address information."

Mapping: NlbasePayerOrganization-to-zib-payer-v3.1.1-2020EN
Id: zib-payer-v3.1.1-2020EN
Title: "zib Payer-v3.1.1(2020EN)"
Source: NlbasePayerOrganization
Target: "https://zibs.nl/wiki/Payer-v3.1.1(2020EN)"
*  -> "NL-CM:1.1.3" "InsuranceCompany"
* identifier[uzovi] -> "NL-CM:1.1.7" "IdentificationNumber"
* name -> "NL-CM:1.1.16" "OrganizationName"
* name -> "NL-CM:1.1.5" "PayerName"
* telecom -> "NL-CM:1.1.12" "ContactInformation"
* address -> "NL-CM:1.1.17" "AddressInformation"
