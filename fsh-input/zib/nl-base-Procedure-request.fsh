Profile: NlbaseProcedurerequest
Parent: ServiceRequest
Id: nl-base-Procedure-request
Title: "nl base Procedure request"
* insert ProfileMetadata(nl-base-Procedure-request)
* insert Purpose(Procedure, 5.2, ServiceRequest)

* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.19--20200901000000 (preferred)
* orderDetail insert Discriminator(value, $this)
* orderDetail contains
    procedureMethod 0..
* orderDetail[procedureMethod] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.14.1.4--20200901000000 (preferred)
* occurrence[x] insert Discriminator(type, $this)
* occurrencePeriod only Period
* occurrenceDateTime only dateTime
* requester only Reference(Practitioner or PractitionerRole or Organization or Patient or RelatedPerson or Device or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)
* performer only Reference(Practitioner or PractitionerRole or Organization or CareTeam or HealthcareService or Patient or Device or RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-base-CareTeam)
* locationReference only Reference(Location or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider)
* reasonReference only Reference(Condition or Observation or DiagnosticReport or DocumentReference or http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)
* bodySite insert PatternNlBaseAnatomicalLocation

// Short, alias, definition and comment texts
* ^description = """
    Therapeutic or diagnostic procedure the patient will undergo (the complementary profile [nl-base-Procedure-event](http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-event) can be used for therapeutic or diagnostic procedures that the patient has undergone). A procedure can be a simple blood pressure measurement, but also a complex heart surgery.
    In some care settings, the term treatment is used instead of the term procedure.
    """
* .
  * ^short = "Procedure"
  * ^alias[+] = "Verrichting"
  * ^comment = """
    The zib Procedure is mapped both to this ServiceRequest profile and a profile on Procedure (<http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-event>) to align with the intention of FHIR. All past procedures are covered using this Procedure resource, while all future procedures, including the advised procedures, are covered in the ServiceRequest resource. Both resources contain the zib mappings.
    
    The planned and performed procedures can be linked using `Procedure.basedOn`.
    """
* status ^definition = """
    This element is implictly mapped to the zib concepts ProcedureStartDate (NL-CM:14.1.2) and ProcedureEndDate (NL-CM:14.1.3). Unless the status is explicitly recorded, the following guidance applies:
    
    * When the ProcedureStartDate is in the future, `.status` will usually be set to _active_.
    * When the ProcedureStartDate is in the past, `.status` will usually be set to _completed_.
    * When ProcedureEndDate is in the past, `.status` will usually be set to _completed_.
    * When a system is unable to infer the status from the ProcedureStartDate and ProcedureEndDate , `.status` will be set to _unknown_. The _unknown_ code is not to be used to convey other statuses. The _unknown_ code should be used when one of the statuses applies, but the authoring system doesn't know the current state of the ProcedureRequest.
    """
* intent ^definition = "Unless intent is explicitly recorded and a more appropriate code is known, the value can be set to _order_ because a Procedure should authorize an action for a patient, pharmacist, professional administrator et cetera."
* code
  * ^short = "ProcedureType"
  * ^alias[+] = "VerrichtingType"
  * ^definition = "The name of the procedure. Choices are the DHD procedure thesaurus, the procedures file (CBV), the Care activities file (NZa), the Dutch Mental Health and Addiction Care procedures list (GGZ) and the procedures list of the Dutch College of General Practitioners (NHG)."
* orderDetail[procedureMethod]
  * ^short = "ProcedureMethod"
  * ^alias[+] = "VerrichtingMethode"
  * ^definition = "The method or technique that will be used to perform the procedure, e.g. approach, lavage, pressuring, etc."
* occurrencePeriod.start
  * ^short = "ProcedureStartDate"
  * ^alias[+] = "VerrichtingStartDatum"
  * ^definition = "The (desired) start date (and if possible start time) of the procedure. A ‘vague’ date, such as only the year, is permitted. The element offers the option to indicate the start of the period of a series of related procedures."
  * ^comment = "If the zib Procedure concerns a procedure performed over a period, `ServiceRequest.occurencePeriod.start` and `ServiceRequest.occurencePeriod.end` are used to represent zib concepts ProcedureStartDate and ProcedureEndDate. For instantaneous or very short lasting procedures, `ServiceRequest.occurrenceDateTime` is used for ProcedureStartDate (ProcedureEndDate doesn't have a meaning in this case; ProcedureStartDate is the moment the procedure is performed)."
