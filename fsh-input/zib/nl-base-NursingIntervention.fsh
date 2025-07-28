Profile: NlbaseNursingIntervention
Parent: CarePlan
Id: nl-base-NursingIntervention
Title: "nl base NursingIntervention"
* insert ProfileMetadata(nl-base-NursingIntervention)
* insert Purpose(NursingIntervention, 3.2, CarePlan)

* . obeys zib-NursingIntervention-1
* category insert Discriminator(value, coding)
* category contains
    nursingInterventionCode 0..1
* category[nursingInterventionCode] = http://snomed.info/sct#9632001
* contributor insert Discriminator(exists, extension(url='http://nictiz.nl/fhir/StructureDefinition/ext-NursingIntervention-ContributorIsRequester'\))
* contributor contains
    requester 0..
* contributor[requester] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)
* contributor.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-NursingIntervention-ContributorIsRequester named contributorIsRequester 0..1
* addresses only Reference(http://hl7.org/fhir/StructureDefinition/Condition or http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)
* goal only Reference(http://hl7.org/fhir/StructureDefinition/Goal or http://nictiz.nl/fhir/StructureDefinition/nl-base-TreatmentObjective)
* activity.detail.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-CarePlan-MaterialUsed named medicalDevice 0..*
* activity.detail.extension[medicalDevice].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/DeviceUseStatement or http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice)
* activity.detail.code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.18--20200901000000 (preferred)
* activity.detail.scheduled[x] insert Discriminator(type, $this)
* activity.detail.scheduledTiming only Timing
* activity.detail.scheduledTiming.repeat.bounds[x] insert Discriminator(type, $this)
* activity.detail.scheduledTiming.repeat.boundsPeriod only Period
* activity.detail.performer insert Discriminator(profile, resolve(\))
* activity.detail.performer contains
    healthcareProvider 0..1 and
    caregiver 0..1 and
    patient 0..1
* activity.detail.performer[healthcareProvider] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)
* activity.detail.performer[caregiver] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson)
* activity.detail.performer[patient] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Patient)

// Short, alias, definition and comment texts
* ^description = """
    A nursing intervention is the care and/or treatment carried out by a nurse based on an expert opinion and clinical knowledge. It is part of the nursing process; interventions are determined as a result of indexed healthcare problems (nursing diagnoses) and based on treatment goals. Following the NEN-EN-ISO 18104 norm, it is possible to structure nursing interventions (or actions) in a hierarchy, where one intervention can be part of another intervention.
    
    In a home care situation some actions can also be performed by the patient or a caregiver after a relevant instruction.
    """
* .
  * ^short = "NursingIntervention"
  * ^alias[+] = "VerpleegkundigeInterventie"
* status ^comment = """
    Sending systems that don't record an explicit status can use the following guidance to infer a value from the zib:
    
    * ProcedureEndTime present:
        * and in the future: _active_
        * and in the past: _completed_
    * ProcedureEndTime absent:
        * ProcedureStartTime present: _active_
        * ProcedureStartTime absent: _unknown_
    """
* intent ^comment = "For zib NursingIntervention, this will normally be _plan_, but the context may specify a more suitable intent."
* period.start
  * ^short = "ProcedureStartDateTime"
  * ^alias[+] = "ActieStartDatumTijd"
  * ^definition = "The start date (and if possible start time) of the procedure. The concept offers the option to indicate the start of the period of a series of repeating procedures, in which case it should be repeated in `CarePlan.activity.detail.scheduledTiming.repeat.boundsPeriod.start`."
* period.end
  * ^short = "ProcedureEndDateTime"
  * ^alias[+] = "ActieEindDatumTijd"
  * ^definition = "The end date (and if possible end time) of the procedure. The concept offers the option to indicate the end of the period of a series of repeating procedures, in which case it should be repeated in `CarePlan.activity.detail.scheduledTiming.repeat.boundsPeriod.end`."
* contributor[requester]
  * ^short = "Requester"
  * ^alias[+] = "Aanvrager"
  * ^definition = "The health professional who requested the nursing intervention. If desired, only the requester’s specialty can be entered."
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-base-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-base-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-base-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
* addresses
  * ^short = "Indication"
  * ^alias[+] = "Indicatie"
  * ^definition = "The nursing-related problem (indication) providing cause for the intervention."
