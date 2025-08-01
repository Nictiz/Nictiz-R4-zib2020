Profile: NlbaseHealthProfessionalPractitioner
Parent: Practitioner
Id: nl-base-HealthProfessional-Practitioner
Title: "nl base HealthProfessional Practitioner"
* insert ProfileMetadata(nl-base-HealthProfessional-Practitioner)
* insert Purpose(HealthProfessional, 3.5, Practitioner)

* identifier insert Discriminator(value, $this)
* identifier contains
    big 0.. and
    uzi 0.. and
    agb 0..
* identifier[big] ^patternIdentifier.system = "http://fhir.nl/fhir/NamingSystem/big"
* identifier[uzi] ^patternIdentifier.system = "http://fhir.nl/fhir/NamingSystem/uzi-nr-pers"
* identifier[agb] ^patternIdentifier.system = "http://fhir.nl/fhir/NamingSystem/agb-z"
* name insert Discriminator(value, use)
* name contains
    nameInformation 0..2 and
    nameInformation-GivenName 0..
* name[nameInformation] only HumanName
* name[nameInformation] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-NameInformation
* name[nameInformation-GivenName] only HumanName
* name[nameInformation-GivenName] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-NameInformation.GivenName
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
* gender insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/GeslachtCodelijst-to-AdministrativeGender, GeslachtCodelijst-to-AdministrativeGender, AdministrativeGender. This ConceptMap is based on GeslachtCodelijst as defined in the zib Patient to avoid duplication of ConceptMaps. The GeslachtCodelijst of Patient and HealthProfessional are identical in terms of codes)
* gender.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification named genderCodelist 0..*
* gender.extension[genderCodelist].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.17.1.8--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "A health professional is a person who is authorized to perform actions in the field of individual healthcare."
* .
  * ^short = "HealthProfessional"
  * ^alias[+] = "Zorgverlener"
  * ^definition = "A health professional is a person who is authorized to perform actions in the field of individual healthcare."
  * ^comment = """
    The zib HealthProfessional is mapped for all but one concept (HealthProfessionalRole) to this Practitioner profile and a profile on PractitionerRole (<http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole>). The PractitionerRole resource covers the recording of the location and types of services that HealthProfessionals are able to provide for a HealthcareProvider. The zib concepts Specialty and HealthcareProvider are therefore mapped onto PractitionerRole.
    
    Although the zib concept name HealthProfessionalRole superficially seems to match the PractitionerRole resource, this is not the case based on the definition and values of that concept. In FHIR, the role that a HealthProfessional fulfills is captured as part of the clinical resource for that specific case, for example in the `Procedure.performer.role` element. This prevents the creation of duplicate HealthProfessional instances for each clinical situation where the HealthProfessional performs a different role in the process.
    """
* identifier
  * ^short = "HealthProfessionalIdentificationNumber"
  * ^alias[+] = "ZorgverlenerIdentificatienummer"
  * ^definition = """
    The healthcare provider identification number is a number that uniquely identifies the healthcare provider. 
                            
    The following numbers are used in the Netherlands: 
    1. UZI Health Professionals. Identification of health professionals (people) in the Dutch healthcare industry. 
    2. VEKTIS AGB-Z. Identifies health professionals and healthcare organizations 
    3. BIG-ID. The ID of the health professional listed in the BIG Register. 
                            
    This information is not readily available for foreign health professionals.
    """
* name
  * ^short = "NameInformation"
  * ^alias[+] = "Naamgegevens"
  * ^definition = "Health professional’s full name. If a health professional identification number is entered, it will be the name as listed in UZI, AGB or by the healthcare center."
* telecom
  * ^short = "ContactInformation"
  * ^alias[+] = "Contactgegevens"
  * ^definition = "Health professional’s telephone number(s) or e-mail address(es)."
  * ^comment = "The cardinality mismatch between the zib (`0..1`) and FHIR (`0..*`) is explained by the containers TelephoneNumbers (`0..*`) and EmailAddresses (`0..*`) inside the ContactInformation model. The FHIR datatype ContactPoint does not have these containers."
* address ^definition = "Health professional’s address information."
* gender
  * ^short = "Gender"
  * ^alias[+] = "Geslacht"
  * ^definition = "Patient’s administrative gender."

Mapping: NlbaseHealthProfessionalPractitioner-to-zib-healthprofessional-v3.5-2020EN
Id: zib-healthprofessional-v3.5-2020EN
Title: "zib HealthProfessional-v3.5(2020EN)"
Source: NlbaseHealthProfessionalPractitioner
Target: "https://zibs.nl/wiki/HealthProfessional-v3.5(2020EN)"
*  -> "NL-CM:17.1.1" "HealthProfessional"
* identifier -> "NL-CM:17.1.2" "HealthProfessionalIdentificationNumber"
* name -> "NL-CM:17.1.3" "NameInformation"
* telecom -> "NL-CM:17.1.8" "ContactInformation"
* address -> "NL-CM:17.1.7" "AddressInformation"
* gender -> "NL-CM:17.1.9" "Gender"

Mapping: NlbaseHealthProfessionalPractitioner-to-zib-contactinformation-v1.2-2020EN
Id: zib-contactinformation-v1.2-2020EN
Title: "zib ContactInformation-v1.2(2020EN)"
Source: NlbaseHealthProfessionalPractitioner
Target: "https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)"
* telecom -> "NL-CM:20.6.1" "ContactInformation"
