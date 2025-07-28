Extension: ExtMedicalDeviceHealthProfessional
Id: ext-MedicalDevice.HealthProfessional
Title: "ext MedicalDevice.HealthProfessional"
Context: DeviceUseStatement
* insert ProfileMetadata(ext-MedicalDevice.HealthProfessional)

* . 0..1
* value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)

// Short, alias, definition and comment texts
* ^description = "An extension to provide the health professional involved in the indication for use of the medical device implant."
* ^purpose = "This extension represents the HealthProfessional concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) MedicalDevice v3.3.1 (2020)](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN))."
* value[x]
  * ^short = "HealthProfessional"
  * ^alias[+] = "Zorgverlener"
  * ^definition = "The health professional involved in the indication for use of the medical device implant."
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-base-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-base-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-base-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """

Mapping: ExtMedicalDeviceHealthProfessional-to-zib-medicaldevice-v3.3.1-2020EN
Id: zib-medicaldevice-v3.3.1-2020EN
Title: "zib MedicalDevice-v3.3.1(2020EN)"
Source: ExtMedicalDeviceHealthProfessional
Target: "https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)"
* value[x] -> "NL-CM:10.1.9" "HealthProfessional"
