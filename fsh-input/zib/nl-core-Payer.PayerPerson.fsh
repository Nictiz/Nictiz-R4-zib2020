Profile: NlcorePayerPayerPerson
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Payer.PayerPerson
Id: nl-core-Payer.PayerPerson
Title: "nl core Payer.PayerPerson"
* insert ProfileMetadata(nl-core-Payer.PayerPerson)
* ^purpose = "This Coverage resource represents the PayerPerson concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Payer v3.1.1 (2020)](https://zibs.nl/wiki/Payer-v3.1.1(2020EN))."

* type 1..
* payor ..1
* payor only Reference(http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-core-Payer-Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson)

// Short, alias, definition and comment texts
* ^description = "Payers are organizations or individuals that pay for the healthcare supplied to the patient. These organizations or individuals can be: facilities or people who financially guarantee or who are responsible for the patient (such as parents or guardians of minors), organizations with direct financial responsibility, combinations of these or the patient themselves."
* .
  * ^alias[+] = "nl-core-Payer.PayerPerson"
  * ^comment = """
    The zib Payer is split into two focal profiles on Coverage based on the PayerPerson and InsuranceCompany containers. These two containers cannot be profiled within one profile because they both require mapping different concepts on elements such as `.payor` and `.type`.
    
    The zib container Payer.PayerPerson is mapped to this Coverage profile and uses the profile [nl-core-Patient](http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient), [nl-core-ContactPerson](http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson) or [nl-core-Payer-Organization](http://nictiz.nl/fhir/StructureDefinition/nl-core-Payer-Organization) to capture the PayerName, AddressInformation and ContactInformation concepts. These profiles are referenced using the `.payor` element.
    """
