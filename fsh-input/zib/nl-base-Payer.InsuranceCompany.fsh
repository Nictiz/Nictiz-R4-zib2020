Profile: NlbasePayerInsuranceCompany
Parent: Coverage
Id: nl-base-Payer.InsuranceCompany
Title: "nl base Payer.InsuranceCompany"
* insert ProfileMetadata(nl-base-Payer.InsuranceCompany)
* ^purpose = "This Coverage resource represents the InsuranceCompany concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Payer v3.1.1 (2020)](https://zibs.nl/wiki/Payer-v3.1.1(2020EN))."

* type from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.1.1.1--20200901000000 (preferred)
* payor only Reference(Organization or Patient or RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-base-Payer-Organization)

// Short, alias, definition and comment texts
* ^description = "Payers are organizations or individuals that pay for the healthcare supplied to the patient. These organizations or individuals can be: facilities or people who financially guarantee or who are responsible for the patient (such as parents or guardians of minors), organizations with direct financial responsibility, combinations of these or the patient themselves."
* .
  * ^short = "Payer / Insurance"
  * ^alias[+] = "Betaler"
  * ^alias[+] = "Verzekering"
  * ^comment = """
    The zib Payer is split into two focal profiles on Coverage based on the PayerPerson and InsuranceCompany containers. These two containers cannot be profiled within one profile because they both require mapping different concepts on elements such as `.payor` and `.type`.
    
    The zib container Payer.InsuranceCompany is mapped to this Coverage profile and uses the profile nl-base-Payer-Organization (<http://nictiz.nl/fhir/StructureDefinition/nl-base-Payer-Organization>) to capture the OrganizationName, IdentificationNumber, AddressInformation and ContactInformation. The nl-base-Payer-Organization profile is referenced using the `.payor` element.
    """
* status ^comment = """
    Sending systems that don't record an explicit status can use the following guidance to infer a value from the zib:
    
    * StartDateTime is present and in the future: _draft_
    * EndDateTime is present:
        * and in the future: _active_
        * and in the past: _cancelled_
    * When no status can be derived from StartDateTime and EndDateTime it is expected that only _active_ Coverage resources are exchanged.
    """
* type
  * ^short = "InsuranceType"
  * ^alias[+] = "Verzekeringssoort"
  * ^definition = "Type of insurance policy. Codes as returned in the Check for Right to Insurance."
* subscriberId
  * ^short = "InsurantNumber"
  * ^alias[+] = "VerzekerdeNummer"
  * ^definition = "Number under which the insured person is registered at the insurance company This item maps the ‘Identification number of the card’ on EHIC field 8"
* period.start
  * ^short = "StartDateTime"
  * ^alias[+] = "BeginDatumTijd"
  * ^definition = "Date from which the insurance policy coverage applies."
* period.end
  * ^short = "EndDateTime"
  * ^alias[+] = "EindDatumTijd"
  * ^definition = "Date until which the insurance policy coverage applies. This item maps the ‘Expiry date’ on EHIC field 9."
* payor
  * ^short = "InsuranceCompany"
  * ^alias[+] = "Verzekeraar"

Mapping: NlbasePayerInsuranceCompany-to-zib-payer-v3.1.1-2020EN
Id: zib-payer-v3.1.1-2020EN
Title: "zib Payer-v3.1.1(2020EN)"
Source: NlbasePayerInsuranceCompany
Target: "https://zibs.nl/wiki/Payer-v3.1.1(2020EN)"
*  -> "NL-CM:1.1.1" "Payer"
*  -> "NL-CM:1.1.8" "Insurance"
* status -> "NL-CM:1.1.13" "StartDateTime (implicit, main mapping is on Coverage.period.start)"
* status -> "NL-CM:1.1.14" "EndDateTime (implicit, main mapping is on Coverage.period.end)"
* type -> "NL-CM:1.1.15" "InsuranceType"
* subscriberId -> "NL-CM:1.1.6" "InsurantNumber"
* period.start -> "NL-CM:1.1.13" "StartDateTime"
* period.end -> "NL-CM:1.1.14" "EndDateTime"
* payor -> "NL-CM:1.1.3" "InsuranceCompany"
