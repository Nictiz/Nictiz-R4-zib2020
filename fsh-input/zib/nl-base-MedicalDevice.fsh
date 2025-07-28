Profile: NlbaseMedicalDevice
Parent: DeviceUseStatement
Id: nl-base-MedicalDevice
Title: "nl base MedicalDevice"
* insert ProfileMetadata(nl-base-MedicalDevice)
* insert Purpose(MedicalDevice, 3.3.1, DeviceUseStatement)

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-MedicalDevice.HealthProfessional named healthProfessional 0..* and
    http://nictiz.nl/fhir/StructureDefinition/ext-MedicalDevice.Location named location 0..* and
    http://hl7.org/fhir/StructureDefinition/resource-pertainsToGoal named treatmentObjective 0..*
* extension[treatmentObjective].value[x] only Reference(Goal or http://nictiz.nl/fhir/StructureDefinition/nl-base-TreatmentObjective)
* derivedFrom insert Discriminator(profile, resolve(\))
* derivedFrom contains
    procedure-request 0.. and
    procedure-event 0..
* derivedFrom[procedure-request] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-request)
* derivedFrom[procedure-event] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-event)
* timing[x] insert Discriminator(type, $this)
* timingPeriod only Period
* device only Reference(Device or http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice.Product)
* reasonReference insert Discriminator(profile, resolve(\))
* reasonReference contains
    indication 0.. and
    stoma 0..
* reasonReference[indication] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)
* reasonReference[stoma] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Stoma)
* bodySite only CodeableConcept
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AnatomicalLocation
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Medical devices are any internally implanted and external devices and/or aids used by the patient (in the past) to reduce the effects of functional limitations in organ systems or to facilitate the treatment of a disease."
* .
  * ^short = "MedicalDevice"
  * ^alias[+] = "MedischHulpmiddel"
* extension[location].value[x] ^comment = "Please note that this zib concept (Location::HealthcareProvider) is also mapped on the `Procedure.location` element in profile [nl-base-Procedure-event](http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-event). The reason for this is that this zib concept aligns with the Location::HealthcareProvider concept in zib Procedure (NL-CM:14.1.5), but only for the situation that the Procedure is about placing the implant which is described using this instance of zib MedicalDevice. In this situation, the current extension is redundant and it is advised to only use `Procedure.location` in profile nl-base-Procedure-event to represent the Location concept."
* extension[treatmentObjective].value[x] ^comment = """
    Zib TreatmentObjective (represented by the Goal resource in FHIR) can use the data model of zib FunctionalOrMentalStatus to describe the desired treatment objective, which in turn may refer zib MedicalDevice to indicate the intent to use that device for reaching the treatment objective.
    
    In FHIR, the modeling deviates somewhat from this approach:
    
    * Both zib TreatmentObjective and the desired zib FunctionalOrMentalStatus are represented using the [nl-base-TreatmentObjective](http://nictiz.nl/fhir/nl-base-TreatmentObjective) profile on the Goal resource.
    * The reference from TreatmentObjective to MedicalDevice (via FunctionalOrMentalStatus) is in the opposite direction, to the Goal resource.
    
    This extension may thus be used to represent the link zib TreatmentObjective -> zib FunctionalOrMentalStatus -> zib MedicalDevice. In this situation, it is expected that `DeviceUseStatement.status` is set to _intended_.
    """
* status ^comment = """
    This element is implictly mapped to the zib concepts NL-CM:10.1.11 (StartDate) and NL-CM:10.1.14 (EndDate). Unless the status is explicitly recorded, the following guidance applies:
    
    * When StartDate is in the future, `.status` will usually be set to _intended_.
    * When StartDate is in the past and EndDate has a value and in the future or EndDate has no value, `.status` will usually be set to _active_.
    * When EndDate has a value and is in the past, `.status` will usually be set to _completed_.
    """
* derivedFrom[procedure-request]
  * ^short = "Procedure"
  * ^alias[+] = "Verrichting"
  * ^definition = "The procedure which has the purpose of placing this product in or on the body."
  * ^comment = """
    * Note 1: on a functional level, zib Procedure references zib MedicalDevice, but in FHIR this direction is reversed.
    * Note 2: zib Procedure can represent a requested or (to be) performed procedure. This slice represents requested procedures, while slice `procedure-event` represents performed procedures.
    """
