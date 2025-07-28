Profile: NlbaseContactPerson
Parent: RelatedPerson
Id: nl-base-ContactPerson
Title: "nl base ContactPerson"
* insert ProfileMetadata(nl-base-ContactPerson)
* insert Purpose(ContactPerson, 3.4, RelatedPerson)

* relationship insert Discriminator(value, $this)
* relationship contains
    role 0.. and
    relationship 0..
* relationship[role] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.3.1.2--20200901000000 (preferred)
* relationship[relationship] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.3.1.1--20200901000000 (preferred)
* name insert Discriminator(value, use)
* name contains
    nameInformation 0..2 and
    nameInformation-GivenName 0..
* name[nameInformation] only HumanName
* name[nameInformation] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-NameInformation
* name[nameInformation-GivenName] only HumanName
* name[nameInformation-GivenName] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-NameInformation.GivenName
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
* ^description = """
    A contact is a person not being a healthcare professional who is involved in the patient’s care, such as family members, caregivers, mental caretakers, guardians and legal representatives.
    
    In addition to identification information such as the name, address and contact information can also be entered. The relationship to the patient and the role this person has can be entered as well.
    """
* .
  * ^short = "Contact"
  * ^alias[+] = "Contactpersoon"
  * ^comment = """
    Whereas the zib ContactPerson includes all (non-healthcare professional) persons that are involved in the care for a patient, FHIR distinguishes two use cases for these persons:
    
    * The RelatedPerson resource, and therefore this profile, is used to capture information about any person that is related to the patient.
    * Information about persons that should be _contacted_ regarding the care for the patient is captured using the `Patient.contact` resource.
    
    If a person is both a related person and a contact person, then some data duplication is inevitable.
    """
* relationship[role]
  * ^short = "Role"
  * ^alias[+] = "Rol"
  * ^definition = "Defines the role of the contact in relation to the patient."
* relationship[relationship]
  * ^short = "Relationship"
  * ^alias[+] = "Relatie"
  * ^definition = "Defines the contact’s familial relationship to the patient."
* name
  * ^short = "NameInformation / PayerName"
  * ^alias[+] = "Naamgegevens"
  * ^alias[+] = "BetalerNaam"
  * ^definition = "Full name of the contact."
* telecom
  * ^short = "ContactInformation"
  * ^alias[+] = "Contactgegevens"
  * ^definition = "The contact’s telephone number and/or e-mail address."
  * ^comment = "The cardinality mismatch between the zib (`0..1`) and FHIR (`0..*`) is explained by the containers TelephoneNumbers (`0..*`) and EmailAddresses (`0..*`) inside the ContactInformation model. The FHIR datatype ContactPoint does not have these containers."
* address ^definition = "Contact’s address information."

Mapping: NlbaseContactPerson-to-zib-contactperson-v3.4-2020EN
Id: zib-contactperson-v3.4-2020EN
Title: "zib ContactPerson-v3.4(2020EN)"
Source: NlbaseContactPerson
Target: "https://zibs.nl/wiki/ContactPerson-v3.4(2020EN)"
*  -> "NL-CM:3.1.1" "Contact"
* relationship[role] -> "NL-CM:3.1.2" "Role"
* relationship[relationship] -> "NL-CM:3.1.3" "Relationship"
* name -> "NL-CM:3.1.4" "NameInformation"
* telecom -> "NL-CM:3.1.6" "ContactInformation"
* address -> "NL-CM:3.1.5" "AddressInformation"

Mapping: NlbaseContactPerson-to-zib-contactinformation-v1.2-2020EN
Id: zib-contactinformation-v1.2-2020EN
Title: "zib ContactInformation-v1.2(2020EN)"
Source: NlbaseContactPerson
Target: "https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)"
* telecom -> "NL-CM:20.6.1" "ContactInformation"

Mapping: NlbaseContactPerson-to-zib-payer-v3.1.1-2020EN
Id: zib-payer-v3.1.1-2020EN
Title: "zib Payer-v3.1.1(2020EN)"
Source: NlbaseContactPerson
Target: "https://zibs.nl/wiki/Payer-v3.1.1(2020EN)"
* name -> "NL-CM:1.1.5" "PayerName"
* telecom -> "NL-CM:1.1.12" "ContactInformation"
* address -> "NL-CM:1.1.17" "AddressInformation"
