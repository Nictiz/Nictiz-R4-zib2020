Profile: NlbaseProcedureevent
Parent: Procedure
Id: nl-base-Procedure-event
Title: "nl base Procedure event"
* insert ProfileMetadata(nl-base-Procedure-event)
* insert Purpose(Procedure, 5.2, Procedure)

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-Procedure.ProcedureMethod named procedureMethod 0..*
* basedOn only Reference(CarePlan or ServiceRequest or http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-request)
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.19--20200901000000 (preferred)
* performed[x] insert Discriminator(type, $this)
* performedPeriod only Period
* performedDateTime only dateTime
* performer.actor only Reference(Practitioner or PractitionerRole or Organization or Patient or RelatedPerson or Device or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)
* location only Reference(Location or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider)
* reasonReference only Reference(Condition or Observation or Procedure or DiagnosticReport or DocumentReference or http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)
* bodySite insert PatternNlBaseAnatomicalLocation
* report insert Discriminator(profile, resolve(\))
* report contains
    textResult 0..
* report[textResult] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-TextResult)

// Short, alias, definition and comment texts
* ^description = """
    Therapeutic or diagnostic procedure undergone by the patient (the complementary profile [nl-base-Procedure-request](http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-request) can be used for therapeutic or diagnostic procedures that the patient will undergo). A procedure can be a simple blood pressure measurement, but also a complex heart surgery.
    In some care settings, the term treatment is used instead of the term procedure.
    """
* .
  * ^short = "Procedure"
  * ^alias[+] = "Verrichting"
  * ^comment = """
    The zib Procedure is mapped both to this Procedure profile and a profile on ServiceRequest (<http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-request>) to align with the intention of FHIR. All past procedures are covered using this Procedure resource, while all future procedures, including the advised procedures, are covered in the ServiceRequest resource. Both resources contain the zib mappings, with the exception of the Requester concept; this is not relevant for past procedures and has only been mapped to the ServiceRequest profile.
    
    The planned and performed procedures can be linked using `Procedure.basedOn`.
    """
* basedOn ^comment = "The root element provides more information on the usage of `Procedure.basedOn` for the zib Procedure."
* status ^definition = """
    This element is implictly mapped to the zib concepts ProcedureStartDate (NL-CM:14.1.2) and ProcedureEndDate (NL-CM:14.1.3). Unless the status is explicitly recorded, the following guidance applies:
    
    * When the ProcedureStartDate is in the future, `.status` will usually be set to _preparation_.
    * When ProcedureStartDate is in the past and ProcedureEndDate is in the future, `.status` will usually be set to _in-progress_.
    * When ProcedureEndDate is in the past, `.status` will usually be set to _completed_.
    * When ProcedureStartDate is in the past and ProcedureEndDate is missing, it may be assumed that the Procedure was recorded as a point in time and `.status` will usually be set to _completed_.
    * When a system is unable to infer the status from the ProcedureStartDate and ProcedureEndDate , `.status` will be set to _unknown_. The _unknown_ code is not to be used to convey other statuses. The _unknown_ code should be used when one of the statuses applies, but the authoring system doesn't know the current state of the Procedure.
    """
* code
  * ^short = "ProcedureType"
  * ^alias[+] = "VerrichtingType"
  * ^definition = "The name of the procedure. Choices are the DHD procedure thesaurus, the procedures file (CBV), the Care activities file (NZa), the Dutch Mental Health and Addiction Care procedures list (GGZ) and the procedures list of the Dutch College of General Practitioners (NHG)."
* performedPeriod.start
  * ^short = "ProcedureStartDate"
  * ^alias[+] = "VerrichtingStartDatum"
  * ^definition = "The start date (and if possible start time) of the procedure. A ‘vague’ date, such as only the year, is permitted. The element offers the option to indicate the start of the period of a series of related procedures."
  * ^comment = "If the zib Procedure concerns a procedure performed over a period, `Procedure.performedPeriod.start` and `Procedure.performedPeriod.end` are used to represent zib concepts ProcedureStartDate and ProcedureEndDate. For instantaneous or very short lasting procedures, `Procedure.performedDateTime` is used for ProcedureStartDate (ProcedureEndDate doesn't have a meaning in this case; ProcedureStartDate is the moment the procedure is performed)."
* performedPeriod.end
  * ^short = "ProcedureEndDate"
  * ^alias[+] = "VerrichtingEindDatum"
  * ^definition = "The end date (and if possible end time) of the procedure. A ‘vague’ date, such as only the year, is permitted. The element offers the option to indicate the end of the period of a series of related procedures. The end date element is only used for a procedures that takes some time and is then always applied. If the procedure still continues, the value is left empty."
  * ^comment = "If the zib Procedure concerns a procedure performed over a period, `Procedure.performedPeriod.start` and `Procedure.performedPeriod.end` are used to represent zib concepts ProcedureStartDate and ProcedureEndDate. For instantaneous or very short lasting procedures, `Procedure.performedDateTime` is used for ProcedureStartDate (ProcedureEndDate doesn't have a meaning in this case; ProcedureStartDate is the moment the procedure is performed)."
