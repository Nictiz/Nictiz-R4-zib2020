Profile: NlbaseHealthProfessionalPractitionerRole
Parent: PractitionerRole
Id: nl-base-HealthProfessional-PractitionerRole
Title: "nl base HealthProfessional PractitionerRole"
* insert ProfileMetadata(nl-base-HealthProfessional-PractitionerRole)
* insert Purpose(HealthProfessional, 3.5, PractitionerRole)

* practitioner only Reference(http://hl7.org/fhir/StructureDefinition/Practitioner or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner)
* organization only Reference(http://hl7.org/fhir/StructureDefinition/Organization or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider-Organization)
* specialty insert Discriminator(value, $this)
* specialty contains
    specialty 0..1
* specialty[specialty] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.22--20200901000000 (preferred)
* telecom insert Discriminator(profile, $this)
* telecom contains
    telephoneNumbers 0.. and
    emailAddresses 0..
* telecom[telephoneNumbers] only ContactPoint
* telecom[telephoneNumbers] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-TelephoneNumbers
* telecom[emailAddresses] only ContactPoint
* telecom[emailAddresses] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-EmailAddresses

// Short, alias, definition and comment texts
* ^description = "A health professional is a person who is authorized to perform actions in the field of individual healthcare."
* .
  * ^short = "HealthProfessional"
  * ^alias[+] = "Zorgverlener"
  * ^definition = "A health professional is a person who is authorized to perform actions in the field of individual healthcare."
  * ^comment = """
    The zib HealthProfessional is mapped for all but one concept (HealthProfessionalRole) to a profile on Practitioner (<http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner>) and this PractitionerRole profile. The PractitionerRole resource covers the recording of the location and types of services that HealthProfessionals are able to provide for a HealthcareProvider. The zib concepts Specialty and HealthcareProvider are therefore mapped onto PractitionerRole.
    
    Although the zib concept name HealthProfessionalRole superficially seems to match the PractitionerRole resource, this is not the case based on the definition and values of that concept. In FHIR, the role that a HealthProfessional fulfills is captured as part of the clinical resource for that specific case, for example in the `Procedure.performer.role` element. This prevents the creation of duplicate HealthProfessional instances for each clinical situation where the HealthProfessional performs a different role in the process.
    """
* organization
  * ^short = "HealthcareProvider"
  * ^alias[+] = "Zorgaanbieder"
  * ^definition = "The organization the health professional works for."
  * ^comment = """
    A HealthcareProvider in zib terms is primarily a location where care is provided, and so the zib concept HealthcareProvider (NL-CM:17.1.6) would normally be fulfilled using a reference to a Location resource (profile nl-base-HealthcareProvider). However, this particular context refers to the organizational aspects of a HealthcareProvider rather than its physical location:
    * the zib concept name is not preceded by a role indicator of the zib (like Location::HealthcareProvider, concept id NL-CM:14.1.5, in the zib Procedure).
    * the `PractitionerRole.location` cardinality (`0..*`) does not match the zib concept (`0..1`) and restricting it is not correct as a health professional could be working on multiple locations.
    
    Therefore, this concept is fulfilled using a reference to the Organization resource (profile nl-base-HealthcareProvider-Organization) and mapped onto `PractitionerRole.organization` instead of `PractitionerRole.location`.
    """
* specialty[specialty]
  * ^short = "Specialty"
  * ^alias[+] = "Specialisme"
  * ^definition = "Health professional’s medical specialty. This refers to the recognized medical specialties as stated in the BIG Act. For example general practitioner or cardiologist."
  * ^comment = "The zib concept Specialty is mapped to a slice on the `.specialty` element instead of the element itself so that other terminology can be used next to the terminology required by the zib."
* telecom
  * ^short = "ContactInformation"
  * ^alias[+] = "Contactgegevens"
  * ^definition = "Health professional’s telephone number(s) or e-mail address(es) that are specific to the role/location/service."
  * ^comment = "The cardinality mismatch between the zib (`0..1`) and FHIR (`0..*`) is explained by the containers TelephoneNumbers (`0..*`) and EmailAddresses (`0..*`) inside the ContactInformation model. The FHIR datatype ContactPoint does not have these containers."

Mapping: NlbaseHealthProfessionalPractitionerRole-to-zib-healthprofessional-v3.5-2020EN
Id: zib-healthprofessional-v3.5-2020EN
Title: "zib HealthProfessional-v3.5(2020EN)"
Source: NlbaseHealthProfessionalPractitionerRole
Target: "https://zibs.nl/wiki/HealthProfessional-v3.5(2020EN)"
*  -> "NL-CM:17.1.1" "HealthProfessional"
* organization -> "NL-CM:17.1.6" "HealthcareProvider"
* specialty[specialty] -> "NL-CM:17.1.4" "Specialty"
* telecom -> "NL-CM:17.1.8" "ContactInformation"

Mapping: NlbaseHealthProfessionalPractitionerRole-to-zib-contactinformation-v1.2-2020EN
Id: zib-contactinformation-v1.2-2020EN
Title: "zib ContactInformation-v1.2(2020EN)"
Source: NlbaseHealthProfessionalPractitionerRole
Target: "https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)"
* telecom -> "NL-CM:20.6.1" "ContactInformation"
