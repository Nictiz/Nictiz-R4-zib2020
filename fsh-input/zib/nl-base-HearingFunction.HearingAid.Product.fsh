Profile: NlbaseHearingFunctionHearingAidProduct
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice.Product
Id: nl-base-HearingFunction.HearingAid.Product
Title: "nl base HearingFunction.HearingAid.Product"
* insert ProfileMetadata(nl-base-HearingFunction.HearingAid.Product)
* ^purpose = "This Device resource represents the Product concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)) adjusted to the requirements of the [zib HearingFunction v3.2 (2020)](https://zibs.nl/wiki/HearingFunction-v3.2(2020EN))."

* type insert AdditionalBinding(minimum, http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.17.2--20200901000000)

// Short, alias, definition and comment texts
* ^description = """
    Hearing is the ability to observe sound, with the purpose of communicating with others, localizing the source of the sound and recognizing certain sounds. This pertains to observing the sound waves, and not processing the sounds in the brain.
    A hearing disorder can lead to things including communication problems.
    """
* type ^definition = "The type of product used to help the patient hear."

Mapping: NlbaseHearingFunctionHearingAidProduct-to-zib-hearingfunction-v3.2-2020EN
Id: zib-hearingfunction-v3.2-2020EN
Title: "zib HearingFunction-v3.2(2020EN)"
Source: NlbaseHearingFunctionHearingAidProduct
Target: "https://zibs.nl/wiki/HearingFunction-v3.2(2020EN)"
* type -> "NL-CM:10.1.3" "ProductType"
