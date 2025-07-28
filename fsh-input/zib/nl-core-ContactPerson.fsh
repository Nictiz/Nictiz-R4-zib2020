Profile: NlcoreContactPerson
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson
Id: nl-core-ContactPerson
Title: "nl core ContactPerson"
* insert ProfileMetadata(nl-core-ContactPerson)
* insert Purpose(ContactPerson, 3.4, RelatedPerson)

* relationship[role] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.3.1.2--20200901000000 (required)
* relationship[relationship] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.3.1.1--20200901000000 (required)
* name[nameInformation] ..2

// Short, alias, definition and comment texts
* ^description = """
    A contact is a person not being a healthcare professional who is involved in the patient’s care, such as family members, caregivers, mental caretakers, guardians and legal representatives.
    
    In addition to identification information such as the name, address and contact information can also be entered. The relationship to the patient and the role this person has can be entered as well.
    """
* . ^alias[+] = "nl-core-ContactPerson"
