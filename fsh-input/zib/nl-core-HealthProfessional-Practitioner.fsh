Profile: NlcoreHealthProfessionalPractitioner
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner
Id: nl-core-HealthProfessional-Practitioner
Title: "nl core HealthProfessional Practitioner"
* insert ProfileMetadata(nl-core-HealthProfessional-Practitioner)
* insert Purpose(HealthProfessional, 3.5, Practitioner)

* name[nameInformation] ..2
* gender from http://hl7.org/fhir/ValueSet/administrative-gender|4.0.1 (required)
* gender.extension[genderCodelist].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.17.1.8--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "A health professional is a person who is authorized to perform actions in the field of individual healthcare."
* .
  * ^alias[+] = "nl-core-HealthProfessional-Practitioner"
  * ^comment = """
    The zib HealthProfessional is mapped for all but one concept (HealthProfessionalRole) to this Practitioner profile and a profile on PractitionerRole (<http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole>). The PractitionerRole resource covers the recording of the location and types of services that HealthProfessionals are able to provide for a HealthcareProvider. The zib concepts Specialty and HealthcareProvider are therefore mapped onto PractitionerRole.
    
    Although the zib concept name HealthProfessionalRole superficially seems to match the PractitionerRole resource, this is not the case based on the definition and values of that concept. In FHIR, the role that a HealthProfessional fulfills is captured as part of the clinical resource for that specific case, for example in the `Procedure.performer.role` element. This prevents the creation of duplicate HealthProfessional instances for each clinical situation where the HealthProfessional performs a different role in the process.
    """
