Profile: NlcorePatient
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Patient
Id: nl-core-Patient
Title: "nl core Patient"
* insert ProfileMetadata(nl-core-Patient)
* insert Purpose(Patient, 3.2, Patient)

* extension[nationality].extension[code].value[x] ^binding.strength = #extensible
* name[nameInformation] ..2
* gender from http://hl7.org/fhir/ValueSet/administrative-gender|4.0.1 (required)
* gender.extension[genderCodelist] ..1
* gender.extension[genderCodelist].value[x] ^binding.strength = #required
* maritalStatus ^binding.strength = #required
* contact.extension[contactPerson] ..1
* contact.extension[contactPerson].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson)
* contact.relationship[role] ^binding.strength = #required
* contact.relationship[relationship] ^binding.strength = #required
* communication.extension[languageControl].extension 2..
* communication.extension[languageControl].extension[level] 1..
* communication.extension[languageControl].extension[type] 1..1
* communication.extension[comment] ..1
* communication.language ^binding.strength = #required

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
* contact.name ^comment = "This element can and should not completely capture the NameInformation concept from zib ContactPerson; it should just be used for the information that is needed for contacting the person in relation to care of the patient. The full name information should instead be captured using an instance of [nl-core-ContactPerson](http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson), which can then be referenced from this resource. See the comment on `Patient.contact` for more information."
* contact.address ^comment = "This element can and should not completely capture the AddressInformation concept from zib ContactPerson; it should just be used for the information that is needed for contacting the person in relation to care of the patient. The full address information should instead be captured using an instance of [nl-core-ContactPerson](http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson), which can then be referenced from this resource. See the comment on `Patient.contact` for more information."
