Extension: ExtAddressInformationAddressType
Id: ext-AddressInformation.AddressType
Title: "ext AddressInformation.AddressType"
Context: Address
* insert ProfileMetadata(ext-AddressInformation.AddressType)

* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.20.5.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "An extension to bind the zib AddressInformation ValueSet \"AdresTypeCodelijst\" to the FHIR _Address_ datatype."
* value[x]
  * ^short = "AddressType"
  * ^alias[+] = "AdresSoort"
  * ^definition = "The type of address in question, such as a home address or mailing address."

Mapping: ExtAddressInformationAddressType-to-zib-addressinformation-v1.1-2020EN
Id: zib-addressinformation-v1.1-2020EN
Title: "zib AddressInformation-v1.1(2020EN)"
Source: ExtAddressInformationAddressType
Target: "https://zibs.nl/wiki/AddressInformation-v1.1(2020EN)"
* value[x] -> "NL-CM:20.5.8" "AddressType"
