Profile: NlcoreVaccinationrequest
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Vaccination-request
Id: nl-core-Vaccination-request
Title: "nl core Vaccination request"
* insert ProfileMetadata(nl-core-Vaccination-request)
* insert Purpose(Vaccination, 4.0, ImmunizationRecommendation)

* recommendation ..1
* recommendation.vaccineCode ..1
* recommendation.vaccineCode from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.17--20200901000000 (required)
* recommendation.dateCriterion ..1

// Short, alias, definition and comment texts
* ^description = """
    Immunization can be defined as “Generating natural immunity against pathogens by means of vaccination (active immunization) or by administering immunoglobulins (passive immunization)”.
    
    Only the (administered and planned) vaccinations are included in this information model. Administering immunoglobulins is part of the medication overview. Vaccinations have lifelong relevance.
    
    Most vaccinations are carried out in the Netherlands as part of the RVP (Rijksvaccinatieprogramma, National Immunisation Program). RVP information is especially important for children.
    
    Vaccinations are also relevant for adult patients such as transplant patients, dialysis patients and patients with a post-splenectomy status. In addition, there are specific indications for the vaccination of risk groups, such as travelers, professionals who come into contact with blood or patients with wounds, weakened immune systems or heightened risk.
    """
* .
  * ^alias[+] = "nl-core-Vaccination-request"
  * ^comment = """
    The zib Vaccination is mapped to this ImmunizationRecommendation profile and a profile on Immunization (<http://nictiz.nl/fhir/StructureDefinition/nl-core-Vaccination-event>). All administered vaccinations are covered using the Immunization profile, while all planned vaccinations are covered in this ImmunizationRecommendation profile. The zib concepts Dose (NL-CM:11.1.4) and Administrator (NL-CM:11.1.6) are not suitable for planned vaccinations based on their current definitions and are therefore not mapped in this ImmunizationRecommendation profile.
    
    Please note that the ImmunizationRecommendation profile has been aligned as much as possible with the zib Vaccination by setting the cardinalities of `.recommendation` ,`.vaccineCode` and `.dateCriterion` to x..1. This results in the removal of the ability to exchange a vaccination schema. Moreover, ImmunizationRecommendation has more mandatory elements that are not represented in the zib, such as `.date` and `.recomendation.forecastStatus`. Implementers will need to take these requirements into account when implementing future vaccinations.
    """
