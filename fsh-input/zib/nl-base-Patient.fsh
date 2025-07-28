Profile: NlbasePatient
Parent: Patient
Id: nl-base-Patient
Title: "nl base Patient"
* insert ProfileMetadata(nl-base-Patient)
* insert Purpose(Patient, 3.2, Patient)

* extension contains
    http://hl7.org/fhir/StructureDefinition/patient-nationality named nationality 0..*
* extension[nationality].extension[code] 0..
* extension[nationality].extension[code].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.6.3--20200901000000 (preferred)
* identifier insert Discriminator(value, $this)
* identifier contains
    bsn 0..
* identifier[bsn] ^patternIdentifier.system = "http://fhir.nl/fhir/NamingSystem/bsn"
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
* gender insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/GeslachtCodelijst-to-AdministrativeGender)
* gender from http://hl7.org/fhir/ValueSet/administrative-gender|4.0.1 (preferred)
* gender.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification named genderCodelist 0..1
* gender.extension[genderCodelist].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.0.1.1--20200901000000 (preferred)
* deceased[x] insert Discriminator(type, $this)
* deceasedBoolean only boolean
* deceasedDateTime only dateTime
* address only Address
* address ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AddressInformation
* maritalStatus from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.9.1--20200901000000 (preferred)
* multipleBirth[x] insert Discriminator(type, $this)
* multipleBirthBoolean only boolean
* contact.extension contains
    http://hl7.org/fhir/StructureDefinition/patient-relatedPerson named contactPerson 0..1
* contact.extension[contactPerson].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson)
* contact.relationship insert Discriminator(value, $this)
* contact.relationship contains
    role 0.. and
    relationship 0..
* contact.relationship[role] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.3.1.2--20200901000000 (preferred)
* contact.relationship[relationship] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.3.1.1--20200901000000 (preferred)
* contact.name only HumanName
* contact.name ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-NameInformation
* contact.telecom insert Discriminator(profile, $this)
* contact.telecom contains
    telephoneNumbers 0.. and
    emailAddresses 0..
* contact.telecom[telephoneNumbers] only ContactPoint
* contact.telecom[telephoneNumbers] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-TelephoneNumbers
* contact.telecom[emailAddresses] only ContactPoint
* contact.telecom[emailAddresses] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-EmailAddresses
* contact.address only Address
* contact.address ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AddressInformation
* communication.extension contains
    http://hl7.org/fhir/StructureDefinition/patient-proficiency named languageControl 0..* and
    http://nictiz.nl/fhir/StructureDefinition/ext-LanguageProficiency.CommunicationDetails named communicationDetails 0..* and
    http://nictiz.nl/fhir/StructureDefinition/ext-Comment named comment 0..1
