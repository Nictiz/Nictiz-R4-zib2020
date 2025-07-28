Profile: NlcoreProcedurerequest
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-request
Id: nl-core-Procedure-request
Title: "nl core Procedure request"
* insert ProfileMetadata(nl-core-Procedure-request)
* insert Purpose(Procedure, 5.2, ServiceRequest)

* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.19--20200901000000 (required)
* orderDetail[procedureMethod] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.14.1.4--20200901000000 (required)
* locationReference ..1
* bodySite ..1
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    Therapeutic or diagnostic procedure the patient will undergo (the complementary profile [zib-Procedure-event](http://nictiz.nl/fhir/StructureDefinition/zib-Procedure-event) can be used for therapeutic or diagnostic procedures that the patient has undergone). A procedure can be a simple blood pressure measurement, but also a complex heart surgery.
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
