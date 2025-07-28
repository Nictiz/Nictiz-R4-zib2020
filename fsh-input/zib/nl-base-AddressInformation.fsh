Profile: NlbaseAddressInformation
Parent: Address
Id: nl-base-AddressInformation
Title: "nl base AddressInformation"
* insert ProfileMetadata(nl-base-AddressInformation)
* ^purpose = "This Address datatype represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) AddressInformation v1.1 (2020)](https://zibs.nl/wiki/AddressInformation-v1.1(2020EN))."

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-AddressInformation.AddressType named addressType 0..1
* use insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/AdresSoortCodelijst-to-AddressUse)
* use from http://hl7.org/fhir/ValueSet/address-use|4.0.1 (required)
* type insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/AdresSoortCodelijst-to-AddressType)
* type from http://hl7.org/fhir/ValueSet/address-type|4.0.1 (required)
* line.extension contains
    http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName named streetName 0..1 and
    http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber named houseNumber 0..1 and
    http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix named houseNumberLetter-houseNumberAddition 0..1 and
    http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator named houseNumberIndication 0..1 and
    http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID named additionalInformation 0..1
* line.extension[houseNumberIndication].value[x] obeys houseNumberIndication
* country.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification named countryCode 0..1
* country.extension[countryCode].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.10--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Address information includes data where a person resides (temporarily, permanently) or where a building is located."
* .
  * ^short = "AddressInformation"
  * ^alias[+] = "Adresgegevens"
  * ^comment = """
    This datatype defines a common basis for expressing all addresses around the world, but adds extensions to express Dutch addresses specifically, according to the [zib AddressInformation v1.1 (2020)](https://zibs.nl/wiki/AddressInformation-v1.1(2020EN)). A Dutch Address still is a proper FHIR Address, which means that systems that cannot interpret the extensions will still be able to render and work with this datatype.
    
    To have true compatibility an implementer SHOULD use the core Address parts as intended. To have addresses work for Dutch context, the implementer SHOULD in addition use the extension elements.
    
    **Separate address parts**
    
    The first addition is that Dutch addresses make certain address parts separately communicable. These parts are required for use in true Dutch systems when dealing with Dutch addresses, but may not have value for international systems when information gets sent abroad.
    
    **Custom address types**
    
    The second addition is that the zib defines its own ValueSet for address types, which can only be partially expressed using the FHIR Address datatype and requires a mapping to multiple elements. The table below explains how the zib concepts are mapped to the various FHIR elements (see the ConceptMaps <http://nictiz.nl/fhir/ConceptMap/AdresSoortCodelijst-to-AddressUse> and <http://nictiz.nl/fhir/ConceptMap/AdresSoortCodelijst-to-AddressType> as well). The code from the zib should also be included using the extension on `Address.extension:addressType`.
    
    | zib                               | .ext:addressType | .use | .type    |
    |-----------------------------------|------------------|------|----------|
    | Postal Address/Postadres          | PST              |      | postal   |
    | Primary Home/Officieel adres      | HP               | home | both     |
    | Visit Address/Woon-/verblijfadres | PHYS             | home | physical |
    | Temporary Address/Tijdelijk adres | TMP              | temp |          |
    | Work Place/Werkadres              | WP               | work |          |
    | Vacation Home/Vakantie adres      | HV               | temp |          |
    
    If `Address.type` is _both_ then this is to be understood as a dual purpose address (postal and physical), unless a specific _postal_ type address is added. Systems that support importing it like this are encouraged to do so, otherwise they may need to import this as two separate addresses.
    
    Note: FHIR core defines the AD-use extension to further specify the postal address type. However, the ValueSet used in that extension doesn't completely match the zib ValueSet. Therefore, a custom extension has been made. This doesn't preclude the use of the AD-use extension.
    """
* use
  * ^short = "AddressType"
  * ^alias[+] = "AdresSoort"
  * ^definition = "The type of address in question, such as a home address or mailing address."
* type
  * ^short = "AddressType"
  * ^alias[+] = "AdresSoort"
  * ^definition = "The type of address in question, such as a home address or mailing address."
* line ^comment = """
    The mapping of zib AddressInformation on the FHIR Address datatype is the result of compatibility with HL7v3, which is the format that a lot of healthcare data in the Netherlands is stored in.
    
    The elements of Address stored in the address-part extensions will be ignored by applications that do not support them, so any information in them should also be duplicated in the `Address.line` to which they are attached. The value of `Address.line` should be populated with a complete string representation of all the separate extension values, like: \"[Street] [HouseNumberIndication] [HouseNumber] [HouseNumberLetter] [HouseNumberAddition]\".
    """
* line.extension[streetName].value[x]
  * ^short = "Street"
  * ^alias[+] = "Straat"
  * ^definition = "Street name of the address."
* line.extension[houseNumber].value[x]
  * ^short = "HouseNumber"
  * ^alias[+] = "Huisnummer"
  * ^definition = "House number of the address."
