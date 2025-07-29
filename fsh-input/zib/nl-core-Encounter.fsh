Profile: NlcoreEncounter
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Encounter
Id: nl-core-Encounter
Title: "nl core Encounter"
* insert ProfileMetadata(nl-core-Encounter)
* insert Purpose(Encounter, 4.0.1, Encounter)

* class from http://terminology.hl7.org/ValueSet/v3-ActEncounterCode (extensible)
* participant[healthProfessional].type ..1
* participant[healthProfessional].type ^binding.strength = #extensible
* participant[healthProfessional].individual only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* reasonCode[deviatingResult].extension[commentContactReason] ..1
* reasonCode[deviatingResult].coding ..0
* reasonReference.extension[commentContactReason] ..1
* reasonReference[problem] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* reasonReference[procedure] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-event)
* hospitalization.admitSource ^binding.strength = #extensible
* hospitalization.dischargeDisposition ^binding.strength = #extensible
* location ..1
* location.location only Reference(http://hl7.org/fhir/StructureDefinition/Location or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider)

// Short, alias, definition and comment texts
* ^description = """
    A contact is any interaction, regardless of the situation, between a patient and the healthcare provider, in which the healthcare provider has primary responsibility for diagnosing, evaluating and treating the patient’s condition and informing the patient. These can be visits, appointments or non face-to-face interactions.
    
    Contacts can be visits to the general practitioner or other practices, home visits, admissions (in hospitals, nursing homes or care homes, psychiatric institutions or convalescent homes) or other relevant contacts. This includes past and future contacts.
    """
* . ^alias[+] = "nl-core-Encounter"
* participant[healthProfessional].individual ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which can be referenced on the `Encounter.participant` element (due to open slicing). Since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
