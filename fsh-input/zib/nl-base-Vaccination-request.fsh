Profile: NlbaseVaccinationrequest
Parent: ImmunizationRecommendation
Id: nl-base-Vaccination-request
Title: "nl base Vaccination request"
* insert ProfileMetadata(nl-base-Vaccination-request)
* insert Purpose(Vaccination, 4.0, ImmunizationRecommendation)

* recommendation.vaccineCode from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.17--20200901000000 (preferred)

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
    The zib Vaccination is mapped to this ImmunizationRecommendation profile and a profile on Immunization (<http://nictiz.nl/fhir/StructureDefinition/nl-base-Vaccination-event>). All administered vaccinations are covered using the Immunization profile, while all planned vaccinations are covered in this ImmunizationRecommendation profile. The zib concepts Dose (NL-CM:11.1.4) and Administrator (NL-CM:11.1.6) are not suitable for planned vaccinations based on their current definitions and are therefore not mapped in this ImmunizationRecommendation profile.
    
    Please note that the ImmunizationRecommendation profile has been aligned as much as possible with the zib Vaccination by setting the cardinalities of `.recommendation` ,`.vaccineCode` and `.dateCriterion` to x..1. This results in the removal of the ability to exchange a vaccination schema. Moreover, ImmunizationRecommendation has more mandatory elements that are not represented in the zib, such as `.date` and `.recomendation.forecastStatus`. Implementers will need to take these requirements into account when implementing future vaccinations.
    """
* recommendation.vaccineCode
  * ^short = "ProductCode"
  * ^alias[+] = "ProductCode"
  * ^definition = "The product code of the vaccine administered. There are several possible code systems for documenting the product code. If the vaccination data is registered based on an anamnesis, coding with the ATC code is preferred. In all cases it concerns those products that fall under ATC group J07 (vaccines)."
* recommendation.dateCriterion.value
  * ^short = "VaccinationDate"
  * ^alias[+] = "VaccinatieDatum"
  * ^definition = "Date (and if possible time) that the vaccine will be administered. In the case of a planned re-vaccination, a vague date (month, year) is allowed (Clinical reminder). If a planned vaccination cannot be administered before a certain date, the date stated (vague or not) must indicate this."
  * ^comment = "Please note that `.dateCriterion.code` is made mandatory in FHIR to provide a classification of the date. This is functionally covered by the zib within the VaccinationDate concept as vague dates are allowed. This information cannot be included inside the DateTime datatype, but is explicitly captured in `.dateCriterion.code`."
* recommendation.description
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = """
    Free text explanation. Examples of commonly used explanations are: 
    * \"Vaccination according to the National Immunisation Program\".
    * \"Not according to the National Immunisation Program\", followed by further explanation. 
    * \"Unknown\"
    """

Mapping: NlbaseVaccinationrequest-to-zib-vaccination-v4.0-2020EN
Id: zib-vaccination-v4.0-2020EN
Title: "zib Vaccination-v4.0(2020EN)"
Source: NlbaseVaccinationrequest
Target: "https://zibs.nl/wiki/Vaccination-v4.0(2020EN)"
*  -> "NL-CM:11.1.1" "Vaccination"
* recommendation.vaccineCode -> "NL-CM:11.1.2" "ProductCode"
* recommendation.dateCriterion.code -> "NL-CM:11.1.3" "VaccinationDate (implicit, main mapping is on `.dateCriterion.value`)"
* recommendation.dateCriterion.value -> "NL-CM:11.1.3" "VaccinationDate"
* recommendation.description -> "NL-CM:11.1.7" "Comment"
