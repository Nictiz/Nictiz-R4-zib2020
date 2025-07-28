Profile: NlbaseEncounter
Parent: Encounter
Id: nl-base-Encounter
Title: "nl base Encounter"
* insert ProfileMetadata(nl-base-Encounter)
* insert Purpose(Encounter, 4.0.1, Encounter)

* class insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/ContactTypeCodeLijst-to-ActEncounterCode)
* class from http://terminology.hl7.org/ValueSet/v3-ActEncounterCode (preferred)
* participant insert Discriminator(profile, individual.resolve(\))
* participant contains
    healthProfessional 0..
* participant[healthProfessional].type from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.17.1.5--20200901000000 (preferred)
* participant[healthProfessional].individual only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)
* reasonCode insert Discriminator(exists, coding)
* reasonCode contains
    deviatingResult 0..
* reasonCode.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-Comment named commentContactReason 0..1
* reasonReference insert Discriminator(profile, resolve(\))
* reasonReference contains
    problem 0.. and
    procedure 0..
* reasonReference.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-Comment named commentContactReason 0..1
* reasonReference[problem] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)
* reasonReference[procedure] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-event)
* hospitalization.admitSource from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.15.1.2--20200901000000 (preferred)
* hospitalization.dischargeDisposition from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.15.1.3--20200901000000 (preferred)
* location.location only Reference(http://hl7.org/fhir/StructureDefinition/Location or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider)

// Short, alias, definition and comment texts
* ^description = """
    A contact is any interaction, regardless of the situation, between a patient and the healthcare provider, in which the healthcare provider has primary responsibility for diagnosing, evaluating and treating the patient’s condition and informing the patient. These can be visits, appointments or non face-to-face interactions.
    
    Contacts can be visits to the general practitioner or other practices, home visits, admissions (in hospitals, nursing homes or care homes, psychiatric institutions or convalescent homes) or other relevant contacts. This includes past and future contacts.
    """
* .
  * ^short = "Encounter"
  * ^alias[+] = "Contact"
* status ^comment = """
    This element is implictly mapped to the zib concepts NL-CM:15.1.3 (StartDateTime) and NL-CM:15.1.4 (EndDateTime). Unless the status is explicitly recorded, the following guidance applies:
    
    * When StartDateTime is in the future, `.status` will usually be set to _planned_.
    * When StartDateTime is in the past and EndDateTime is present and in the future, `.status` will usually be set to _in-progress_.
    * When EndDateTime is present and in the past, `.status` will usually be set to _finished_.
    * When EndDateTime is not present, this means it was a point-in-time encounter and `.status` will usually be set to _finished_.
    * When a system is unable to infer the status from the StartDateTime and EndDateTime, `.status` will be set to _unknown_.
    
    The _unknown_ code is not to be used to convey other statuses.  The _unknown_ code should be used when one of the statuses applies, but the authoring system doesn't know the current state of the procedure.
    
    This element is labeled as a modifier because the status contains codes that mark the resource as not currently valid.
    """
* class
  * ^short = "ContactType"
  * ^alias[+] = "ContactType"
  * ^definition = "The type of contact."
* participant[healthProfessional].type
  * ^short = "HealthProfessionalRole"
  * ^alias[+] = "ZorgverlenerRol"
  * ^definition = "The role the health professional fulfils in the healthcare process. For health professionals, this could be for example attender, referrer or performer."
* participant[healthProfessional].individual
  * ^short = "ContactWith"
  * ^alias[+] = "ContactMet"
  * ^definition = "The health professional with whom the contact took or will take place. The specialty and role of the health professional can be entered in the HealthProfessional information model."
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-base-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-base-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which can be referenced on the `Encounter.participant` element (due to open slicing). Since this should be the exception, the nl-base-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
* period.start
  * ^short = "StartDateTime"
  * ^alias[+] = "BeginDatumTijd"
  * ^definition = "The date and time at which the contact took or will take place."
  * ^comment = "If only a single moment in time is known for the encounter rather than a period, both `period.start` and `period.end` are populated with this value (populating just `period.start` would indicate an ongoing period)."
* period.end
  * ^short = "EndDateTime"
  * ^alias[+] = "EindDatumTijd"
  * ^definition = "The date and time at which the contact ended or will end. If the contact takes place over a period of time, this indicates the end of the period, in the case of an admission, for example."
  * ^comment = "If only a single moment in time is known for the encounter rather than a period, both `period.start` and `period.end` are populated with this value (populating just `period.start` would indicate an ongoing period)."
* reasonCode[deviatingResult].extension[commentContactReason].value[x]
  * ^short = "CommentContactReason"
  * ^alias[+] = "ToelichtingRedenContact"
  * ^definition = "Explanation of the reason for the contact"
* reasonCode[deviatingResult].text
  * ^short = "DeviatingResult"
  * ^alias[+] = "AfwijkendeUitslag"
  * ^definition = "A deviating result or other textual explanation which serves as the reason for the contact."
  * ^comment = "Note that this definition is wider than the zib concept DeviatingResult (NL-CM:15.1.12); although the zib concept deals only with deviating results as reason for the encounter, this element could be populated with _any_ reason for the encounter, including but not limited to deviating results. Implementers should be aware of the usage context of this profile to understand if this element is limited to a deviating result."
* reasonReference.extension[commentContactReason].value[x]
  * ^short = "CommentContactReason"
  * ^alias[+] = "ToelichtingRedenContact"
  * ^definition = "Explanation of the reason for the contact"
* reasonReference[problem]
  * ^short = "Problem"
  * ^alias[+] = "Probleem"
  * ^definition = "The problem that is the reason for the contact."
* reasonReference[procedure]
  * ^short = "Procedure"
  * ^alias[+] = "Verrichting"
  * ^definition = "The procedure carried out or will be carried out during the contact."
* hospitalization.admitSource
  * ^short = "Origin"
  * ^alias[+] = "Herkomst"
  * ^definition = "Location from which the patient comes before the encounter. In most cases this will only be used when the patient is admitted."
* hospitalization.dischargeDisposition
  * ^short = "Destination"
  * ^alias[+] = "Bestemming"
  * ^definition = "Location to which the patient will go after the encounter. In most cases this will only be used when the patient is discharged."
* location.location
  * ^short = "Location"
  * ^alias[+] = "Locatie"
  * ^definition = "The physical location at which the contact took or will take place."

Mapping: NlbaseEncounter-to-zib-encounter-v4.0.1-2020EN
Id: zib-encounter-v4.0.1-2020EN
Title: "zib Encounter-v4.0.1(2020EN)"
Source: NlbaseEncounter
Target: "https://zibs.nl/wiki/Encounter-v4.0.1(2020EN)"
*  -> "NL-CM:15.1.1" "Encounter"
* status -> "NL-CM:15.1.3" "StartDateTime (implicit, main mapping is on `Encounter.period`)"
* status -> "NL-CM:15.1.4" "EndDateTime (implicit, main mapping is on `Encounter.period`)"
* class -> "NL-CM:15.1.2" "ContactType"
* participant[healthProfessional].individual -> "NL-CM:15.1.7" "ContactWith"
* period.start -> "NL-CM:15.1.3" "StartDateTime"
* period.end -> "NL-CM:15.1.4" "EndDateTime"
* reasonCode[deviatingResult].extension[commentContactReason].value[x] -> "NL-CM:15.1.17" "CommentContactReason"
* reasonCode[deviatingResult].text -> "NL-CM:15.1.12" "DeviatingResult"
* reasonReference.extension[commentContactReason].value[x] -> "NL-CM:15.1.17" "CommentContactReason"
* reasonReference[problem] -> "NL-CM:15.1.6" "Problem"
* reasonReference[procedure] -> "NL-CM:15.1.11" "Procedure"
* hospitalization.admitSource -> "NL-CM:15.1.14" "Origin"
* hospitalization.dischargeDisposition -> "NL-CM:15.1.16" "Destination"
* location.location -> "NL-CM:15.1.8" "Location"

Mapping: NlbaseEncounter-to-zib-healthprofessional-v3.5-2020EN
Id: zib-healthprofessional-v3.5-2020EN
Title: "zib HealthProfessional-v3.5(2020EN)"
Source: NlbaseEncounter
Target: "https://zibs.nl/wiki/HealthProfessional-v3.5(2020EN)"
* participant[healthProfessional].type -> "NL-CM:17.1.5" "HealthProfessionalRole"
