Profile: NlbaseVisualFunctionVisualAid
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice
Id: nl-base-VisualFunction.VisualAid
Title: "nl base VisualFunction.VisualAid"
* insert ProfileMetadata(nl-base-VisualFunction.VisualAid)
* ^purpose = "This DeviceUseStatement resource represents the adaptations for the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) VisualFunction v3.1 (2020)](https://zibs.nl/wiki/VisualFunction-v3.1(2020EN)) of [zib MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."

* extension[location] 0..
* device only Reference(Device or http://nictiz.nl/fhir/StructureDefinition/nl-base-VisualFunction.VisualAid.Product)
* reasonReference[stoma] 0..0

// Short, alias, definition and comment texts
* ^description = """
    Sight is the ability to observe lit objects, with the goal of orienting yourself on objects and people in a lit environment. This pertains to observing the light stimuli, and not processing them in the brain.
    A sight disorder can lead to things including orientation problems.
    """
* .
  * ^short = "MedicalDevice / VisualAid"
  * ^alias[+] = "ZienHulpmiddel"
  * ^definition = "The medical aids used to support the visual function."
  * ^comment = "This is a specialization of the [nl-base-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice) profile to represent VisualAid devices within the context of zib VisualFunction."
* extension[location].value[x] ^comment = "Please note that this zib concept (Location::HealthcareProvider) is also mapped on the `Procedure.location` element in profile [nl-base-Procedure-event](http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-event). The reason for this is that this zib concept aligns with the Location::HealthcareProvider concept in zib Procedure (NL-CM:14.1.5), but only for the situation that the Procedure is about placing the implant which is described using this instance of zib MedicalDevice. This is normally not the case in the context of visual aids, so the mapping in nl-base-Procedure-event should be ignored in this situation."

Mapping: NlbaseVisualFunctionVisualAid-to-zib-visualfunction-v3.1-2020EN
Id: zib-visualfunction-v3.1-2020EN
Title: "zib VisualFunction-v3.1(2020EN)"
Source: NlbaseVisualFunctionVisualAid
Target: "https://zibs.nl/wiki/VisualFunction-v3.1(2020EN)"
*  -> "NL-CM:4.16.4" "VisualAid"
