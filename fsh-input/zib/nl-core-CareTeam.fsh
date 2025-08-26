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
* participant[healthcareProfessional].member ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
