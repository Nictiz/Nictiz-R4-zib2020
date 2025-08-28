Profile: NlcoreProcedurerequest
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-request
Id: nl-core-Procedure-request
Title: "nl core Procedure request"
* insert ProfileMetadata(nl-core-Procedure-request)
* insert Purpose(Procedure, 5.2, ServiceRequest)

* code ^binding.strength = #required
* orderDetail[procedureMethod] ^binding.strength = #required
* subject only Reference(Patient or Group or Location or Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* requester only Reference(Practitioner or PractitionerRole or Organization or Patient or RelatedPerson or Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* performer only Reference(Practitioner or PractitionerRole or Organization or CareTeam or HealthcareService or Patient or Device or RelatedPerson or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-CareTeam)
* locationReference ..1
* locationReference only Reference(Location or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider)
* reasonReference only Reference(Condition or Observation or DiagnosticReport or DocumentReference or http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* bodySite ..1
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AnatomicalLocation
* bodySite ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    Therapeutic or diagnostic procedure the patient will undergo (the complementary profile [nl-core-Procedure-event](http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-event) can be used for therapeutic or diagnostic procedures that the patient has undergone). A procedure can be a simple blood pressure measurement, but also a complex heart surgery.
    In some care settings, the term treatment is used instead of the term procedure.
    """
* .
  * ^alias[+] = "nl-core-Procedure-request"
  * ^comment = """
    The zib Procedure is mapped both to this ServiceRequest profile and a profile on Procedure (<http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-event>) to align with the intention of FHIR. All past procedures are covered using this Procedure resource, while all future procedures, including the advised procedures, are covered in the ServiceRequest resource. Both resources contain the zib mappings.
    
    The planned and performed procedures can be linked using `Procedure.basedOn`.
    """
* requester ^comment = """
    The zib mapping contains a known cardinality difference (`0..*` versus `0..1`). The zib will be aligned in a future version with the cardinality of FHIR, therefore this profile pre-adopts the `0..1` cardinality for the requester. 
    
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
* performer ^comment = """
    If multiple performers are present, it is interpreted as a list of *alternative* performers without any preference regardless of order. This deviates from the zib definition where multiple references to the zib Healthprofessional should be interpreted as all the performers of the procedure. If order of preference is needed use the [request-performerOrder extension](extension-request-performerorder.html).  Use CareTeam to represent a group of performers (for example, Practitioner A *and* Practitioner B).
    
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
