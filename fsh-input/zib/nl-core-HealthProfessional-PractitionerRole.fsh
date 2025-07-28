Profile: NlcoreHealthProfessionalPractitionerRole
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole
Id: nl-core-HealthProfessional-PractitionerRole
Title: "nl core HealthProfessional PractitionerRole"
* insert ProfileMetadata(nl-core-HealthProfessional-PractitionerRole)
* insert Purpose(HealthProfessional, 3.5, PractitionerRole)

* practitioner only Reference(http://hl7.org/fhir/StructureDefinition/Practitioner or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)
* organization only Reference(http://hl7.org/fhir/StructureDefinition/Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
* specialty[specialty] ..1
* specialty[specialty] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.22--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "A health professional is a person who is authorized to perform actions in the field of individual healthcare."
* .
  * ^alias[+] = "nl-core-HealthProfessional-PractitionerRole"
  * ^comment = """
    The zib HealthProfessional is mapped for all but one concept (HealthProfessionalRole) to a profile on Practitioner (<http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner>) and this PractitionerRole profile. The PractitionerRole resource covers the recording of the location and types of services that HealthProfessionals are able to provide for a HealthcareProvider. The zib concepts Specialty and HealthcareProvider are therefore mapped onto PractitionerRole.
    
    Although the zib concept name HealthProfessionalRole superficially seems to match the PractitionerRole resource, this is not the case based on the definition and values of that concept. In FHIR, the role that a HealthProfessional fulfills is captured as part of the clinical resource for that specific case, for example in the `Procedure.performer.role` element. This prevents the creation of duplicate HealthProfessional instances for each clinical situation where the HealthProfessional performs a different role in the process.
    """
* organization ^comment = """
    A HealthcareProvider in zib terms is primarily a location where care is provided, and so the zib concept HealthcareProvider (NL-CM:17.1.6) would normally be fulfilled using a reference to a Location resource (profile nl-core-HealthcareProvider). However, this particular context refers to the organizational aspects of a HealthcareProvider rather than its physical location:
    * the zib concept name is not preceded by a role indicator of the zib (like Location::HealthcareProvider, concept id NL-CM:14.1.5, in the zib Procedure).
    * the `PractitionerRole.location` cardinality (`0..*`) does not match the zib concept (`0..1`) and restricting it is not correct as a health professional could be working on multiple locations.
    
    Therefore, this concept is fulfilled using a reference to the Organization resource (profile nl-core-HealthcareProvider-Organization) and mapped onto `PractitionerRole.organization` instead of `PractitionerRole.location`.
    """
