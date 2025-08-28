Profile: NlcoreNameInformation
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-NameInformation
Id: nl-core-NameInformation
Title: "nl core NameInformation"
* insert ProfileMetadata(nl-core-NameInformation)
* ^purpose = "This HumanName datatype represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) NameInformation v1.1 (2020)](https://zibs.nl/wiki/NameInformation-v1.1(2020EN)), except for the GivenName concept.

For the entire zib, the complementary profile [zib-NameInformation.GivenName](http://nictiz.nl/fhir/StructureDefinition/zib-NameInformation.GivenName) should be used. Both profiles can be added in a slice with the discriminator set to `value`/`use`."

* . obeys zib-NameInformation-1 and zib-NameInformation-2 and nl-core-NameInformation-01
* extension[nameUsage] ..1
* use 1..
* use = #official
* text ^condition[+] = "nl-core-NameInformation-01"
* family ^condition[+] = "nl-core-NameInformation-01"
* family obeys nl-core-NameInformation-02
* given.extension 1..
* given.extension[givenOrInitial] 1..
* given ^condition[+] = "nl-core-NameInformation-01"

// Short, alias, definition and comment texts
* ^description = "A person's official name information, including given names, last name and possibly the partner's last name."
* .
  * ^alias[+] = "nl-core-NameInformation"
  * ^comment = """
    This `.name` element accomodates the official parts of a Dutch name according to common international usage and optionally to the [zib NameInformation v1.1 (2020)](https://zibs.nl/wiki/NameInformation-v1.1(2020EN)). An official Dutch name is represented in FHIR as an ordinary international name, optionally augmented using extensions to specify how the last name is built up according to the Dutch rules if conformance to the zib is required. See the guidance on `.family` and on `.extension:nameUsage` for more information.
    
    Systems that need to work in a Dutch context SHOULD support the extensions as specified in `.given`, `.family` and `.extension:nameUsage`. In addition, systems SHOULD use the core elements according to the FHIR specifications to provide compatibility outside Dutch contexts. This means that:
    
    * If parts of the name are specified using one or more of the structured elements, the `.text` element SHOULD be populated with a rendered version of the full name.
    * If parts of the family name are specified using the extensions in `.family`, the `.family` element SHOULD be populated with the full family name.
    
    **Note 1**: The zib cannot be represented straightforward in FHIR. Especially note the guidance on `.given` on how to map the FirstNames and Initials concepts, and on `.prefix`/`.suffix` on how to map the Titles concept.
    
    **Note 2**: This element should only contain a person's _official_ names. The GivenName concept is represented in another `.name` element with `.name.use` = _usual_.
    
    **Note 3**: The examples illustrate how the zib is mapped to FHIR.
    """
* text ^comment = """
    A representation of the full name, including given names and the family name.

    When implementing zib NameInformation, this representation should include the FirstNames or Initials and the family name constructed according to the NameUsage concept.
    """
* family ^comment = "When implementing zib NameInformation, this representation should be constructed from the Prefix, LastName, PartnerPrefix and/or PartnerLastName concepts according to the NameUsage concept."
* given ^comment = """
    This element can be used to represent full given names or initials. `extension:givenOrInitial` SHALL be used on each repetition to specify if it's a full name (_BR_) or an initial (_IN_).
    
    ## Zib compatibility
    
    This element is used to represent the FirstNames and Initials concepts of zib NameInformation, but the FHIR implementation deviates from the zib model. The zib defines these concepts as a list of official first names (as a single string) and a list of initials (as a single string), both optional. They both represent the official name(s) of a person and thus represent the same concept. In FHIR however, each first name is either a complete name or an initial, but not both. In addition, each name may be defined separately.
    
    Therefore, the zib concepts are implemented here in the following way:
    
    * Systems SHOULD use a `.given` element for each official first name that they know of (either as a full name or an initial), in order of appearance (as specified by FHIR).
    * Each of these elements:
      * SHOULD be populated with the complete name if it is known, or with the initial if no more information is available.
      * As noted, it SHALL be augmented with `extension:givenOrInitial`.
      
    Initials should thus not be communicated for each complete first name that is known, in contrast to what is specified by the zib. Receiving systems can recreate initials from the full names if needed.
    
    If a system _does_ however only have a list of official first names and a separate list of official initials, without knowing the relationship between these two, only the full names SHOULD be communicated, while an additional `.name` instance MAY be used to communicate the initials. It is expected that the second instance just contains the initials and no other information from the zib. Receiving systems MAY ignore the second instance.
    
    **Note 1:** The GivenName concept should not be included here but in a separate `.name` instance where `.use` = _usual_.
    
    **Note 2**: As specified by FHIR, multiple official first names MAY be combined in a single `.given` element (separated by spaces), as long as the `.given` elements can be concatenated to form the full first name representation, and the 'extension:givenOrInitial` is used to mark the element as containing either full names or the initials. This pattern is strongly discouraged as it is hard to determine if the value pertains multiple names or a single combined name containing spaces.
    """

Invariant: nl-core-NameInformation-01
Description: "If parts of the name are specified using one or more of the structured elements, the `.text` element SHOULD be populated with a rendered version of the full name. This ensures compatibility with common FHIR usage."
Severity: #warning
Expression: "(family.exists() or given.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier').where(value != 'IN').exists()) implies text.hasValue()"

Invariant: nl-core-NameInformation-02
Description: "If parts of the family name are specified using the extensions in .family, the .family element SHOULD be populated with the full family name as well. This ensures compatibility with common FHIR usage."
Severity: #warning
Expression: "(extension('http://hl7.org/fhir/StructureDefinition/humanname-own-prefix').exists() or extension('http://hl7.org/fhir/StructureDefinition/humanname-own-name').exists() or extension('http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix').exists() or extension('http://hl7.org/fhir/StructureDefinition/humanname-partner-name').exists()) implies $this.hasValue()"

Mapping: NlcoreNameInformation-to-zib-nameinformation-v1.1-2020EN
Id: zib-nameinformation-v1.1-2020EN
Title: "zib NameInformation-v1.1(2020EN)"
Source: NlcoreNameInformation
Target: "https://zibs.nl/wiki/NameInformation-v1.1(2020EN)"
* text -> "NL-CM:20.4.4" "FirstNames (implicit, main mapping is on .given)"
* text -> "NL-CM:20.4.5" "Initials (implicit, main mapping is on .given)"
* text -> "NL-CM:20.4.7" "NameUsage (implicit, main mapping is on extension:nameUsage)"
* text -> "NL-CM:20.4.11" "Prefix (implicit, main mapping is on .family.extension:prefix)"
* text -> "NL-CM:20.4.10" "LastName (implicit, main mapping is on .family.extension:lastName)"
* text -> "NL-CM:20.4.9" "PartnerPrefix (implicit, main mapping is on .family.extension:partnerPrefix)"
* text -> "NL-CM:20.4.8" "PartnerLastName (implicit, main mapping is on .family.extension:partnerLastName)"
* family -> "NL-CM:20.4.7" "NameUsage (implicit, main mapping is on extension:nameUsage)"
* family -> "NL-CM:20.4.11" "Prefix (implicit, main mapping is on .family.extension:prefix)"
* family -> "NL-CM:20.4.10" "LastName (implicit, main mapping is on .family.extension:lastName)"
* family -> "NL-CM:20.4.9" "PartnerPrefix (implicit, main mapping is on .family.extension:partnerPrefix)"
* family -> "NL-CM:20.4.8" "PartnerLastName (implicit, main mapping is on .family.extension:partnerLastName)"
