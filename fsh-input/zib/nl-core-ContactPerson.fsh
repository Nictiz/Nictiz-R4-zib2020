Profile: NlcoreContactPerson
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson
Id: nl-core-ContactPerson
Title: "nl core ContactPerson"
* insert ProfileMetadata(nl-core-ContactPerson)
* insert Purpose(ContactPerson, 3.4, RelatedPerson)

* relationship[role] ^binding.strength = #required
* relationship[relationship] ^binding.strength = #required
* name[nameInformation] ..2

// Short, alias, definition and comment texts
* ^description = """
    A contact is a person not being a healthcare professional who is involved in the patient’s care, such as family members, caregivers, mental caretakers, guardians and legal representatives.
    
    In addition to identification information such as the name, address and contact information can also be entered. The relationship to the patient and the role this person has can be entered as well.
    """
* . ^alias[+] = "nl-core-ContactPerson"
