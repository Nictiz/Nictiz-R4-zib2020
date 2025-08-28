Profile: NlcoreVaccinationevent
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Vaccination-event
Id: nl-core-Vaccination-event
Title: "nl core Vaccination event"
* insert ProfileMetadata(nl-core-Vaccination-event)
* insert Purpose(Vaccination, 4.0, Immunization)

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-Vaccination.PharmaceuticalProduct named pharmaceuticalProduct 0..1
* vaccineCode ^binding.strength = #required
* patient only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* occurrenceDateTime 1..1
* location only Reference(Location or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider)
* site ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AnatomicalLocation
* site from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (extensible)
* performer[administrator] ..1
* performer[administrator].function 1..
* performer[administrator].actor only Reference(Practitioner or PractitionerRole or Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
* reasonCode insert Discriminator(value, $this)
* reasonCode contains
    vaccinationIndication 0..* and
    vaccinationMotive 0..*
* reasonCode[vaccinationIndication] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.131.11.4--20220301181306 (required)
* reasonCode[vaccinationMotive] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.131.11.2--20220301153357 (required)
* protocolApplied.targetDisease insert Discriminator(value, $this)
* protocolApplied.targetDisease contains
    targetDisease 0..*
* protocolApplied.targetDisease[targetDisease] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.131.11.3--20220301175614 (required)
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
* extension[pharmaceuticalProduct].value[x]
  * ^definition = "The pharmaceutical product of the administered vaccination."
  * ^comment = "If this reference to zib PharmaceuticalProduct is used, the MedicationCode (`Medication.code`) in the referenced resource SHALL be the same as `Immunization.vaccineCode` of the current resource."
* patient
  * ^short = "Patient"
  * ^alias[+] = "Patient"
* vaccineCode ^comment = "It is possible to use a reference to zib PharmaceuticalProduct to identify the used vaccine, using `Immunization.extension:pharmaceuticalProduct`. If this reference is used, `Immunization.vaccineCode` SHALL contain the same value as the MedicationCode (`Medication.code`) in the referenced resource."
* location
  * ^definition = "The healthcare center where the vaccination is or or will be carried out."
  * ^comment = "Concept HealthcareProvider (imm-dataelement-262) is mapped to both `.location` and `.performer:administrator.actor`, to represent respectively the location where the vaccination was delivered (using [nl-core-HealthcareProvider](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider)) and the organization that delivered the vaccination (using [nl-core-HealthcareProvider-Organization](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization))."
* performer[administrator].actor
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the zib-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    
    Concept HealthcareProvider (imm-dataelement-262) is mapped to both `.location` and `.performer:administrator.actor`, to represent respectively the location where the vaccination was delivered (using [nl-core-HealthcareProvider](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider)) and the organization that delivered the vaccination (using [nl-core-HealthcareProvider-Organization](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)).
    """
* reasonCode[vaccinationIndication]
  * ^short = "VaccinationIndication"
  * ^definition = "Describes the person-specific characteristics why the immunization is administered to this patient (e.g. asplenia, immunosuppression or diabetes), net immunization advice."
  * ^alias[+] = "VaccinatieIndicatie"
* reasonCode[vaccinationMotive]
  * ^short = "VaccinationMotive"
  * ^definition = "Displays the trigger based on what the vaccine was administered."
  * ^alias[+] = "VaccinatieAanleiding"
* protocolApplied.doseNumber[x]
  * ^comment = "The use of an integer is preferred if known. A string should only be used in cases where an integer is not available (such as when documenting a recurring booster dose). If a value is unknown use string 'n/a' (without the quotes)."
* protocolApplied.targetDisease[targetDisease]
  * ^short = "VaccinationPathogen"
  * ^definition = "The diseases or pathogens against which the vaccination is primarily given."
  * ^alias[+] = "VaccinatiePathogeen"

Mapping: NlcoreVaccinationevent-to-imm-Vaccination-Immunization-20211118
Id: imm-Vaccination-Immunization-20211118
Title: "ART-DECOR Dataset Vaccination-Immunization 20211118T10:06:34"
Source: NlcoreVaccinationevent
Target: "https://decor.nictiz.nl/ad/#/imm-/datasets/dataset/2.16.840.1.113883.2.4.3.11.60.131.1.1/2021-11-18T10:06:34"
* identifier -> "imm-dataelement-135" "IdentificationNumber"
* status -> "imm-dataelement-144" "Status"
* patient -> "imm-dataelement-71" "Patient"
* location -> "imm-dataelement-262" "HealthcareProvider"
* route -> "imm-dataelement-143" "RouteOfAdministration"
* performer[administrator].actor -> "imm-dataelement-163" "HealthcareProvider"
* performer[administrator].actor -> "imm-dataelement-192" "HealthProfessional"
* reasonCode[vaccinationIndication] -> "imm-dataelement-160" "VaccinationIndication"
* reasonCode[vaccinationMotive] -> "imm-dataelement-158" "VaccinationMotive"
* protocolApplied.targetDisease[targetDisease] -> "imm-dataelement-159" "VaccinationPathogen"

Mapping: NlcoreVaccinationevent-to-zib-pharmaceuticalproduct-v2.1.2-2020EN
Id: zib-pharmaceuticalproduct-v2.1.2-2020EN
Title: "zib PharmaceuticalProduct-v2.1.2(2020EN)"
Source: NlcoreVaccinationevent
Target: "https://zibs.nl/wiki/PharmaceuticalProduct-v2.1.2(2020EN)"
* vaccineCode -> "NL-CM:9.7.19927" "MedicationCode"
