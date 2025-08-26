Profile: NlcorePayerInsuranceCompany
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Payer.InsuranceCompany
Id: nl-core-Payer.InsuranceCompany
Title: "nl core Payer.InsuranceCompany"
* insert ProfileMetadata(nl-core-Payer.InsuranceCompany)
* ^purpose = "This Coverage resource represents the InsuranceCompany concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Payer v3.1.1 (2020)](https://zibs.nl/wiki/Payer-v3.1.1(2020EN))."

* type ^binding.strength = #required
* payor ..1
* payor only Reference(Organization or Patient or RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-core-Payer-Organization)

// Short, alias, definition and comment texts
* ^description = "Payers are organizations or individuals that pay for the healthcare supplied to the patient. These organizations or individuals can be: facilities or people who financially guarantee or who are responsible for the patient (such as parents or guardians of minors), organizations with direct financial responsibility, combinations of these or the patient themselves."
* .
  * ^alias[+] = "nl-core-Payer.InsuranceCompany"
  * ^comment = """
    The zib Payer is split into two focal profiles on Coverage based on the PayerPerson and InsuranceCompany containers. These two containers cannot be profiled within one profile because they both require mapping different concepts on elements such as `.payor` and `.type`.
    
    The zib container Payer.InsuranceCompany is mapped to this Coverage profile and uses the profile nl-core-Payer-Organization (<http://nictiz.nl/fhir/StructureDefinition/nl-core-Payer-Organization>) to capture the OrganizationName, IdentificationNumber, AddressInformation and ContactInformation. The nl-core-Payer-Organization profile is referenced using the `.payor` element.
    """