* goal
  * ^short = "TreatmentObjective"
  * ^alias[+] = "Behandeldoel"
  * ^definition = "The description of the treatment goal that the intervention decision is based on."
* activity ^comment = "A nursing intervention in the Dutch realm always consists of a single activity. For this reason, the cardinality of `.activity` is restricted to `0..1`."
* activity.detail.extension[medicalDevice].value[x]
  * ^short = "MedicalDevice"
  * ^alias[+] = "MedischHulpmiddel"
  * ^definition = "Description of the materials used for the nursing procedure, such as bandages."
* activity.detail.code
  * ^short = "Intervention"
  * ^alias[+] = "Interventie"
  * ^definition = "A nursing intervention is a treatment carried out by a nurse based on an expert opinion and clinical knowledge for the benefit of the person requesting healthcare. The intervention is targeted towards a certain problem (diagnosis) and has a predetermined healthcare result. It is possible to build a hierarchy of nursing interventions (where one intervention is part of another)."
* activity.detail.scheduledTiming.repeat.boundsPeriod.start
  * ^short = "ProcedureStartDateTime"
  * ^alias[+] = "ActieStartDatumTijd"
  * ^definition = "Zib concept ProcedureStartDateTime should primarily be communicated using `CarePlan.period.start`, but it should be repeated here if it indicates the end of a series of repeating procedures."
* activity.detail.scheduledTiming.repeat.boundsPeriod.end
  * ^short = "ProcedureEndDateTime"
  * ^alias[+] = "ActieEindDatumTijd"
  * ^definition = "Zib concept ProcedureEndDateTime should primarily be communicated using `CarePlan.period.end`, but it should be repeated here if it indicates the end of a series of repeating procedures."
* activity.detail.scheduledTiming.repeat.frequency
  * ^short = "Interval / Frequency"
  * ^alias[+] = "Interval"
  * ^alias[+] = "Frequentie"
  * ^definition = """
    * Interval indicates the time between planned procedures. When entering an interval, the focus is on the time between the consecutive procedures, such as in the treatment of a wound, for example. The exact times are of lesser importance.
    * The frequency describes how often and in which period certain procedures are carried out, e.g. 3x a day.
    """
  * ^comment = "Both the zib concepts Interval and Frequency are communicated using a combination of `.frequency`, `.period` and `.periodUnit`. If the Interval concept is communicated, `.frequency` SHOULD have a fixed value of 1 (see \"Meaning when missing\" for `.frequency`)."
* activity.detail.scheduledTiming.repeat.period
  * ^short = "Interval / Frequency"
  * ^alias[+] = "Interval"
  * ^alias[+] = "Frequentie"
  * ^definition = """
    * Interval indicates the time between planned procedures. When entering an interval, the focus is on the time between the consecutive procedures, such as in the treatment of a wound, for example. The exact times are of lesser importance.
    * The frequency describes how often and in which period certain procedures are carried out, e.g. 3x a day.
    """
  * ^comment = "Both the zib concepts Interval and Frequency are communicated using a combination of `.frequency`, `.period` and `.periodUnit`. If the Interval concept is communicated, `.frequency` SHOULD have a fixed value of 1 (see \"Meaning when missing\" for `.frequency`)."
* activity.detail.scheduledTiming.repeat.periodUnit
  * ^short = "Interval / Frequency"
  * ^alias[+] = "Interval"
  * ^alias[+] = "Frequentie"
  * ^definition = """
    * Interval indicates the time between planned procedures. When entering an interval, the focus is on the time between the consecutive procedures, such as in the treatment of a wound, for example. The exact times are of lesser importance.
    * The frequency describes how often and in which period certain procedures are carried out, e.g. 3x a day.
    """
  * ^comment = "Both the zib concepts Interval and Frequency are communicated using a combination of `.frequency`, `.period` and `.periodUnit`. If the Interval concept is communicated, `.frequency` SHOULD have a fixed value of 1 (see \"Meaning when missing\" for `.frequency`)."
