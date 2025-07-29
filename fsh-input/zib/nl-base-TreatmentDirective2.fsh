Profile: NlbaseTreatmentDirective2
Parent: Consent
Id: nl-base-TreatmentDirective2
Title: "nl base TreatmentDirective2"
* insert ProfileMetadata(nl-base-TreatmentDirective2)
* ^purpose = "This Consent resource represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) TreatmentDirective2-v1.0 (2020)](https://zibs.nl/wiki/TreatmentDirective2-v1.0(2020EN))."

* . obeys zib-TreatmentDirective2-1 and zib-TreatmentDirective2-2
* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-Comment named comment 0..1 and
    http://nictiz.nl/fhir/StructureDefinition/ext-TreatmentDirective2.AdvanceDirective named additionalAdvanceDirective 0..*
* extension[additionalAdvanceDirective] ^condition[+] = zib-TreatmentDirective2-1
* extension[additionalAdvanceDirective].value[x] ^condition[+] = zib-TreatmentDirective2-1
* modifierExtension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-TreatmentDirective2.SpecificationOther named specificationOther 0..*
* modifierExtension[specificationOther] ^condition[+] = zib-TreatmentDirective2-2
* modifierExtension[specificationOther].value[x] ^condition[+] = zib-TreatmentDirective2-2
* scope = http://terminology.hl7.org/CodeSystem/consentscope#treatment
* category insert Discriminator(value, $this)
* category contains
    treatmentDirectiveCode 0..1
* category[treatmentDirectiveCode] = http://snomed.info/sct#129125009
* source[x] insert Discriminator(type, $this)
* source[x] ^condition[+] = zib-TreatmentDirective2-1
* sourceReference 0..
  * ^condition[+] = zib-TreatmentDirective2-1
* sourceReference only Reference(Consent or DocumentReference or Contract or QuestionnaireResponse or http://nictiz.nl/fhir/StructureDefinition/nl-base-AdvanceDirective)
* provision.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-TreatmentDirective2.ReasonForEnding named reasonForEnding 0..*
* provision.type ^condition[+] = zib-TreatmentDirective2-2
* provision.type from http://hl7.org/fhir/ValueSet/consent-provision-type|4.0.1 (required)
* provision.type insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/TreatmentDecisionCodelist-to-ConsentProvisionType, TreatmentDecisionCodelist-to-ConsentProvisionType, ConsentProvisionType)
* provision.actor insert Discriminator(value, role)
* provision.actor contains
    agreementParty 0..
