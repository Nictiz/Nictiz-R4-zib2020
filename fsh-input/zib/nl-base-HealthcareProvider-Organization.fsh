Profile: NlbaseHealthcareProviderOrganization
Parent: Organization
Id: nl-base-HealthcareProvider-Organization
Title: "nl base HealthcareProvider Organization"
* insert ProfileMetadata(nl-base-HealthcareProvider-Organization)
* insert Purpose(HealthcareProvider, 3.4, Organization)

* identifier insert Discriminator(value, $this)
* identifier contains
    ura 0.. and
    agb 0..
* identifier[ura] ^patternIdentifier.system = "http://fhir.nl/fhir/NamingSystem/ura"
* identifier[agb] ^patternIdentifier.system = "http://fhir.nl/fhir/NamingSystem/agb-z"
* type insert Discriminator(value, $this)
* type contains
    departmentSpecialty 0..1 and
    organizationType 0..1
* type[departmentSpecialty] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.17.2.4--20200901000000 (preferred)
* type[organizationType] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.17.2.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "A healthcare provider is an organization that offers and provides medical, paramedic and/or nursing care to patients/clients. Examples include: hospitals, nursing homes, doctor’s offices."
* .
  * ^short = "HealthcareProvider"
  * ^alias[+] = "Zorgaanbieder"
  * ^comment = """
    The zib HealthcareProvider is mapped to this Organization profile and a profile on Location(<http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider>). The Location profile acts as the focal resource of the HealthcareProvider because most references to this zib are concerned about the recording of the physical location where the care to patient/client takes place rather than the organizational information. Often there's no clear distinction between an organizational structure and a physical location. As a rule of thumb, locations are always used for recording where a service occurs, and hence where encounters and observations take place.
    
    Healthcare providers usually consist of multiple organizational levels and physical locations. The hierarchical structure may be captured by using multiple instances of this profile, using the `Organization.partOf` element to refer to their parent organization. The physical location is captured using the nl-base-HealthcareProvider profile, which refers this profile at the appropriate level in the hierarchy.
    """
* identifier
  * ^short = "HealthcareProviderIdentificationNumber"
  * ^alias[+] = "ZorgaanbiederIdentificatienummer"
  * ^definition = "The organization’s identification number. For Dutch healthcare providers, the URA number or the AGB number is used, if possible. Depending on the context other ID's are also possible. For foreign or non-affiliated healthcare providers, another unique identification number can be used. This must be accompanied by the name and/or code of the issuing organization."
* type[departmentSpecialty]
  * ^short = "DepartmentSpecialty"
  * ^alias[+] = "AfdelingSpecialisme"
  * ^definition = "The specialty of the healthcare provider’s department. The departmental specialty can be filled in if further indication of the healthcare provider is needed. This refers to the recognized medical specialties as stated in the BIG Act."
* type[organizationType]
  * ^short = "OrganizationType"
  * ^alias[+] = "OrganisatieType"
  * ^definition = "The type of healthcare provider, such as general hospital, or nursing home. If this field is filled in and an AGB code is used for the HealthcareProviderIdentificationNumber, the type must match the type implicitly contained in the AGB code."
* name
  * ^short = "OrganizationName"
  * ^alias[+] = "OrganisatieNaam"
  * ^definition = "Name of the organization. If an identification number is given, the name must match the name that corresponds to the identification number."

Mapping: NlbaseHealthcareProviderOrganization-to-zib-healthcareprovider-v3.4-2020EN
Id: zib-healthcareprovider-v3.4-2020EN
Title: "zib HealthcareProvider-v3.4(2020EN)"
Source: NlbaseHealthcareProviderOrganization
Target: "https://zibs.nl/wiki/HealthcareProvider-v3.4(2020EN)"
*  -> "NL-CM:17.2.1" "HealthcareProvider"
* identifier -> "NL-CM:17.2.2" "HealthcareProviderIdentificationNumber"
* type[departmentSpecialty] -> "NL-CM:17.2.7" "DepartmentSpecialty"
* type[organizationType] -> "NL-CM:17.2.4" "OrganizationType"
* name -> "NL-CM:17.2.3" "OrganizationName"
