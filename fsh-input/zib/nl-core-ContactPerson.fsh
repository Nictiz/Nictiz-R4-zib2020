Profile: NlcoreContactPerson
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson
Id: nl-core-ContactPerson
Title: "nl core ContactPerson"
* insert ProfileMetadata(nl-core-ContactPerson)
* insert Purpose(ContactPerson, 3.4, RelatedPerson)

* patient only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* relationship[role] ^binding.strength = #required
* relationship[relationship] ^binding.strength = #required
* name[nameInformation] ..2
* name[nameInformation] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-NameInformation
* name[nameInformation-GivenName] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-NameInformation.GivenName
* telecom[telephoneNumbers] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactInformation-TelephoneNumbers
* telecom[emailAddresses] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactInformation-EmailAddresses
* address ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AddressInformation

// Short, alias, definition and comment texts
* ^description = """
    A contact is a person not being a healthcare professional who is involved in the patient’s care, such as family members, caregivers, mental caretakers, guardians and legal representatives.
    
    In addition to identification information such as the name, address and contact information can also be entered. The relationship to the patient and the role this person has can be entered as well.
    """
* . ^alias[+] = "nl-core-ContactPerson"