* derivedFrom[procedure-event]
  * ^short = "Procedure"
  * ^alias[+] = "Verrichting"
  * ^definition = "The procedure which has the purpose of placing this product in or on the body."
  * ^comment = """
    * Note 1: on a functional level, zib Procedure references zib MedicalDevice, but in FHIR this direction is reversed.
    * Note 2: zib Procedure can represent a requested or (to be) performed procedure. This slice represents performed procedures, while slice `procedure-request` represents requested procedures.
    """
* timingPeriod.start
  * ^short = "StartDate"
  * ^alias[+] = "BeginDatum"
  * ^definition = "The start date of the first use or implant of the medical device. A \"vague\" date, such as only the year, is permitted."
* timingPeriod.end
  * ^short = "EndDate"
  * ^alias[+] = "EindDatum"
  * ^definition = "The end date of the last use or explant of the medical device. A \"vague\" date, such as only the year, is permitted."
* reasonReference[indication]
  * ^short = "Indication"
  * ^alias[+] = "Indicatie"
  * ^definition = "The medical reason for use of the medical device."
* reasonReference[stoma]
  * ^short = "Stoma"
  * ^alias[+] = "Stoma"
  * ^comment = "Please note that on a functional level, zib Stoma references zib MedicalDevice, but in FHIR this direction is reversed."
* bodySite
  * ^short = "Location / AnatomicalLocation"
  * ^alias[+] = "AnatomischeLocatie"
  * ^definition = "Patient's anatomical location of the medical device used."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment about use or information on the medical device used."

Mapping: NlbaseMedicalDevice-to-zib-medicaldevice-v3.3.1-2020EN
Id: zib-medicaldevice-v3.3.1-2020EN
Title: "zib MedicalDevice-v3.3.1(2020EN)"
Source: NlbaseMedicalDevice
Target: "https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)"
*  -> "NL-CM:10.1.1" "MedicalDevice"
* status -> "NL-CM:10.1.11" "StartDate (implicit, main mapping is on DeviceUseStatement.timingPeriod.start)"
* status -> "NL-CM:10.1.14" "EndDate (implicit, main mapping is on DeviceUseStatement.timingPeriod.end)"
* timingPeriod.start -> "NL-CM:10.1.11" "StartDate"
* timingPeriod.end -> "NL-CM:10.1.14" "EndDate"
* reasonReference[indication] -> "NL-CM:10.1.7" "Indication"
* bodySite -> "NL-CM:10.1.15" "AnatomicalLocation"
* note.text -> "NL-CM:10.1.10" "Comment"

Mapping: NlbaseMedicalDevice-to-zib-procedure-v5.2-2020EN
Id: zib-procedure-v5.2-2020EN
Title: "zib Procedure-v5.2(2020EN)"
Source: NlbaseMedicalDevice
Target: "https://zibs.nl/wiki/Procedure-v5.2(2020EN)"
* derivedFrom[procedure-request] -> "NL-CM:14.1.7" "Reversed reference for zib Procedure.MedicalDevice"
* derivedFrom[procedure-event] -> "NL-CM:14.1.7" "Reversed reference for zib Procedure.MedicalDevice"

Mapping: NlbaseMedicalDevice-to-zib-stoma-v3.3-2020EN
Id: zib-stoma-v3.3-2020EN
Title: "zib Stoma-v3.3(2020EN)"
Source: NlbaseMedicalDevice
Target: "https://zibs.nl/wiki/Stoma-v3.3(2020EN)"
* reasonReference[stoma] -> "NL-CM:5.2.3" "Reversed reference for zib Stoma.StomaMaterial"

Mapping: NlbaseMedicalDevice-to-zib-treatmentobjective-v3.2-2020EN
Id: zib-treatmentobjective-v3.2-2020EN
Title: "zib TreatmentObjective-v3.2(2020EN)"
Source: NlbaseMedicalDevice
Target: "https://zibs.nl/wiki/TreatmentObjective-v3.2(2020EN)"

Mapping: NlbaseMedicalDevice-to-zib-functionalormentalstatus-v3.2-2020EN
Id: zib-functionalormentalstatus-v3.2-2020EN
Title: "zib FunctionalOrMentalStatus-v3.2(2020EN)"
Source: NlbaseMedicalDevice
Target: "https://zibs.nl/wiki/FunctionalOrMentalStatus-v3.2(2020EN)"
* extension[treatmentObjective].value[x] -> "NL-CM:4.26.5" "Reversed reference for zib FunctionalOrMentalStatus.MedicalDevice, when using zib FunctionalOrMentalStatus in the context of zib TreatmentObjective"
