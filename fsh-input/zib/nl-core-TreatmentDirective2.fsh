Profile: NlcoreTreatmentDirective2
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-TreatmentDirective2
Id: nl-core-TreatmentDirective2
Title: "nl core TreatmentDirective2"
* insert ProfileMetadata(nl-core-TreatmentDirective2)
* ^purpose = "This Consent resource represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) TreatmentDirective2-v1.0 (2020)](https://zibs.nl/wiki/TreatmentDirective2-v1.0(2020EN))."

* . obeys zib-TreatmentDirective2-1 and zib-TreatmentDirective2-2
* extension[comment] ..1
* modifierExtension[specificationOther] ..1
* category[treatmentDirectiveCode] 1..1
* sourceReference only Reference(http://hl7.org/fhir/StructureDefinition/Consent or http://hl7.org/fhir/StructureDefinition/DocumentReference or http://hl7.org/fhir/StructureDefinition/Contract or http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse or http://nictiz.nl/fhir/StructureDefinition/nl-core-AdvanceDirective)
* provision.type from http://hl7.org/fhir/ValueSet/consent-provision-type|4.0.1 (required)
* provision.actor[agreementParty].reference only Reference(http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/Group or http://hl7.org/fhir/StructureDefinition/CareTeam or http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/RelatedPerson or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* provision.code ..1
* provision.code ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    A treatment directive contains a joint decision between a health professional (for example a general practitioner) and a patient or his representative(s) about the desirability of performing a certain treatment, such as resuscitation, before this treatment becomes (acute) necessary.
    When the need arises and the treatment cannot be discussed with the patient or representative (s), that decision is an important indication for the treating health professional (for example an ER doctor).
    The term treatment limit is a synonym of the term treatment directive.
    """
* . ^alias[+] = "nl-core-TreatmentDirective2"
* provision.actor[agreementParty].reference ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
