Profile: NlbaseAdvanceDirective
Parent: Consent
Id: nl-base-AdvanceDirective
Title: "nl base AdvanceDirective"
* insert ProfileMetadata(nl-base-AdvanceDirective)
* insert Purpose(AdvanceDirective, 3.1.1, Consent)

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-AdvanceDirective.Disorder named disorder 0..* and
    http://nictiz.nl/fhir/StructureDefinition/ext-Comment named comment 0..1
* scope = http://terminology.hl7.org/CodeSystem/consentscope#adr
* category insert Discriminator(value, $this)
* category contains
    advanceDirectiveCode 0..1
* category[advanceDirectiveCode] = http://terminology.hl7.org/CodeSystem/consentcategorycodes#acd
* source[x] insert Discriminator(type, $this)
* sourceAttachment only Attachment
* provision.actor insert Discriminator(value, role)
* provision.actor contains
    representative 0..1
* provision.actor[representative].role = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RESPRSN
* provision.actor[representative].reference only Reference(Device or Group or CareTeam or Organization or Patient or Practitioner or RelatedPerson or PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson)
* provision.code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.15.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "A living will is a verbal or written description of the patient’s wishes with regard to future medical action or end of their life. A living will is mainly used for situations in which the patient is no longer able to speak about these decisions with their healthcare provider."
* .
  * ^short = "AdvanceDirective"
  * ^alias[+] = "Wilsverklaring"
* extension[comment].value[x]
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the living will: the form, such as a medallion, tattoo, etc., or where the living will can be found."
* status ^comment = "This element has no functional counterpart in the zib and cannot be implicitly mapped to other zib concepts. An appropriate status needs to be recorded in order to produce a valid instance."
* scope ^comment = "At the moment of writing (02-11-2021) the _adr_ code is incorrectly removed from the ConsentScopeCodes CodeSystem (http://terminology.hl7.org/CodeSystem/consentscope). This will be corrected within the R4 release of FHIR based on this tracker item: <https://jira.hl7.org/browse/FHIR-34215>."
* dateTime
  * ^short = "LivingWillDate"
  * ^alias[+] = "WilsverklaringDatum"
  * ^definition = "The date on which the living will was recorded."
* sourceAttachment
  * ^short = "LivingWillDocument"
  * ^alias[+] = "WilsverklaringDocument"
  * ^definition = "Scanned source document with the living will and the patient's signature, such as a PDF."
* policy.uri ^comment = "Either `.policy` or `.policyRule` should exist following core constraint ppc-1. If no explicit value is recorded, a fallback is to populate `.policy.uri` with <https://wetten.overheid.nl/> if the advance directive is recorded following Dutch law and regulations."
* provision.actor[representative].reference
  * ^short = "Representative"
  * ^alias[+] = "Vertegenwoordiger"
  * ^definition = "The person who is the legal representative or is appointed as the authorized representative in the signed authorization."
* provision.code
  * ^short = "LivingWillType"
  * ^alias[+] = "WilsverklaringType"
  * ^definition = "List of the different types of living wills."

Mapping: NlbaseAdvanceDirective-to-zib-advancedirective-v3.1.1-2020EN
Id: zib-advancedirective-v3.1.1-2020EN
Title: "zib AdvanceDirective-v3.1.1(2020EN)"
Source: NlbaseAdvanceDirective
Target: "https://zibs.nl/wiki/AdvanceDirective-v3.1.1(2020EN)"
*  -> "NL-CM:7.15.1" "AdvanceDirective"
* extension[comment].value[x] -> "NL-CM:7.15.6" "Comment"
* dateTime -> "NL-CM:7.15.7" "LivingWillDate"
* sourceAttachment -> "NL-CM:7.15.5" "LivingWillDocument"
* provision.actor[representative].reference -> "NL-CM:7.15.3" "Representative"
* provision.code -> "NL-CM:7.15.2" "LivingWillType"