* provision.actor[agreementParty].role = http://terminology.hl7.org/CodeSystem/v3-RoleCode#CONSENTER
* provision.actor[agreementParty].reference only Reference(Device or Group or CareTeam or Organization or Patient or Practitioner or RelatedPerson or PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-base-Patient or http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)
* provision.code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.2.2.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    A treatment directive contains a joint decision between a health professional (for example a general practitioner) and a patient or his representative(s) about the desirability of performing a certain treatment, such as resuscitation, before this treatment becomes (acute) necessary.
    When the need arises and the treatment cannot be discussed with the patient or representative (s), that decision is an important indication for the treating health professional (for example an ER doctor).
    The term treatment limit is a synonym of the term treatment directive.
    """
* .
  * ^short = "TreatmentDirective"
  * ^alias[+] = "BehandelAanwijzing"
  * ^comment = "A straightforward and accurate mapping of zib TreatmentDirective2 to FHIR is not possible. The main consideration is to choose between the Consent and CarePlan resource. Unfortunately, the Consent resource does not have full support for treatment directives yet as its main focus is to model Patient's privacy consents. Regardless, it seems to be the best match to represent the intention of the zib, as both the resource and the zib cover a mutual agreement about treatments and not per se the resulting actions or policy for treatments, which would better be handled using the CarePlan resource. Future migration to a later version of FHIR or the zib will result in the reevaluation of the mapping."
* extension[comment].value[x]
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "The comment may include further information such as the reason why a treatment directive has been drawn up, persons who assisted the patient in agreeing the treatment directive but who are not otherwise involved in the agreement as a representative, etc."
* extension[additionalAdvanceDirective].value[x] ^comment = "`Consent.source:sourceReference` is the primary target for referencing zib AdvanceDirective (zib concept NL-CM:2.2.8). However, the cardinality of `Consent.source[x]` is restricted to `0..1`. If more than one AdvanceDirective needs to be referenced, the _additional_ references can be communicated using this extension. If this extension is used, `Consent.source:sourceReference` SHALL be populated and it SHALL not contain the same reference as this extension."
* status ^comment = """
    This element is implicitly mapped to the zib concepts NL-CM:2.2.5 (MostRecentReviewDate) and NL-CM:2.2.6 (DateExpired). Unless the status is explicitly recorded, the following guidance applies:
    
    * When MostRecentReviewDate is in the past and DateExpired is absent or in the future, `.status` will usually be set to _active_.
    * When DateExpired is in the past, `.status` will usually be set to _inactive_.
    * When MostRecentReviewDate is absent or in the future,  which is not possible following the zib, `.status` will usually be set to _draft_.
    """
* dateTime
  * ^short = "MostRecentReviewDate"
  * ^alias[+] = "MeestRecenteBespreekdatum"
  * ^definition = "The date on which the treatment directive has been agreed with the patient and / or his representative (s). This can be the first time that the treatment directive have been discussed, but an existing treatment directive may also have been discussed again. The content of the treatment directive may have changed or remained the same."
* sourceReference
  * ^short = "AdvanceDirective"
  * ^alias[+] = "Wilsverklaring"
  * ^definition = "A (written) statement in which a person indicates wishes concerning future medical action, in the event that this person is at that point no longer (deemed) capable of taking decisions on the matter."
  * ^comment = "The cardinality of this `Consent.source[x]` element is restricted to `0..1`, which is narrower than the AdvanceDirective concept (NL-CM:2.2.8) specified in the HCIM TreatmentDirective2. If additional AdvanceDirective references are needed, the additionalAdvanceDirective extension can be used _in addition to_ this element. If the additionalAdvanceDirective extension is used, this element SHALL be populated and it SHALL not contain a reference that is also present in the extension."
* policy.uri ^comment = "Either `.policy` or `.policyRule` should exist following core constraint ppc-1. If no explicit value is recorded, a fallback is to populate `.policy.uri` with <https://wetten.overheid.nl/> if the treatment directive is recorded following Dutch law and regulations."
* provision.type
  * ^short = "TreatmentDecision"
  * ^alias[+] = "BehandelBesluit"
  * ^definition = "The joint decision taken with regard to the desirability of performing the indicated treatment. If the agreement is 'Other', 'Specification Other' shall contain the instructions for whether or not to carry out the treatment. Implementers SHALL support the specificationOther modifier extension for this."
* provision.period.end
  * ^short = "DateExpired"
  * ^alias[+] = "DatumBeeindigd"
  * ^definition = "The date on which the treatment directive has been withdrawn and therefore no longer applies. An explicit decision must be taken about the 'date expired', in consultation between the responsible care provider and the patient or his representative(s).Any future termination can only be entered as a condition. Often this will be linked to 1 or more events."
* provision.actor[agreementParty]
  * ^short = "AgreementParty"
  * ^alias[+] = "AfspraakPartij"
* provision.actor[agreementParty].reference
  * ^short = "Patient / Representative / HealthProfessional"
  * ^alias[+] = "Patient"
  * ^alias[+] = "Vertegenwoordiger"
  * ^alias[+] = "Zorgverlener"
  * ^definition = """
    * Patient as the person with whom the agreement was made.
    * Person who represents the patient in health care matters and with whom the agreement has been made (too).
    * HealthProfessional who has made the agreement regarding the treatment directive.
    """
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-base-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-base-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-base-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
* provision.code
  * ^short = "Treatment"
  * ^alias[+] = "Behandeling"
  * ^definition = "The medical treatment to which the treatment instruction applies."

Invariant: zib-TreatmentDirective2-1
Description: "`extension.additionalAdvanceDirective` may only be used for AdvanceDirective references in addition to first reference in `.source[x]`."
Severity: #error
Expression: "extension.where(url = 'http://nictiz.nl/fhir/StructureDefinition/ext-TreatmentDirective2.AdvanceDirective').empty() or source.exists()"

Invariant: zib-TreatmentDirective2-2
Description: "If the specificationOther extension is used, `.provision.type` MUST be absent and vice versa"
Severity: #error
Expression: "(extension.where(url = 'http://nictiz.nl/fhir/StructureDefinition/ext-TreatmentDirective2.SpecificitionOther').exists() and provision.type.exists()).not()"

Mapping: NlbaseTreatmentDirective2-to-zib-treatmentdirective2-v1.0-2020EN
Id: zib-treatmentdirective2-v1.0-2020EN
Title: "zib TreatmentDirective2-v1.0(2020EN)"
Source: NlbaseTreatmentDirective2
Target: "https://zibs.nl/wiki/TreatmentDirective2-v1.0(2020EN)"
*  -> "NL-CM:2.2.1" "TreatmentDirective"
* extension[comment].value[x] -> "NL-CM:2.2.13" "Comment"
* status -> "NL-CM:2.2.5" "MostRecentReviewDate (implicit, main mapping is on `Consent.dateTime`)"
* status -> "NL-CM:2.2.6" "DateExpired (implicit, main mapping is on `Consent.provision.period.end`)"
* dateTime -> "NL-CM:2.2.5" "MostRecentReviewDate"
* sourceReference -> "NL-CM:2.2.8" "AdvanceDirective"
* provision.type -> "NL-CM:2.2.2" "TreatmentDecision"
* provision.period.end -> "NL-CM:2.2.6" "DateExpired"
* provision.actor[agreementParty] -> "NL-CM:2.2.9" "AgreementParty"
* provision.actor[agreementParty].reference -> "NL-CM:2.2.10" "Patient"
* provision.actor[agreementParty].reference -> "NL-CM:2.2.11" "Representative"
* provision.actor[agreementParty].reference -> "NL-CM:2.2.12" "HealthProfessional"
* provision.code -> "NL-CM:2.2.3" "Treatment"
