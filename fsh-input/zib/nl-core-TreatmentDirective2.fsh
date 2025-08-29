Profile: NlcoreTreatmentDirective2
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-TreatmentDirective2
Id: nl-core-TreatmentDirective2
Title: "nl core TreatmentDirective2"
* insert ProfileMetadata(nl-core-TreatmentDirective2)
* ^purpose = "This Consent resource represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) TreatmentDirective2-v1.0 (2020)](https://zibs.nl/wiki/TreatmentDirective2-v1.0(2020EN))."

* . obeys zib-TreatmentDirective2-1 and zib-TreatmentDirective2-2
* extension[comment] ..1
* extension[additionalAdvanceDirective].value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-AdvanceDirective)
* modifierExtension[specificationOther] ..1
* category[treatmentDirectiveCode] 1..1
* patient only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* sourceReference only Reference(Consent or DocumentReference or Contract or QuestionnaireResponse or http://nictiz.nl/fhir/StructureDefinition/nl-core-AdvanceDirective)
* provision.actor[agreementParty].reference only Reference(Device or Group or CareTeam or Organization or Patient or Practitioner or RelatedPerson or PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* provision.code ..1
* provision.code ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    A treatment directive contains a joint decision between a health professional (for example a general practitioner) and a patient or his representative(s) about the desirability of performing a certain treatment, such as resuscitation, before this treatment becomes (acute) necessary.
    When the need arises and the treatment cannot be discussed with the patient or representative (s), that decision is an important indication for the treating health professional (for example an ER doctor).
    The term treatment limit is a synonym of the term treatment directive.
    """
* . ^alias[+] = "nl-core-TreatmentDirective2"
* provision.actor[agreementParty].reference insert PatternNlCoreHealthProfessional