* communication.extension[languageControl].extension[level] 0..
* communication.extension[languageControl].extension[level].value[x] from None (preferred)
* communication.extension[languageControl].extension[type] 0..1
* communication.language from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.12.2--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    A person who receives medical, psychological, paramedical or nursing care. In some care settings, the term client or participant is used instead of the term patient.
    Nationality is used as an indication of the country of citizenship. 
    Marital status is a person’s formal position as defined by the Dutch civil code. There is a distinction between marriage and civil union.
    Linguistic proficiency is the ability to express oneself in a certain language and understand statements made in that language. This includes both oral and written communication.
    """
* .
  * ^short = "Patient"
  * ^alias[+] = "Patient"
* extension[nationality] ^comment = "Due to the nature of the nationality core extension (which allows for a period to be placed next to the nationality and thus allows for different nationalities over time), the cardinality of the extension is left at `0..*` instead of the zib cardinality of `0..1`."
* extension[nationality].extension[code].value[x]
  * ^short = "Nationality"
  * ^alias[+] = "Nationaliteit"
  * ^definition = "Indicates the country of citizenship."
* identifier
  * ^short = "PatientIdentificationNumber"
  * ^alias[+] = "Identificatienummer"
  * ^definition = "The patient’s identification number. In transfer situations, use of the social security number (BSN) must comply with the Use of Social Security Numbers in Healthcare Act (Wbsn-z). In other situations, other number systems can be used, such as internal hospital patient numbers for example."
* name
  * ^short = "NameInformation / PayerName"
  * ^alias[+] = "Naamgegevens"
  * ^alias[+] = "BetalerNaam"
  * ^definition = "Patient's full name."
* telecom
  * ^short = "ContactInformation"
  * ^alias[+] = "Contactgegevens"
  * ^definition = "Patient’s telephone number(s) or e-mail address(es)."
  * ^comment = "The cardinality mismatch between the zib (`0..1`) and FHIR (`0..*`) is explained by the containers TelephoneNumbers (`0..*`) and EmailAddresses (`0..*`) inside the ContactInformation model. The FHIR datatype ContactPoint does not have these containers."
* gender
  * ^short = "Gender"
  * ^alias[+] = "Geslacht"
  * ^definition = "Patient’s administrative gender."
* gender.extension[genderCodelist].value[x]
  * ^short = "Gender"
  * ^alias[+] = "Geslacht"
  * ^definition = "Patient’s administrative gender."
* birthDate
  * ^short = "DateOfBirth"
  * ^alias[+] = "Geboortedatum"
  * ^definition = "Patient’s date of birth. The date of birth is mandatory for a patient. A vague date (such as only the year) is permitted."
* deceasedBoolean
  * ^short = "DeathIndicator"
  * ^alias[+] = "OverlijdensIndicator"
  * ^definition = "An indication stating whether the patient has died."
* deceasedDateTime
  * ^short = "DateOfDeath"
  * ^alias[+] = "DatumOverlijden"
  * ^alias[+] = "OverlijdensIndicator"
  * ^definition = "The date on which the patient died. A ‘vague’ date, such as only the year, is permitted."
  * ^comment = "The zib recognizes both the DeathIndicator (boolean) and DateOfDeath (datetime) concepts, whereas in FHIR only one of these concepts may be present. Therefore, if deceasedDateTime is present and has a value, its value can be mapped to DateOfDeath and DeathIndicator is assumed to be true."
* address ^definition = "Patient's address information."
* maritalStatus
  * ^short = "MaritalStatus"
  * ^alias[+] = "BurgerlijkeStaat"
  * ^definition = "A person’s marital status according to the terms and definition in the Dutch civil code."
* multipleBirthBoolean
  * ^short = "MultipleBirthIndicator"
  * ^alias[+] = "MeerlingIndicator"
  * ^definition = "An indication stating whether the patient is of a multiple birth."
* contact
  * ^short = "Contact"
  * ^alias[+] = "Contactpersoon"
  * ^comment = """
    Whereas the zib ContactPerson includes all (non-healthcare professional) persons that are involved in the care for a patient, FHIR distinguishes two use cases for these persons:
    
    * The RelatedPerson resource is used to capture information about any person that is related to the patient, using the profile <http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson>.
    * Information about persons that should be _contacted_ regarding the care for the patient is captured using the `Patient.contact` resource.
    
    If a person is both a related person and a contact person, then some data duplication is inevitable. The nl-base-ContactPerson can be referenced using the extension in `contact:contactPerson`.
    """
* contact.extension[contactPerson].value[x]
  * ^short = "Contact"
  * ^alias[+] = "Contactpersoon"
  * ^definition = "Reference to a [zib-ContactPerson](http://nictiz.nl/fhir/StructureDefinition/zib-ContactPerson) instance containing the full details for the current contact."
* contact.relationship[role]
  * ^short = "Role"
  * ^alias[+] = "Rol"
  * ^definition = "Defines the role of the contact in relation to the patient."
* contact.relationship[relationship]
  * ^short = "Relationship"
  * ^alias[+] = "Relatie"
  * ^definition = "Defines the contact’s familial relationship to the patient."
* contact.name
  * ^definition = "Full name of the contact."
  * ^comment = "This element can and should not completely capture the NameInformation concept from zib ContactPerson; it should just be used for the information that is needed for contacting the person in relation to care of the patient. The full name information should instead be captured using an instance of [nl-base-ContactPerson](http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson), which can then be referenced from this resource. See the comment on `Patient.contact` for more information."
* contact.telecom
  * ^short = "ContactInformation"
  * ^alias[+] = "Contactgegevens"
  * ^definition = "The contact’s telephone number and/or e-mail address."
  * ^comment = "The cardinality mismatch between the zib (`0..1`) and FHIR (`0..*`) is explained by the containers TelephoneNumbers (`0..*`) and EmailAddresses (`0..*`) inside the ContactInformation model. The FHIR datatype ContactPoint does not have these containers."
* contact.address
  * ^definition = "Contact’s address information."
  * ^comment = "This element can and should not completely capture the AddressInformation concept from zib ContactPerson; it should just be used for the information that is needed for contacting the person in relation to care of the patient. The full address information should instead be captured using an instance of [nl-base-ContactPerson](http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson), which can then be referenced from this resource. See the comment on `Patient.contact` for more information."
* communication
  * ^short = "LanguageProficiency"
  * ^alias[+] = "Taalvaardigheid"
* communication.extension[languageControl]
  * ^short = "LanguageControlListening / LanguageControlSpeaking / LanguageControlReading"
  * ^alias[+] = "TaalvaardigheidBegrijpen"
  * ^alias[+] = "TaalvaardigheidSpreken"
  * ^alias[+] = "TaalvaardigheidLezen"
  * ^definition = """
    The ability to understand spoken text in the language in question.
    The ability to express oneself in spoken language.
    The ability to understand written text in he language in question.
    """
  * ^comment = """
    The zib concepts LanguageControlListening, LanguageControlReading, LanguageControlSpeaking are captured using a core extension from the R4 FHIR specification. Each of these three concepts is encoded as a copy of the extension, typed using the code in the type slice according to the following mapping:
    * LanguageControlListening maps to code 'RSP' (Received spoken)
    * LanguageControlReading maps to code 'RWR' (Received written)
    * LanguageControlSpeaking maps to code 'ESP' (Expressed spoken)
    """
* communication.extension[languageControl].extension[level].value[x] ^comment = "The zib ValueSets TaalvaardigheidBegrijpenCodelijst, TaalvaardigheidSprekenCodelijst and TaalvaardigheidLezenCodelijst are equal to the default FHIR ValueSet."
* communication.extension[comment].value[x]
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the linguistic proficiency. When using sign language, this field can be used to clarify, for example, which sign language is used. This can be informative, as there is not always a one-to-one relationship between the spoken language and sign language."
* communication.language
  * ^short = "CommunicationLanguage"
  * ^alias[+] = "CommunicatieTaal"
  * ^definition = "The language of communication."

Mapping: NlbasePatient-to-zib-patient-v3.2-2020EN
Id: zib-patient-v3.2-2020EN
Title: "zib Patient-v3.2(2020EN)"
Source: NlbasePatient
Target: "https://zibs.nl/wiki/Patient-v3.2(2020EN)"
*  -> "NL-CM:0.1.1" "Patient"
* identifier -> "NL-CM:0.1.7" "PatientIdentificationNumber"
* name -> "NL-CM:0.1.6" "NameInformation"
* telecom -> "NL-CM:0.1.5" "ContactInformation"
* gender -> "NL-CM:0.1.9" "Gender"
* gender.extension[genderCodelist].value[x] -> "NL-CM:0.1.9" "Gender"
* birthDate -> "NL-CM:0.1.10" "DateOfBirth"
* deceasedBoolean -> "NL-CM:0.1.32" "DeathIndicator"
* deceasedDateTime -> "NL-CM:0.1.33" "DateOfDeath"
* deceasedDateTime -> "NL-CM:0.1.32" "DeathIndicator"
* address -> "NL-CM:0.1.4" "AddressInformation"
* multipleBirthBoolean -> "NL-CM:0.1.31" "MultipleBirthIndicator"

Mapping: NlbasePatient-to-zib-nationality-v3.0-2020EN
Id: zib-nationality-v3.0-2020EN
Title: "zib Nationality-v3.0(2020EN)"
Source: NlbasePatient
Target: "https://zibs.nl/wiki/Nationality-v3.0(2020EN)"
* extension[nationality].extension[code].value[x] -> "NL-CM:7.6.3" "Nationality"

Mapping: NlbasePatient-to-zib-maritalstatus-v3.1-2020EN
Id: zib-maritalstatus-v3.1-2020EN
Title: "zib MaritalStatus-v3.1(2020EN)"
Source: NlbasePatient
Target: "https://zibs.nl/wiki/MaritalStatus-v3.1(2020EN)"
* maritalStatus -> "NL-CM:7.9.2" "MaritalStatus"

Mapping: NlbasePatient-to-zib-languageproficiency-v3.2-2020EN
Id: zib-languageproficiency-v3.2-2020EN
Title: "zib LanguageProficiency-v3.2(2020EN)"
Source: NlbasePatient
Target: "https://zibs.nl/wiki/LanguageProficiency-v3.2(2020EN)"
* communication -> "NL-CM:7.12.1" "LanguageProficiency"
* communication.extension[languageControl] -> "NL-CM:7.12.6" "LanguageControlListening"
* communication.extension[languageControl] -> "NL-CM:7.12.7" "LanguageControlSpeaking"
* communication.extension[languageControl] -> "NL-CM:7.12.8" "LanguageControlReading"
* communication.extension[comment].value[x] -> "NL-CM:7.12.5" "Comment"
* communication.language -> "NL-CM:7.12.3" "CommunicationLanguage"

Mapping: NlbasePatient-to-zib-contactinformation-v1.2-2020EN
Id: zib-contactinformation-v1.2-2020EN
Title: "zib ContactInformation-v1.2(2020EN)"
Source: NlbasePatient
Target: "https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)"
* telecom -> "NL-CM:20.6.1" "ContactInformation"
* contact.telecom -> "NL-CM:20.6.1" "ContactInformation"

Mapping: NlbasePatient-to-zib-contactperson-v3.4-2020EN
Id: zib-contactperson-v3.4-2020EN
Title: "zib ContactPerson-v3.4(2020EN)"
Source: NlbasePatient
Target: "https://zibs.nl/wiki/ContactPerson-v3.4(2020EN)"
* contact -> "NL-CM:3.1.1" "Contact"
* contact.extension[contactPerson].value[x] -> "NL-CM:3.1.1" "Contact"
* contact.relationship[role] -> "NL-CM:3.1.2" "Role"
* contact.relationship[relationship] -> "NL-CM:3.1.3" "Relationship"
* contact.name -> "NL-CM:3.1.4" "NameInformation"
* contact.telecom -> "NL-CM:3.1.6" "ContactInformation"
* contact.address -> "NL-CM:3.1.5" "AddressInformation"

Mapping: NlbasePatient-to-zib-payer-v3.1.1-2020EN
Id: zib-payer-v3.1.1-2020EN
Title: "zib Payer-v3.1.1(2020EN)"
Source: NlbasePatient
Target: "https://zibs.nl/wiki/Payer-v3.1.1(2020EN)"
* name -> "NL-CM:1.1.5" "PayerName"
* telecom -> "NL-CM:1.1.12" "ContactInformation"
* address -> "NL-CM:1.1.17" "AddressInformation"
