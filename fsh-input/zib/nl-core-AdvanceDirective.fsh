Profile: NlcoreAdvanceDirective
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-AdvanceDirective
Id: nl-core-AdvanceDirective
Title: "nl core AdvanceDirective"
* insert ProfileMetadata(nl-core-AdvanceDirective)
* insert Purpose(AdvanceDirective, 3.1.1, Consent)

* extension[comment] ..1
* extension[disorder].value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* category[advanceDirectiveCode] 1..1
* patient only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* provision.actor[representative] ..1
* provision.actor[representative].reference only Reference(Device or Group or CareTeam or Organization or Patient or Practitioner or RelatedPerson or PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson)
* provision.code ..1
* provision.code ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "A living will is a verbal or written description of the patient’s wishes with regard to future medical action or end of their life. A living will is mainly used for situations in which the patient is no longer able to speak about these decisions with their healthcare provider."
* . ^alias[+] = "nl-core-AdvanceDirective"
