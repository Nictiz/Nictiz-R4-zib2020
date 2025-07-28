Profile: NlbaseVaccinationevent
Parent: Immunization
Id: nl-base-Vaccination-event
Title: "nl base Vaccination event"
* insert ProfileMetadata(nl-base-Vaccination-event)
* insert Purpose(Vaccination, 4.0, Immunization)

* vaccineCode from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.17--20200901000000 (preferred)
* occurrence[x] insert Discriminator(type, $this)
* occurrenceDateTime only dateTime
* doseQuantity = http://unitsofmeasure.org#None
* performer insert Discriminator(value, function)
* performer contains
    administrator 0..1
* performer[administrator].function = http://terminology.hl7.org/CodeSystem/v2-0443#AP
* performer[administrator].actor only Reference(Practitioner or PractitionerRole or Organization or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)

// Short, alias, definition and comment texts
* ^description = """
    Immunization can be defined as “Generating natural immunity against pathogens by means of vaccination (active immunization) or by administering immunoglobulins (passive immunization)”.
    
    Only the (administered and planned) vaccinations are included in this information model. Administering immunoglobulins is part of the medication overview. Vaccinations have lifelong relevance.
    
    Most vaccinations are carried out in the Netherlands as part of the RVP (Rijksvaccinatieprogramma, National Immunisation Program). RVP information is especially important for children.
    
    Vaccinations are also relevant for adult patients such as transplant patients, dialysis patients and patients with a post-splenectomy status. In addition, there are specific indications for the vaccination of risk groups, such as travelers, professionals who come into contact with blood or patients with wounds, weakened immune systems or heightened risk.
    """
* .
  * ^short = "Vaccination"
  * ^alias[+] = "Vaccinatie"
  * ^comment = """
    The zib Vaccination is mapped to this Immunization profile and a profile on ImmunizationRecommendation (<http://nictiz.nl/fhir/StructureDefinition/nl-base-Vaccination-request>). All administered vaccinations are covered using this Immunization profile, while all planned vaccinations are covered in the ImmunizationRecommendation profile. 
    
    Please note that, contrary to the related zib concepts, `.vaccineCode` and `.occurrence[x]` are mandatory in FHIR and need to be recorded to exchange Immunization resources.
    """
* status ^comment = "This element has no functional counterpart in the zib and cannot be implicitly mapped to other concepts. Unless a more appropriate status is recorded, it is assumed that only _completed_ Immunization resources will be exchanged."
* vaccineCode
  * ^short = "ProductCode"
  * ^alias[+] = "ProductCode"
  * ^definition = """
    The product code of the vaccine administered.
    There are several possible code systems for documenting the product code. If the vaccination data is registered based on an anamnesis, coding with the ATC code is preferred. In all cases it concerns those products that fall under ATC group J07 (vaccines).
    """
* occurrenceDateTime
  * ^short = "VaccinationDate"
  * ^alias[+] = "VaccinatieDatum"
  * ^definition = "Date (and if possible time) that the vaccine was administered."
* doseQuantity
  * ^short = "Dose"
  * ^alias[+] = "Dosis"
  * ^definition = "The amount of product administered expressed in UCUM, often mL. In most cases, the entire product is administered; in some cases, a described part of the product is administered."
  * ^comment = "The definition of Dose deviates slightly from the zib 2020 vaccination definition; the unit of measure is not limited to mL. This difference is according to the planned vaccination zib modifications (https://bits.nictiz.nl/browse/ZIB-1654)."
* performer[administrator].actor
  * ^short = "Administrator"
  * ^alias[+] = "Toediener"
  * ^definition = "The healthcare provider and/or organization where or by whom the immunization was done."
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-base-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-base-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-base-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = """
    Free text explanation.  
     
    Examples of commonly used explanations are:  
    * \"Vaccination according to the National Immunisation Program\".  
    * \"Not according to the National Immunisation Program\", followed by further explanation. 
    * \"Unknown\"
    """

Mapping: NlbaseVaccinationevent-to-zib-vaccination-v4.0-2020EN
Id: zib-vaccination-v4.0-2020EN
Title: "zib Vaccination-v4.0(2020EN)"
Source: NlbaseVaccinationevent
Target: "https://zibs.nl/wiki/Vaccination-v4.0(2020EN)"
*  -> "NL-CM:11.1.1" "Vaccination"
* vaccineCode -> "NL-CM:11.1.2" "ProductCode"
* occurrenceDateTime -> "NL-CM:11.1.3" "VaccinationDate"
* doseQuantity -> "NL-CM:11.1.4" "Dose"
* performer[administrator].actor -> "NL-CM:11.1.6" "Administrator"
* note.text -> "NL-CM:11.1.7" "Comment"