* activity.detail.performer[healthcareProvider]
  * ^short = "HealthcareProvider"
  * ^alias[+] = "Zorgverlener"
  * ^definition = "The health professional carrying out the nursing procedure."
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-base-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-base-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-base-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
* activity.detail.performer[caregiver]
  * ^short = "Caregiver"
  * ^alias[+] = "Verzorger"
  * ^definition = "The caregiver carrying out the nursing procedure."
* activity.detail.performer[patient]
  * ^short = "Patient"
  * ^alias[+] = "Patient"
  * ^definition = "The patient carrying out the nursing procedure."
* activity.detail.description
  * ^short = "Instruction"
  * ^alias[+] = "Instructie"
  * ^definition = "Instructions for performing the nursing action. This is particularly at issue when the action is performed by the patient himself or by a caregiver."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the nursing intervention."

Invariant: zib-NursingIntervention-1
Description: "The start and/or end date of a repeating schedule should be communicated in CarePlan.encounter as well."
Severity: #error
Expression: "activity.detail.scheduled.ofType(Timing).repeat.bounds.ofType(Period).exists() implies (period = activity.detail.scheduled.ofType(Timing).repeat.bounds.ofType(Period))"

Mapping: NlbaseNursingIntervention-to-zib-nursingintervention-v3.2-2020EN
Id: zib-nursingintervention-v3.2-2020EN
Title: "zib NursingIntervention-v3.2(2020EN)"
Source: NlbaseNursingIntervention
Target: "https://zibs.nl/wiki/NursingIntervention-v3.2(2020EN)"
*  -> "NL-CM:14.2.1" "NursingIntervention"
* status -> "NL-CM:14.2.11" "ProcedureStartDateTime (implicit, main mapping is on CarePlan.period.start and optionally on CarePlan.activity.detail.scheduledTiming.repeat.boundsPeriod.start)"
* status -> "NL-CM:14.2.12" "ProcedureEndDateTime (implicit, main mapping is on CarePlan.period.end and optionally on CarePlan.activity.detail.scheduledTiming.repeat.boundsPeriod.end)"
* period.start -> "NL-CM:14.2.11" "ProcedureStartDateTime"
* period.end -> "NL-CM:14.2.12" "ProcedureEndDateTime"
* contributor[requester] -> "NL-CM:14.2.8" "Requester"
* addresses -> "NL-CM:14.2.6" "Indication"
* goal -> "NL-CM:14.2.14" "TreatmentObjective"
* activity.detail.extension[medicalDevice].value[x] -> "NL-CM:14.2.13" "MedicalDevice"
* activity.detail.code -> "NL-CM:14.2.2" "Intervention"
* activity.detail.scheduledTiming.repeat.boundsPeriod.start -> "NL-CM:14.2.11" "ProcedureStartDateTime"
* activity.detail.scheduledTiming.repeat.boundsPeriod.end -> "NL-CM:14.2.12" "ProcedureEndDateTime"
* activity.detail.scheduledTiming.repeat.frequency -> "NL-CM:14.2.3" "Interval"
* activity.detail.scheduledTiming.repeat.frequency -> "NL-CM:14.2.4" "Frequency"
* activity.detail.scheduledTiming.repeat.period -> "NL-CM:14.2.3" "Interval"
* activity.detail.scheduledTiming.repeat.period -> "NL-CM:14.2.4" "Frequency"
* activity.detail.scheduledTiming.repeat.periodUnit -> "NL-CM:14.2.3" "Interval"
* activity.detail.scheduledTiming.repeat.periodUnit -> "NL-CM:14.2.4" "Frequency"
* activity.detail.performer[healthcareProvider] -> "NL-CM:14.2.7" "HealthcareProvider"
* activity.detail.performer[caregiver] -> "NL-CM:14.2.16" "Caregiver"
* activity.detail.performer[patient] -> "NL-CM:14.2.17" "Patient"
* activity.detail.description -> "NL-CM:14.2.18" "Instruction"
* note.text -> "NL-CM:14.2.5" "Comment"