* performedDateTime
  * ^short = "ProcedureStartDate"
  * ^alias[+] = "VerrichtingStartDatum"
  * ^definition = "The (desired) start date (and if possible start time) of the procedure. A ‘vague’ date, such as only the year, is permitted. `performedDateTime` is used for instantaneous or very short lasting procedures."
  * ^comment = "If the zib Procedure concerns a procedure performed over a period, `Procedure.performedPeriod.start` and `Procedure.performedPeriod.end` are used to represent zib concepts ProcedureStartDate and ProcedureEndDate. For instantaneous or very short lasting procedures, `Procedure.performedDateTime` is used for ProcedureStartDate (ProcedureEndDate doesn't have a meaning in this case; ProcedureStartDate is the moment the procedure is performed)."
* performer.actor
  * ^short = "Performer"
  * ^alias[+] = "Uitvoerder"
  * ^definition = "The healthcare provider who carried out or will carry out the procedure. In most cases, only the medical specialty is entered, and not the name of the healthcare provider."
  * insert PatternNlBaseHealthProfessional
* location
  * ^short = "Location"
  * ^alias[+] = "Locatie"
  * ^definition = "The healthcare center where the procedure was, is or or will be carried out."
  * ^comment = "Please note that the zib concept Location::HealthcareProvider of zib MedicalDevice (NL-CM:10.1.8) is mapped onto this element, but it is also directly represented using a custom extension in the focal profile for that zib ([nl-base-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice)). The reason for this is that the Location concept from zib MedicalDevice aligns with the Location concept from zib Procedure, but only for the situation that the Procedure is about placing an implant which is described using the instance of zib MedicalDevice. In this situation, the extension in the nl-base-MedicalDevice profile is redundant and it is advised to only use the current element to represent the Location concept."
* reasonReference
  * ^short = "Indication"
  * ^alias[+] = "Indicatie"
  * ^definition = "The indication is the reason for the procedure."
* bodySite
  * ^short = "Location / ProcedureAnatomicalLocation"
  * ^alias[+] = "VerrichtingAnatomischeLocatie"
  * ^definition = "Anatomical location which is the focus of the procedure."
* report[textResult]
  * ^short = "TextResult"
  * ^alias[+] = "TekstUitslag"
  * ^comment = """
    The direction of the reference between zibs TextResult and Procedure is reversed in FHIR. Therefore the concept Procedure (NL-CM:13.2.5) of zib TextResult is mapped to this element.
    
    Please note that on a functional level, zib TextResult references zib Procedure, but in FHIR this direction is reversed.
    """

Mapping: NlbaseProcedureevent-to-zib-procedure-v5.2-2020EN
Id: zib-procedure-v5.2-2020EN
Title: "zib Procedure-v5.2(2020EN)"
Source: NlbaseProcedureevent
Target: "https://zibs.nl/wiki/Procedure-v5.2(2020EN)"
*  -> "NL-CM:14.1.1" "Procedure"
* status -> "NL-CM:14.1.2" "ProcedureStartDate (implicit, main mapping is on Procedure.performedPeriod.start and Procedure.performedDateTime)"
* status -> "NL-CM:14.1.3" "ProcedureEndDate (implicit, main mapping is on Procedure.performedPeriod.end)"
* code -> "NL-CM:14.1.4" "ProcedureType"
* performedPeriod.start -> "NL-CM:14.1.2" "ProcedureStartDate"
* performedPeriod.end -> "NL-CM:14.1.3" "ProcedureEndDate"
* performedDateTime -> "NL-CM:14.1.2" "ProcedureStartDate"
* performer.actor -> "NL-CM:14.1.6" "Performer"
* location -> "NL-CM:14.1.5" "Location"
* reasonReference -> "NL-CM:14.1.9" "Indication"
* bodySite -> "NL-CM:14.1.13" "ProcedureAnatomicalLocation"

Mapping: NlbaseProcedureevent-to-zib-textresult-v4.4-2020EN
Id: zib-textresult-v4.4-2020EN
Title: "zib TextResult-v4.4(2020EN)"
Source: NlbaseProcedureevent
Target: "https://zibs.nl/wiki/TextResult-v4.4(2020EN)"
* report[textResult] -> "NL-CM:13.2.5" "Reversed reference for zib TextResult.Procedure"

Mapping: NlbaseProcedureevent-to-zib-medicaldevice-v3.3.1-2020EN
Id: zib-medicaldevice-v3.3.1-2020EN
Title: "zib MedicalDevice-v3.3.1(2020EN)"
Source: NlbaseProcedureevent
Target: "https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)"
* location -> "NL-CM:10.1.8" "Location (For specific situations only. See the comment on this element for more information.)"
