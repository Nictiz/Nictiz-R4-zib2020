Profile: NlcorePatient
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Patient
Id: nl-core-Patient
Title: "nl core Patient"
* insert ProfileMetadata(nl-core-Patient)
* insert Purpose(Patient, 3.2, Patient)

* extension[nationality].extension[code].value[x] ^binding.strength = #extensible
* name[nameInformation] ..2
* name[nameInformation] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-NameInformation
* name[nameInformation-GivenName] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-NameInformation.GivenName
* telecom[telephoneNumbers] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactInformation-TelephoneNumbers
* telecom[emailAddresses] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactInformation-EmailAddresses
* gender.extension[genderCodelist] ..1
* gender.extension[genderCodelist].value[x] ^binding.strength = #required
* address ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AddressInformation
* maritalStatus ^binding.strength = #required
* contact.extension[contactPerson] ..1
* contact.extension[contactPerson].value[x] only Reference(RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson)
* contact.name ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-NameInformation
* contact.relationship[role] ^binding.strength = #required
* contact.relationship[relationship] ^binding.strength = #required
* contact.telecom[telephoneNumbers] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactInformation-TelephoneNumbers
* contact.telecom[emailAddresses] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactInformation-EmailAddresses
* contact.address ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AddressInformation
* communication.extension[languageControl].extension 2..
* communication.extension[languageControl].extension[level] 1..
* communication.extension[languageControl].extension[type] 1..1
* communication.extension[languageControl].extension[level].value[x] ^binding.strength = #required
* communication.extension[comment] ..1
* communication.language ^binding.strength = #required
* generalPractitioner only Reference(Organization or Practitioner or PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)

// Short, alias, definition and comment texts
* ^description = """
    A person who receives medical, psychological, paramedical or nursing care. In some care settings, the term client or participant is used instead of the term patient.
    Nationality is used as an indication of the country of citizenship. 
    Marital status is a person’s formal position as defined by the Dutch civil code. There is a distinction between marriage and civil union.
    Linguistic proficiency is the ability to express oneself in a certain language and understand statements made in that language. This includes both oral and written communication.
    """
* . ^alias[+] = "nl-core-Patient"
* contact ^comment = """
    Whereas the zib ContactPerson includes all (non-healthcare professional) persons that are involved in the care for a patient, FHIR distinguishes two use cases for these persons:
    
    * The RelatedPerson resource is used to capture information about any person that is related to the patient, using the profile <http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson>.
    * Information about persons that should be _contacted_ regarding the care for the patient is captured using the `Patient.contact` resource.
    
    If a person is both a related person and a contact person, then some data duplication is inevitable. The nl-core-ContactPerson can be referenced using the extension in `contact:contactPerson`.
    """
* contact.extension[contactPerson].value[x] ^definition = "Reference to an [nl-core-ContactPerson](http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson) instance containing the full details for the current contact."
* contact.name ^comment = "This element can and should not completely capture the NameInformation concept from zib ContactPerson; it should just be used for the information that is needed for contacting the person in relation to care of the patient. The full name information should instead be captured using an instance of [nl-core-ContactPerson](http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson), which can then be referenced from this resource. See the comment on `Patient.contact` for more information."
* contact.address ^comment = "This element can and should not completely capture the AddressInformation concept from zib ContactPerson; it should just be used for the information that is needed for contacting the person in relation to care of the patient. The full address information should instead be captured using an instance of [nl-core-ContactPerson](http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson), which can then be referenced from this resource. See the comment on `Patient.contact` for more information."
* generalPractitioner ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """

