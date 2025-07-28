Profile: NlbaseHearingFunctionHearingAid
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice
Id: nl-base-HearingFunction.HearingAid
Title: "nl base HearingFunction.HearingAid"
* insert ProfileMetadata(nl-base-HearingFunction.HearingAid)
* ^purpose = "This DeviceUseStatement resource represents the adaptations for [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) HearingFunction v3.2 (2020)](https://zibs.nl/wiki/HearingFunction-v3.2(2020EN)) of [zib MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."

* extension[location] 0..
* device only Reference(Device or http://nictiz.nl/fhir/StructureDefinition/nl-base-HearingFunction.HearingAid.Product)
* reasonReference[stoma] 0..0
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.17.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    Hearing is the ability to observe sound, with the purpose of communicating with others, localizing the source of the sound and recognizing certain sounds. This pertains to observing the sound waves, and not processing the sounds in the brain.
    A hearing disorder can lead to things including communication problems.
    """
* .
  * ^short = "MedicalDevice / HearingAid"
  * ^alias[+] = "HorenHulpmiddel"
  * ^definition = "The medical aid used to help the patient hear."
  * ^comment = "This is a specialization of the [nl-base-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice) profile to represent HearingAid devices within the context of zib HearingFunction."
* extension[location].value[x] ^comment = "Please note that this zib concept (Location::HealthcareProvider) is also mapped on the `Procedure.location` element in profile [nl-base-Procedure-event](http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-event). The reason for this is that this zib concept aligns with the Location::HealthcareProvider concept in zib Procedure (NL-CM:14.1.5), but only for the situation that the Procedure is about placing the implant which is described using this instance of zib MedicalDevice. This is normally not the case in the context of hearing aids, so the mapping in nl-base-Procedure-event should be ignored in this situation."
* bodySite
  * ^short = "Location / AnatomicalLocation / DeviceAnatomicalLocation"
  * ^alias[+] = "HulpmiddelAnatomischeLocatie"
  * ^definition = "The anatomical location of the hearing aid, such as: ‘left ear’."

Mapping: NlbaseHearingFunctionHearingAid-to-zib-hearingfunction-v3.2-2020EN
Id: zib-hearingfunction-v3.2-2020EN
Title: "zib HearingFunction-v3.2(2020EN)"
Source: NlbaseHearingFunctionHearingAid
Target: "https://zibs.nl/wiki/HearingFunction-v3.2(2020EN)"
*  -> "NL-CM:4.17.4" "HearingAid"
* bodySite -> "NL-CM:10.1.6" "DeviceAnatomicalLocation"
