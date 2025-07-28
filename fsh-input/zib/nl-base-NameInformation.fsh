Profile: NlbaseNameInformation
Parent: HumanName
Id: nl-base-NameInformation
Title: "nl base NameInformation"
* insert ProfileMetadata(nl-base-NameInformation)
* ^purpose = "This HumanName datatype represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) NameInformation v1.1 (2020)](https://zibs.nl/wiki/NameInformation-v1.1(2020EN)), except for the GivenName concept.

For the entire zib, the complementary profile [zib-NameInformation.GivenName](http://nictiz.nl/fhir/StructureDefinition/zib-NameInformation.GivenName) should be used. Both profiles can be added in a slice with the discriminator set to `value`/`use`."

* . obeys zib-NameInformation-1 and zib-NameInformation-2
* extension contains
    http://hl7.org/fhir/StructureDefinition/humanname-assembly-order named nameUsage 0..1
* extension[nameUsage].value[x] insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/NaamgebruikCodelijst-to-HumanNameAssemblyOrder)
* extension[nameUsage].value[x] from http://hl7.org/fhir/ValueSet/name-assembly-order|4.0.1 (preferred)
* family.extension contains
    http://hl7.org/fhir/StructureDefinition/humanname-own-prefix named prefix 0..* and
    http://hl7.org/fhir/StructureDefinition/humanname-own-name named lastName 0..* and
    http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix named partnerPrefix 0..* and
    http://hl7.org/fhir/StructureDefinition/humanname-partner-name named partnerLastName 0..*
* given.extension contains
    http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier named givenOrInitial 0..*

// Short, alias, definition and comment texts
* ^description = "A person's official name information, including given names, last name and possibly the partner's last name."
* .
  * ^short = "NameInformation"
  * ^alias[+] = "Naamgegevens"
  * ^definition = "This slice represents the person's official name information, including given names, last name and possibly the partner's last name."
  * ^comment = """
    This `.name` element represents a Dutch name according to the [zib NameInformation v1.1 (2020)](https://zibs.nl/wiki/NameInformation-v1.1(2020EN)) (except for the GivenName concept).
    
    **Note 1**: The zib cannot be represented straightforward in FHIR. Especially note the guidance on `.given` on how to map the FirstNames and Initials concepts, and on `.prefix`/`.suffix` on how to map the Titles concept.
    
    **Note 2**: This element should only contain a person's _official_ names. The GivenName concept is represented in another `.name` element with `.name.use` = _usual_.
    """
* extension[nameUsage].value[x]
  * ^short = "NameUsage"
  * ^alias[+] = "Naamgebruik"
  * ^definition = "This concept indicates the last name or order of last names with which the person is to be addressed."
* family.extension[prefix].value[x]
  * ^short = "Prefix"
  * ^alias[+] = "Voorvoegsels"
  * ^definition = "Prefix to the person’s own last name."
* family.extension[lastName].value[x]
  * ^short = "LastName"
  * ^alias[+] = "Achternaam"
  * ^definition = "The person’s official last name"
* family.extension[partnerPrefix].value[x]
  * ^short = "PartnerPrefix"
  * ^alias[+] = "VoorvoegselsPartner"
  * ^definition = "Prefix to the partner’s last name."
* family.extension[partnerLastName].value[x]
  * ^short = "PartnerLastName"
  * ^alias[+] = "AchternaamPartner"
  * ^definition = "Partner’s official last name."
* given
  * ^short = "FirstName / Initial"
  * ^alias[+] = "Voornaam"
  * ^alias[+] = "Initiaal"
  * ^definition = "One of a person’s official first names or the initial if the full name is not known."
  * ^comment = """
    This element represents the FirstNames and Initials concepts of zib NameInformation, but the FHIR implementation deviates from the zib model. The zib defines these concepts as a list of official first names (as a single string) and a list of initials (as a single string), both optional. They both represent the official name(s) of a person and thus represent the same concept. In FHIR however, each first name is either a complete name or an initial, but not both. In addition, each name may be defined separately.
    
    Therefore, the zib concepts are implemented here in the following way:
    
    * Systems SHOULD use a `.given` element for each official first name that they know of (either as a full name or an initial), in order of appearance (as specified by FHIR).
    * Each of these elements:
      * SHOULD be populated with the complete name if it is known, or with the initial if no more information is available.
      * SHALL be augmented with `extension:givenOrInitial` with code _BR_ when it represents a full name or code _IN_ when it represents an initial.
    
    Initials should thus not be communicated for each complete first name that is known, in contrast to what is specified by the zib. Receiving systems can recreate initials from the full names if needed.
    
    If a system _does_ however only have a list of official first names and a separate list of official initials, without knowing the relationship between these two, only the full names SHOULD be communicated, while an additional `.name` instance MAY be used to communicate the initials. It is expected that the second instance just contains the initials and no other information from the zib. Receiving systems MAY ignore the second instance.
    
    **Note 1:** The GivenName concept should not be included here but in a separate `.name` instance where `.use` = _usual_.
    
    **Note 2**: As specified by FHIR, multiple official first names MAY be combined in a single `.given` element (separated by spaces), as long as the `.given` elements can be concatenated to form the full first name representation, and the 'extension:givenOrInitial` is used to mark the element as containing either full names or the initials. This pattern is strongly discouraged as it is hard to determine if the value pertains multiple names or a single combined name containing spaces.
    """
