Profile: NlcoreHearingFunctionHearingAid
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-HearingFunction.HearingAid
Id: nl-core-HearingFunction.HearingAid
Title: "nl core HearingFunction.HearingAid"
* insert ProfileMetadata(nl-core-HearingFunction.HearingAid)
* ^purpose = "This DeviceUseStatement resource represents the adaptations for [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) HearingFunction v3.2 (2020)](https://zibs.nl/wiki/HearingFunction-v3.2(2020EN)) of [zib MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."

* device only Reference(http://hl7.org/fhir/StructureDefinition/Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-HearingFunction.HearingAid.Product)
* reasonReference[stoma] ..0
* bodySite ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    Hearing is the ability to observe sound, with the purpose of communicating with others, localizing the source of the sound and recognizing certain sounds. This pertains to observing the sound waves, and not processing the sounds in the brain.
    A hearing disorder can lead to things including communication problems.
    """
* .
  * ^alias[+] = "nl-core-HearingFunction.HearingAid"
  * ^comment = "This is a specialization of the [nl-core-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice) profile to represent HearingAid devices within the context of zib HearingFunction."
* extension[location].value[x] ^comment = "Please note that this zib concept (Location::HealthcareProvider) is also mapped on the `Procedure.location` element in profile [nl-core-Procedure-event](http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-event). The reason for this is that this zib concept aligns with the Location::HealthcareProvider concept in zib Procedure (NL-CM:14.1.5), but only for the situation that the Procedure is about placing the implant which is described using this instance of zib MedicalDevice. This is normally not the case in the context of hearing aids, so the mapping in nl-core-Procedure-event should be ignored in this situation."
