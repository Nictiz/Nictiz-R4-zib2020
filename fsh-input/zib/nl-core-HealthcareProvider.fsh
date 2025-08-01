Profile: NlcoreHealthcareProvider
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider
Id: nl-core-HealthcareProvider
Title: "nl core HealthcareProvider"
* insert ProfileMetadata(nl-core-HealthcareProvider)
* insert Purpose(HealthcareProvider, 3.4, Location)

* telecom[telephoneNumbers] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactInformation-TelephoneNumbers
* telecom[emailAddresses] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactInformation-EmailAddresses
* address ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AddressInformation
* managingOrganization only Reference(Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
* partOf only Reference(Location or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider)

// Short, alias, definition and comment texts
* ^description = "A healthcare provider is an organization that offers and provides medical, paramedic and/or nursing care to patients/clients. Examples include: hospitals, nursing homes, doctor’s offices."
* .
  * ^alias[+] = "nl-core-HealthcareProvider"
  * ^comment = """
    The zib HealthcareProvider is mapped to this Location profile and a profile on Organization (<http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization>). This Location profile acts as the focal resource of the HealthcareProvider because most references to this zib are concerned about the recording of the physical location where the care to patient/client takes place rather than the organizational information. For the latter, the profile on Organization is used which is referenced using the `managingOrganization` element.
    
    Healthcare providers usually consist of multiple organizational levels and physical locations. The hierarchical structure may be captured by using multiple instances of this HealthcareProvider profile using the `Location.partOf` element to refer to their parent Location. Each instance refers the nl-core-HealthcareProvider-Organization at the appropriate level in the hierarchy. 
    
    In consultation with 'Registratie aan de Bron', it is agreed to not include the zib concept LocationNumber (NL-CM:17.2.10) due to several reasons. Firstly, its use in the Dutch realm is unclear as this concept was initiated for the Belgium realm with specific requirements. Secondly, it cannot be mapped neatly in the FHIR model which would require the use of an extension. To avoid implementation of specific and not-used FHIR requirements, it is advised to create and use an extension at the use case level where this concept is deemed necessary.
    """