* prefix
  * ^short = "Titles"
  * ^alias[+] = "Titels"
  * ^definition = "Noble and scientific titles. These can assist in formulating oral and formal addresing titles."
  * ^comment = """
    The zib concept 'titles' is mapped to elements `HumanName.prefix` and `HumanName.suffix`. Semantically this mapping is not complete: the zib uses a single concept that contains all the required information about noble and scientific titles, while FHIR captures the same information in a structured way.
    
    **Export:**
    
    Systems are expected to transform as much as possible to the FHIR datamodel and thereby to be as explicit as possible. Note that in order to mark the type of a prefix, you can use the FHIR standard extension for ISO 21090 EN Qualifiers. Examples include the use of the qualifier _HON_ to indicate honorific prefixes and _AC_ for academic prefixes.
    
    If it is not possible to breakup the zib concept titles to positioned prefixes and suffixes, the prefix element is used to store all information.
    
    **Import:**
    
    Systems need to expect and be resilient for a broader range of information stored in the prefix element than stated by it's definition.
    """
* suffix
  * ^short = "Titles"
  * ^alias[+] = "Titels"
  * ^definition = "Noble and scientific titles. These can assist in formulating oral and formal addresing titles."
  * ^comment = """
    The zib concept 'titles' is mapped to elements `HumanName.prefix` and `HumanName.suffix`. Semantically this mapping is not complete: the zib uses a single concept that contains all the required information about noble and scientific titles, while FHIR captures the same information in a structured way.
    
    **Export:**
    
    Systems are expected to transform as much as possible to the FHIR datamodel and thereby to be as explicit as possible. Note that in order to mark the type of a prefix, you can use the FHIR standard extension for ISO 21090 EN Qualifiers. Examples include the use of the qualifier _HON_ to indicate honorific prefixes and _AC_ for academic prefixes.
    
    If it is not possible to breakup the zib concept titles to positioned prefixes and suffixes, the prefix element is used to store all information.
    
    **Import:**
    
    Systems need to expect and be resilient for a broader range of information stored in the prefix element than stated by it's definition.
    """

Invariant: zib-NameInformation-1
Description: "If a prefix for a family name is specified, the family name is expected as well"
Severity: #error
Expression: "family.extension('http://hl7.org/fhir/StructureDefinition/humanname-own-prefix').empty().not() implies family.extension('http://hl7.org/fhir/StructureDefinition/humanname-own-name').empty().not()"

Invariant: zib-NameInformation-2
Description: "If the prefix for a partner family name is specified, the partner family name is expected as well"
Severity: #error
Expression: "family.extension('http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix').empty().not() implies family.extension('http://hl7.org/fhir/StructureDefinition/humanname-partner-name').empty().not()"

Mapping: NlbaseNameInformation-to-zib-nameinformation-v1.1-2020EN
Id: zib-nameinformation-v1.1-2020EN
Title: "zib NameInformation-v1.1(2020EN)"
Source: NlbaseNameInformation
Target: "https://zibs.nl/wiki/NameInformation-v1.1(2020EN)"
*  -> "NL-CM:20.4.1" "NameInformation"
* extension[nameUsage].value[x] -> "NL-CM:20.4.7" "NameUsage"
* family.extension[prefix].value[x] -> "NL-CM:20.4.11" "Prefix"
* family.extension[lastName].value[x] -> "NL-CM:20.4.10" "LastName"
* family.extension[partnerPrefix].value[x] -> "NL-CM:20.4.9" "PartnerPrefix"
* family.extension[partnerLastName].value[x] -> "NL-CM:20.4.8" "PartnerLastName"
* given -> "NL-CM:20.4.4" "FirstNames"
* given -> "NL-CM:20.4.5" "Initials"
* prefix -> "NL-CM:20.4.12" "Titles"
* suffix -> "NL-CM:20.4.12" "Titles"
