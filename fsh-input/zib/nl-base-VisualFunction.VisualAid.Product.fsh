Profile: NlbaseVisualFunctionVisualAidProduct
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice.Product
Id: nl-base-VisualFunction.VisualAid.Product
Title: "nl base VisualFunction.VisualAid.Product"
* insert ProfileMetadata(nl-base-VisualFunction.VisualAid.Product)
* ^purpose = "This Device resource represents the Product concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)) adjusted to the requirements of the [zib VisualFunction v3.1 (2020)](https://zibs.nl/wiki/VisualFunction-v3.1(2020EN))."


// Short, alias, definition and comment texts
* ^description = """
    Sight is the ability to observe lit objects, with the goal of orienting yourself on objects and people in a lit environment. This pertains to observing the light stimuli, and not processing them in the brain.
    A sight disorder can lead to things including orientation problems.
    """
* type ^definition = "The type of product used to help the patient see."

Mapping: NlbaseVisualFunctionVisualAidProduct-to-zib-visualfunction-v3.1-2020EN
Id: zib-visualfunction-v3.1-2020EN
Title: "zib VisualFunction-v3.1(2020EN)"
Source: NlbaseVisualFunctionVisualAidProduct
Target: "https://zibs.nl/wiki/VisualFunction-v3.1(2020EN)"
* type -> "NL-CM:10.1.3" "ProductType"