* line.extension[houseNumberLetter-houseNumberAddition].value[x]
  * ^short = "HouseNumberLetter / HouseNumberAddition"
  * ^alias[+] = "Huisnummerletter"
  * ^alias[+] = "Huisnummertoevoeging"
  * ^definition = """
    Export:
    
    - If a HouseNumberLetter as well as a HouseNumberAddition is known: HouseNumberLetter first, followed by a space and finally the HouseNumberAddition.
    - If only a HouseNumberLetter is known, send just that. No trailing space is required.
    - If only a HouseNumberAddition is known, communicate that with a leading space.
    
    Import
    
    - If the value of buildingNumberSuffix contains no space, then the whole value is considered to be the HouseNumberLetter.
    - If the value of buildingNumberSuffix contains a space, then everything before the first space is considered to be the HouseNumberLetter, and the everything trailing the first space is considered to be the HouseNumberAddition.
    
    Note: While a leading space is allowed in string values in FHIR, the parsing of such space cannot be guaranteed in XML representations. Although aware of this issue, this mapping is not changed because of compatibility reasons. If an implementer cannot parse a leading space, the practical risk of mapping a HouseNumberIndication to a HouseNumberAddition is deemed insignificant.
    """
* line.extension[houseNumberIndication].value[x]
  * ^short = "HouseNumberIndication"
  * ^alias[+] = "AanduidingBijNummer"
  * ^definition = "The indication used for addresses which do not consist of the usual street name and house number."
  * ^comment = "The mapping of zib AddressInformation on the FHIR Address datatype is the result of compatibility with HL7v3, which is the format that a lot of healthcare data in the Netherlands is stored in. As a result of this, the coded zib HouseNumberIndication concept (CD datatype) is mapped to a FHIR string datatype with a constraint added (the value can only be 'by' or 'to')."
* line.extension[additionalInformation].value[x]
  * ^short = "AdditionalInformation"
  * ^alias[+] = "AdditioneleInformatie"
  * ^definition = "Extra information such as the building name, building number, entrance, route number."
* city
  * ^short = "PlaceOfResidence"
  * ^alias[+] = "Woonplaats"
  * ^definition = "A geographically determined area which forms part of the municipal area. For Dutch places of residence, preferably use the name from the GBA, table 33 (OID: 2.16.840.1.113883.2.4.6.14)."
* district
  * ^short = "Municipality"
  * ^alias[+] = "Gemeente"
  * ^definition = "Municipality of residence. For Dutch municipalities, preferably use the name from the GBA, table 33 (OID: 2.16.840.1.113883.2.4.6.14)."
* postalCode
  * ^short = "Postcode"
  * ^alias[+] = "Postcode"
  * ^definition = "Postcode of the address. In Dutch addresses, preferably use the postcode from the Postcode table (OID: 2.16.840.1.113883.2.4.4.15)."
* country ^comment = "The FHIR datatype does not properly support coding the country using a CodeableConcept or Coding datatype. If the sender supports coded countries, it SHALL send the coded value using the ext-CodeSpecification extension under `Address.country.extension:countryCode`."
* country.extension[countryCode].value[x]
  * ^short = "Country"
  * ^alias[+] = "Land"
  * ^definition = "Country in which the address is located."

Invariant: houseNumberIndication
Description: "Must have value 'by' or 'to'"
Severity: #error
Expression: "$this in ('by' | 'to')"

Mapping: NlbaseAddressInformation-to-zib-addressinformation-v1.1-2020EN
Id: zib-addressinformation-v1.1-2020EN
Title: "zib AddressInformation-v1.1(2020EN)"
Source: NlbaseAddressInformation
Target: "https://zibs.nl/wiki/AddressInformation-v1.1(2020EN)"
*  -> "NL-CM:20.5.1" "AddressInformation"
* use -> "NL-CM:20.5.8" "AddressType"
* type -> "NL-CM:20.5.8" "AddressType"
* line.extension[streetName].value[x] -> "NL-CM:20.5.2" "Street"
* line.extension[houseNumber].value[x] -> "NL-CM:20.5.12" "HouseNumber"
* line.extension[houseNumberLetter-houseNumberAddition].value[x] -> "NL-CM:20.5.11" "HouseNumberLetter"
* line.extension[houseNumberLetter-houseNumberAddition].value[x] -> "NL-CM:20.5.10" "HouseNumberAddition"
* line.extension[houseNumberIndication].value[x] -> "NL-CM:20.5.9" "HouseNumberIndication"
* line.extension[additionalInformation].value[x] -> "NL-CM:20.5.7" "AdditionalInformation"
* city -> "NL-CM:20.5.3" "PlaceOfResidence"
* district -> "NL-CM:20.5.4" "Municipality"
* postalCode -> "NL-CM:20.5.6" "Postcode"
* country.extension[countryCode].value[x] -> "NL-CM:20.5.5" "Country"