* occurrencePeriod.end
  * ^short = "ProcedureEndDate"
  * ^alias[+] = "VerrichtingEindDatum"
  * ^definition = "The end date (and if possible end time) of the procedure. A ‘vague’ date, such as only the year, is permitted. The element offers the option to indicate the end of the period of a series of related procedures. The end date element is only used for a procedures that takes some time and is then always applied. If the procedure still continues, the value is left empty."
  * ^comment = "If the zib Procedure concerns a procedure performed over a period, `ServiceRequest.occurencePeriod.start` and `ServiceRequest.occurencePeriod.end` are used to represent zib concepts ProcedureStartDate and ProcedureEndDate. For instantaneous or very short lasting procedures, `ServiceRequest.occurrenceDateTime` is used for ProcedureStartDate (ProcedureEndDate doesn't have a meaning in this case; ProcedureStartDate is the moment the procedure is performed)."
* occurrenceDateTime
  * ^short = "ProcedureStartDate"
  * ^alias[+] = "VerrichtingStartDatum"
  * ^definition = "The (desired) start date (and if possible start time) of the procedure. A ‘vague’ date, such as only the year, is permitted."
  * ^comment = "If the zib Procedure concerns a procedure performed over a period, `ServiceRequest.occurencePeriod.start` and `ServiceRequest.occurencePeriod.end` are used to represent zib concepts ProcedureStartDate and ProcedureEndDate. For instantaneous or very short lasting procedures, `ServiceRequest.occurrenceDateTime` is used for ProcedureStartDate (ProcedureEndDate doesn't have a meaning in this case; ProcedureStartDate is the moment the procedure is performed)."
* requester
  * ^short = "Requester"
  * ^alias[+] = "Aanvrager"
  * ^definition = "The healthcare provider who requested the procedure."
  * ^comment = """
    The zib mapping contains a known cardinality difference (`0..*` versus `0..1`). The zib will be aligned in a future version with the cardinality of FHIR, therefore this profile pre-adopts the `0..1` cardinality for the requester. 
    
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-base-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-base-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-base-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
* performer
  * ^short = "Performer"
  * ^alias[+] = "Uitvoerder"
  * ^definition = "The healthcare provider who carried out or will carry out the procedure. In most cases, only the medical specialty is entered, and not the name of the healthcare provider."
  * ^comment = """
    If multiple performers are present, it is interpreted as a list of *alternative* performers without any preference regardless of order. This deviates from the zib definition where multiple references to the zib Healthprofessional should be interpreted as all the performers of the procedure. If order of preference is needed use the [request-performerOrder extension](extension-request-performerorder.html).  Use CareTeam to represent a group of performers (for example, Practitioner A *and* Practitioner B).
    
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-base-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-base-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-base-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
* locationReference
  * ^short = "Location"
  * ^alias[+] = "Locatie"
  * ^definition = "The healthcare center where the procedure was, is or or will be carried out."
* reasonReference
  * ^short = "Indication"
  * ^alias[+] = "Indicatie"
  * ^definition = "The indication is the reason for the procedure."
* bodySite
  * ^short = "Location / ProcedureAnatomicalLocation"
  * ^alias[+] = "VerrichtingAnatomischeLocatie"
  * ^definition = "Anatomical location which is the focus of the procedure."

Mapping: NlbaseProcedurerequest-to-zib-procedure-v5.2-2020EN
Id: zib-procedure-v5.2-2020EN
Title: "zib Procedure-v5.2(2020EN)"
Source: NlbaseProcedurerequest
Target: "https://zibs.nl/wiki/Procedure-v5.2(2020EN)"
*  -> "NL-CM:14.1.1" "Procedure"
* status -> "NL-CM:14.1.2" "ProcedureStartDate (implicit, main mapping is on ServiceRequest.occurrencePeriod.start and ServiceRequest.occurrenceDateTime)"
* status -> "NL-CM:14.1.3" "ProcedureEndDate (implicit, main mapping is on ServiceRequest.occurrencePeriod.end)"
* code -> "NL-CM:14.1.4" "ProcedureType"
* orderDetail[procedureMethod] -> "NL-CM:14.1.12" "ProcedureMethod"
* occurrencePeriod.start -> "NL-CM:14.1.2" "ProcedureStartDate"
* occurrencePeriod.end -> "NL-CM:14.1.3" "ProcedureEndDate"
* occurrenceDateTime -> "NL-CM:14.1.2" "ProcedureStartDate"
* requester -> "NL-CM:14.1.10" "Requester"
* performer -> "NL-CM:14.1.6" "Performer"
* locationReference -> "NL-CM:14.1.5" "Location"
* reasonReference -> "NL-CM:14.1.9" "Indication"
* bodySite -> "NL-CM:14.1.13" "ProcedureAnatomicalLocation"
