Profile: NlbaseHealthcareProvider
Parent: Location
Id: nl-base-HealthcareProvider
Title: "nl base HealthcareProvider"
* insert ProfileMetadata(nl-base-HealthcareProvider)
* insert Purpose(HealthcareProvider, 3.4, Location)

* telecom insert Discriminator(profile, $this)
* telecom contains
    telephoneNumbers 0.. and
    emailAddresses 0..
* telecom[telephoneNumbers] only ContactPoint
* telecom[telephoneNumbers] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-TelephoneNumbers
* telecom[emailAddresses] only ContactPoint
* telecom[emailAddresses] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactInformation-EmailAddresses
* address only Address
* address ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AddressInformation
* managingOrganization only Reference(http://hl7.org/fhir/StructureDefinition/Organization or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider-Organization)

// Short, alias, definition and comment texts
* ^description = "A healthcare provider is an organization that offers and provides medical, paramedic and/or nursing care to patients/clients. Examples include: hospitals, nursing homes, doctor’s offices."
* .
  * ^short = "HealthcareProvider / OrganizationLocation"
  * ^alias[+] = "OrganisatieLocatie"
  * ^alias[+] = "Zorgaanbieder"
  * ^comment = """
    The zib HealthcareProvider is mapped to this Location profile and a profile on Organization (<http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider-Organization>). This Location profile acts as the focal resource of the HealthcareProvider because most references to this zib are concerned about the recording of the physical location where the care to patient/client takes place rather than the organizational information. For the latter, the profile on Organization is used which is referenced using the `managingOrganization` element.
    
    Healthcare providers usually consist of multiple organizational levels and physical locations. The hierarchical structure may be captured by using multiple instances of this HealthcareProvider profile using the `Location.partOf` element to refer to their parent Location. Each instance refers the nl-base-HealthcareProvider-Organization at the appropriate level in the hierarchy. 
    
    In consultation with 'Registratie aan de Bron', it is agreed to not include the zib concept LocationNumber (NL-CM:17.2.10) due to several reasons. Firstly, its use in the Dutch realm is unclear as this concept was initiated for the Belgium realm with specific requirements. Secondly, it cannot be mapped neatly in the FHIR model which would require the use of an extension. To avoid implementation of specific and not-used FHIR requirements, it is advised to create and use an extension at the use case level where this concept is deemed necessary.
    """
* name
  * ^short = "LocationName"
  * ^alias[+] = "LocatieNaam"
  * ^definition = "Name of the location."
* telecom
  * ^short = "ContactInformation"
  * ^alias[+] = "Contactgegevens"
  * ^definition = "The information needed to contact the healthcare organization via telephone and/or e-mail."
  * ^comment = "The cardinality mismatch between the zib (`0..1`) and FHIR (`0..*`) is explained by the containers TelephoneNumbers (`0..*`) and EmailAddresses (`0..*`) inside the ContactInformation model. The FHIR datatype ContactPoint does not have these containers."
* address
  * ^definition = "The physical address of the healthcare provider’s location."
  * ^comment = "The cardinality mismatch with the zib (`0..1` versus `0..*`) is explained by the restriction of FHIR to limit the `Location.address` to a physical address while the zib allows for other types of addresses (e.g. a postal address). Other types of addresses than a physical address are given in `Organization.address` which is referenced by `Location.managingOrganization`."

Mapping: NlbaseHealthcareProvider-to-zib-healthcareprovider-v3.4-2020EN
Id: zib-healthcareprovider-v3.4-2020EN
Title: "zib HealthcareProvider-v3.4(2020EN)"
Source: NlbaseHealthcareProvider
Target: "https://zibs.nl/wiki/HealthcareProvider-v3.4(2020EN)"
*  -> "NL-CM:17.2.1" "HealthcareProvider"
*  -> "NL-CM:17.2.9" "OrganizationLocation"
* name -> "NL-CM:17.2.8" "LocationName"
* telecom -> "NL-CM:17.2.6" "ContactInformation"
* address -> "NL-CM:17.2.5" "AddressInformation"

Mapping: NlbaseHealthcareProvider-to-zib-contactinformation-v1.2-2020EN
Id: zib-contactinformation-v1.2-2020EN
Title: "zib ContactInformation-v1.2(2020EN)"
Source: NlbaseHealthcareProvider
Target: "https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)"
* telecom -> "NL-CM:20.6.1" "ContactInformation"
