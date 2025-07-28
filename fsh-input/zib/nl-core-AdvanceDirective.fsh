Profile: NlcoreAdvanceDirective
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AdvanceDirective
Id: nl-core-AdvanceDirective
Title: "nl core AdvanceDirective"
* insert ProfileMetadata(nl-core-AdvanceDirective)
* insert Purpose(AdvanceDirective, 3.1.1, Consent)

* extension[comment] ..1
* category[advanceDirectiveCode] 1..1
* provision.actor[representative] ..1
* provision.actor[representative].reference only Reference(http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/Group or http://hl7.org/fhir/StructureDefinition/CareTeam or http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/RelatedPerson or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson)
* provision.code ..1
* provision.code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.15.1--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "A living will is a verbal or written description of the patient’s wishes with regard to future medical action or end of their life. A living will is mainly used for situations in which the patient is no longer able to speak about these decisions with their healthcare provider."
* . ^alias[+] = "nl-core-AdvanceDirective"
