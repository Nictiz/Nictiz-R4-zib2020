Profile: NlbaseMedicalDeviceProduct
Parent: Device
Id: nl-base-MedicalDevice.Product
Title: "nl base MedicalDevice.Product"
* insert ProfileMetadata(nl-base-MedicalDevice.Product)
* ^purpose = "This Device resource represents the Product concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."

* identifier insert Discriminator(pattern, $this)
* identifier contains
    gs1ProductID 0..1 and
    hibcProductID 0..1
* identifier[gs1ProductID] ^patternIdentifier.system = "https://www.gs1.org/gtin"
* identifier[hibcProductID] ^patternIdentifier.system = "urn:oid:2.16.840.1.113883.6.40"
* udiCarrier insert Discriminator(value, issuer)
* udiCarrier contains
    gs1UdiCarrier 0..1 and
    hibcUdiCarrier 0..1
* type from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.10.1.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Medical devices are any internally implanted and external devices and/or aids used by the patient (in the past) to reduce the effects of functional limitations in organ systems or to facilitate the treatment of a disease."
* .
  * ^short = "Product"
  * ^alias[+] = "Product"
  * ^definition = "The medical device (internally or externally)."
  * ^comment = """
    Frequently used coding systems to identify devices are Health Industry Bar Code (HIBC) or GS1's Global Trade Item Number (GTIN). If one of these systems is used, the device identification happens on the basis of a UDI. Next to these two, other systems to identify devices are allowed by the zib, as long as such a system allows for unique identification of the device.
    
    In all cases the full identifier will be populated in `.identifier`. If the identifier is a UDI in particular, it should also be populated in `udiCarrier.carrierHRF`, and the element `udiCarrier.issuer` is used to indicate which 'coding system' is used. Moreover the identifier may be broken down into several parts in that case, namely `.udiCarrier.deviceIdentifier`, `.manufactureDate`, `.expirationDate`, `.lotNumber` and `.serialNumber`. For GTIN, guidance is given at the respective elements in this profile and is based on <https://www.gs1.org/industries/healthcare/udi>. For HIBC please consult the the Supplier Labeling Standard that can be found at <https://www.hibcc.org/udi-labeling-standards/barcode-standards/>, as conversion into the several parts is less straightforward.
    """
* identifier[gs1ProductID]
  * ^short = "ProductID"
  * ^alias[+] = "ProductID"
  * ^definition = "Unique identification of the product, such as the serial number. The `identifier` may only be used if it also identifies the resource."
* identifier[hibcProductID]
  * ^short = "ProductID"
  * ^alias[+] = "ProductID"
  * ^definition = "Unique identification of the product, such as the serial number. The `identifier` may only be used if it also identifies the resource."
* udiCarrier ^definition = "Unique device identifier (UDI) assigned to device label or package. Note that a udiCarrier is only applicable if the zib concept ProductID actually contains a UDI, e.g. an ID according to GTIN or HIBC."
* udiCarrier[gs1UdiCarrier].deviceIdentifier ^definition = """
    The device identifier (DI) is a mandatory, fixed portion of a UDI that identifies the labeler and the specific version or model of a device.
    In the GS1 standard this element represents the GTIN itself - e.g. 01234567891234 - as part of the Application Identifier (AI), namely AI(01).
    """
* udiCarrier[gs1UdiCarrier].issuer ^definition = "Organization that is charged with issuing UDIs for devices. For the zib this would be GS1's Global Trade Item Number (GTIN) or Health Industry Bar Code (HIBC). Note that the issuer must match the issuer implicitly contained in the ProductID."
* udiCarrier[gs1UdiCarrier].carrierHRF
  * ^short = "ProductID"
  * ^alias[+] = "ProductID"
* udiCarrier[hibcUdiCarrier].issuer ^definition = "Organization that is charged with issuing UDIs for devices. For the zib this would be GS1's Global Trade Item Number (GTIN) or Health Industry Bar Code (HIBC). Note that the issuer must match the issuer implicitly contained in the ProductID."
* udiCarrier[hibcUdiCarrier].carrierHRF
  * ^short = "ProductID"
  * ^alias[+] = "ProductID"
* manufactureDate ^definition = """
    The date a specific device was manufactured - which is a component of the production identifier (PI), a conditional, variable portion of a UDI. 
    In the GS1 standard this element represents the Manufacture date - e.g. 250717 - as part of the Application Identifier (AI), namely AI(11).
    """
* expirationDate ^definition = """
    The expiration date of a specific device - which is a component of the production identifier (PI), a conditional, variable portion of a UDI.
    In the GS1 standard this element represents the Expiration date - e.g. 141120 - as part of the Application Identifier (AI), namely AI(17).
    """
* lotNumber ^definition = """
    The lot or batch number within which a device was manufactured - which is a component of the production identifier (PI), a conditional, variable portion of a UDI.
    In the GS1 standard this element represents the Lot/batch number - e.g. 1234AB - as part of the Application Identifier (AI), namely AI(10).
    """
* serialNumber ^definition = """
    The serial number assigned by the organization when the device was manufactured.
    In the GS1 standard this element represents the Serial number - e.g. 12345XYZ - as part of the Application Identifier (AI), namely AI(21).
    """
* type
  * ^short = "ProductType"
  * ^alias[+] = "ProductType"
  * ^definition = "The code of the type of product."
* note.text
  * ^short = "ProductDescription"
  * ^alias[+] = "ProductOmschrijving"
  * ^definition = "Textual description of the product."

Mapping: NlbaseMedicalDeviceProduct-to-zib-medicaldevice-v3.3.1-2020EN
Id: zib-medicaldevice-v3.3.1-2020EN
Title: "zib MedicalDevice-v3.3.1(2020EN)"
Source: NlbaseMedicalDeviceProduct
Target: "https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)"
*  -> "NL-CM:10.1.2" "Product"
* identifier[gs1ProductID] -> "NL-CM:10.1.4" "ProductID"
* identifier[hibcProductID] -> "NL-CM:10.1.4" "ProductID"
* udiCarrier[gs1UdiCarrier].carrierHRF -> "NL-CM:10.1.4" "ProductID"
* udiCarrier[hibcUdiCarrier].carrierHRF -> "NL-CM:10.1.4" "ProductID"
* type -> "NL-CM:10.1.3" "ProductType"
* note.text -> "NL-CM:10.1.13" "ProductDescription"
