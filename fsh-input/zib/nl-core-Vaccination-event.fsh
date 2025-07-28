Profile: NlcoreVaccinationevent
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Vaccination-event
Id: nl-core-Vaccination-event
Title: "nl core Vaccination event"
* insert ProfileMetadata(nl-core-Vaccination-event)
* insert Purpose(Vaccination, 4.0, Immunization)

* vaccineCode from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.17--20200901000000 (required)
* performer[administrator] ..1
* performer[administrator].function 1..
* note ..1

// Short, alias, definition and comment texts
* ^description = """
    Immunization can be defined as “Generating natural immunity against pathogens by means of vaccination (active immunization) or by administering immunoglobulins (passive immunization)”.
    
    Only the (administered and planned) vaccinations are included in this information model. Administering immunoglobulins is part of the medication overview. Vaccinations have lifelong relevance.
    
    Most vaccinations are carried out in the Netherlands as part of the RVP (Rijksvaccinatieprogramma, National Immunisation Program). RVP information is especially important for children.
    
    Vaccinations are also relevant for adult patients such as transplant patients, dialysis patients and patients with a post-splenectomy status. In addition, there are specific indications for the vaccination of risk groups, such as travelers, professionals who come into contact with blood or patients with wounds, weakened immune systems or heightened risk.
    """
* .
  * ^alias[+] = "nl-core-Vaccination-event"
  * ^comment = """
    The zib Vaccination is mapped to this Immunization profile and a profile on ImmunizationRecommendation (<http://nictiz.nl/fhir/StructureDefinition/nl-core-Vaccination-request>). All administered vaccinations are covered using this Immunization profile, while all planned vaccinations are covered in the ImmunizationRecommendation profile. 
    
    Please note that, contrary to the related zib concepts, `.vaccineCode` and `.occurrence[x]` are mandatory in FHIR and need to be recorded to exchange Immunization resources.
    """
* performer[administrator].actor ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
