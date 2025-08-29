Profile: NlcoreCareTeam
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-CareTeam
Id: nl-core-CareTeam
Title: "nl core CareTeam"
* insert ProfileMetadata(nl-core-CareTeam)
* insert Purpose(CareTeam, 1.0, CareTeam)

* participant[contactPerson] ..1
* participant[contactPerson].member 1..
* participant[contactPerson].member only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson)
* participant[patient] ..1
* participant[patient].member 1..
* participant[patient].member only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* participant[healthcareProfessional] ..1
* participant[healthcareProfessional].role[healthProfessionalRole] ..1
* participant[healthcareProfessional].role[healthProfessionalRole] ^binding.strength = #required
* participant[healthcareProfessional].member 1..
* participant[healthcareProfessional].member only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* participant[healthcareProfessional].onBehalfOf only Reference(Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
* reasonReference only Reference(Condition or http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)

// Short, alias, definition and comment texts
* ^description = "A care team is a group of health professionals and other people involved in caring for a patient for one or more problems."
* . ^alias[+] = "nl-core-CareTeam"
* participant[healthcareProfessional].member insert PatternNlCoreHealthProfessional
