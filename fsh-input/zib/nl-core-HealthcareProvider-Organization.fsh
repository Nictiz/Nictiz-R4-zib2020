Profile: NlcoreHealthcareProviderOrganization
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider-Organization
Id: nl-core-HealthcareProvider-Organization
Title: "nl core HealthcareProvider Organization"
* insert ProfileMetadata(nl-core-HealthcareProvider-Organization)
* insert Purpose(HealthcareProvider, 3.4, Organization)

* type[departmentSpecialty] ..1
* type[departmentSpecialty] ^binding.strength = #required
* type[organizationType] ..1
* type[organizationType] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "A healthcare provider is an organization that offers and provides medical, paramedic and/or nursing care to patients/clients. Examples include: hospitals, nursing homes, doctor’s offices."
* .
  * ^alias[+] = "nl-core-HealthcareProvider-Organization"
  * ^comment = """
    The zib HealthcareProvider is mapped to this Organization profile and a profile on Location(<http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider>). The Location profile acts as the focal resource of the HealthcareProvider because most references to this zib are concerned about the recording of the physical location where the care to patient/client takes place rather than the organizational information. Often there's no clear distinction between an organizational structure and a physical location. As a rule of thumb, locations are always used for recording where a service occurs, and hence where encounters and observations take place.
    
    Healthcare providers usually consist of multiple organizational levels and physical locations. The hierarchical structure may be captured by using multiple instances of this profile, using the `Organization.partOf` element to refer to their parent organization. The physical location is captured using the nl-core-HealthcareProvider profile, which refers this profile at the appropriate level in the hierarchy.
    """
