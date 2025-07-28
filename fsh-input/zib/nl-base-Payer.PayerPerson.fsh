Profile: NlbasePayerPayerPerson
Parent: Coverage
Id: nl-base-Payer.PayerPerson
Title: "nl base Payer.PayerPerson"
* insert ProfileMetadata(nl-base-Payer.PayerPerson)
* ^purpose = "This Coverage resource represents the PayerPerson concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Payer v3.1.1 (2020)](https://zibs.nl/wiki/Payer-v3.1.1(2020EN))."

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-Payer.BankInformation named bankInformation 0..*
* type = http://terminology.hl7.org/CodeSystem/coverage-selfpay#pay
* payor only Reference(Organization or Patient or RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-base-Payer-Organization or http://nictiz.nl/fhir/StructureDefinition/nl-base-Patient or http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson)

// Short, alias, definition and comment texts
* ^description = "Payers are organizations or individuals that pay for the healthcare supplied to the patient. These organizations or individuals can be: facilities or people who financially guarantee or who are responsible for the patient (such as parents or guardians of minors), organizations with direct financial responsibility, combinations of these or the patient themselves."
* .
  * ^short = "Payer"
  * ^alias[+] = "Betaler"
  * ^comment = """
    The zib Payer is split into two focal profiles on Coverage based on the PayerPerson and InsuranceCompany containers. These two containers cannot be profiled within one profile because they both require mapping different concepts on elements such as `.payor` and `.type`.
    
    The zib container Payer.PayerPerson is mapped to this Coverage profile and uses the profile [nl-base-Patient](http://nictiz.nl/fhir/StructureDefinition/nl-base-Patient), [nl-base-ContactPerson](http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson) or [nl-base-Payer-Organization](http://nictiz.nl/fhir/StructureDefinition/nl-base-Payer-Organization) to capture the PayerName, AddressInformation and ContactInformation concepts. These profiles are referenced using the `.payor` element.
    """
* status ^comment = "When systems don't record an explicit status and no status can be derived from the `.period.start` and `.period.end` elements it is expected that only _active_ Coverage resources are exchanged."
* payor
  * ^short = "PayerPerson"
  * ^alias[+] = "BetalerPersoon"
  * ^definition = "In the PayerPerson concept a person is a natural person or a juridical person, such as an organization, municipality, etc."
  * ^comment = """
    If the resource referenced is conformant to one of the target zib profiles, these profiles provide a mapping to the relevant zib Payer concepts. If it is not conformant to one of these zib profiles, it SHALL have at least the following FHIR elements filled to be compliant with the subsequent zib Payer concepts:
    * `name.text` - PayerPerson::PayerName (NL-CM:1.1.5)
    * `address` - AddressInformation (NL-CM:1.1.17)
    * `telecom` - ContactInformation (NL-CM:1.1.12)
    """

Mapping: NlbasePayerPayerPerson-to-zib-payer-v3.1.1-2020EN
Id: zib-payer-v3.1.1-2020EN
Title: "zib Payer-v3.1.1(2020EN)"
Source: NlbasePayerPayerPerson
Target: "https://zibs.nl/wiki/Payer-v3.1.1(2020EN)"
*  -> "NL-CM:1.1.1" "Payer"
* payor -> "NL-CM:1.1.2" "PayerPerson"
