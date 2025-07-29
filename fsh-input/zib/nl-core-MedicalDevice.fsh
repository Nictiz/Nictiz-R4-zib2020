Profile: NlcoreMedicalDevice
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice
Id: nl-core-MedicalDevice
Title: "nl core MedicalDevice"
* insert ProfileMetadata(nl-core-MedicalDevice)
* insert Purpose(MedicalDevice, 3.3.1, DeviceUseStatement)

* extension[treatmentObjective].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/Goal or http://nictiz.nl/fhir/StructureDefinition/nl-core-TreatmentObjective)
* derivedFrom[procedure-request] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-request)
* derivedFrom[procedure-event] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-event)
* device only Reference(http://hl7.org/fhir/StructureDefinition/Device or http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice.Product)
* reasonReference[indication] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* reasonReference[stoma] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Stoma)
* bodySite ^binding.strength = #required
* note ..1

// Short, alias, definition and comment texts
* ^description = "Medical devices are any internally implanted and external devices and/or aids used by the patient (in the past) to reduce the effects of functional limitations in organ systems or to facilitate the treatment of a disease."
* . ^alias[+] = "nl-core-MedicalDevice"
* extension[location].value[x] ^comment = "Please note that this zib concept (Location::HealthcareProvider) is also mapped on the `Procedure.location` element in profile [nl-core-Procedure-event](http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-event). The reason for this is that this zib concept aligns with the Location::HealthcareProvider concept in zib Procedure (NL-CM:14.1.5), but only for the situation that the Procedure is about placing the implant which is described using this instance of zib MedicalDevice. In this situation, the current extension is redundant and it is advised to only use `Procedure.location` in profile nl-core-Procedure-event to represent the Location concept."
* extension[treatmentObjective].value[x] ^comment = """
    Zib TreatmentObjective (represented by the Goal resource in FHIR) can use the data model of zib FunctionalOrMentalStatus to describe the desired treatment objective, which in turn may refer zib MedicalDevice to indicate the intent to use that device for reaching the treatment objective.
    
    In FHIR, the modeling deviates somewhat from this approach:
    
    * Both zib TreatmentObjective and the desired zib FunctionalOrMentalStatus are represented using the [nl-core-TreatmentObjective](http://nictiz.nl/fhir/nl-core-TreatmentObjective) profile on the Goal resource.
    * The reference from TreatmentObjective to MedicalDevice (via FunctionalOrMentalStatus) is in the opposite direction, to the Goal resource.
    
    This extension may thus be used to represent the link zib TreatmentObjective -> zib FunctionalOrMentalStatus -> zib MedicalDevice. In this situation, it is expected that `DeviceUseStatement.status` is set to _intended_.
    """
