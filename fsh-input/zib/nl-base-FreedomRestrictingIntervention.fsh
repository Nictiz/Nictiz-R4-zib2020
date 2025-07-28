Profile: NlbaseFreedomRestrictingIntervention
Parent: Procedure
Id: nl-base-FreedomRestrictingIntervention
Title: "nl base FreedomRestrictingIntervention"
* insert ProfileMetadata(nl-base-FreedomRestrictingIntervention)
* insert Purpose(FreedomRestrictingIntervention, 1.0, Procedure)

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-FreedomRestrictingIntervention.LegallyCapable named legallyCapable 0..1 and
    http://nictiz.nl/fhir/StructureDefinition/ext-FreedomRestrictingIntervention.Assent named assent 0..1
* category = http://snomed.info/sct#225317005
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.20--20200901000000 (preferred)
* performed[x] insert Discriminator(type, $this)
* performedPeriod only Period
* performedDateTime only dateTime
* reasonCode from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.20.5.4--20200901000000 (preferred)
* reasonReference insert Discriminator(profile, resolve(\))
* reasonReference contains
    legalSituation-LegalStatus 0..1 and
    legalSituation-Representation 0..1
* reasonReference[legalSituation-LegalStatus] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-LegalSituation-LegalStatus)
* reasonReference[legalSituation-Representation] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-LegalSituation-Representation)

// Short, alias, definition and comment texts
* ^description = """
    Freedom restricting interventions are interventions that are used against the will of the person concerned and that consciously restrict the person's freedom to protect the person or his environment. This definition includes many forms of freedom restriction, such as (not exhaustive)
    
    * Forced administration of fluid and nutrition
    * Forced administration of medication
    * Performing medical checks or other medical procedures
    * Restricting freedom of movement
    * Admitting to an accommodation and secluding when admitted to an accommodation.
    * Exercising supervision
    * Searching of clothing or body
    * Restriction of visitors and the use of communication means
    
    In the hospital, it is usually about restricting the freedom of movement, for example by using bed rails, moving a chair near to the table or using an arm splint for infusion. In combination with freedom-restricting interventions, soothing medication can be administered. In the case of small children, it is often a question of fixing hands, for example, to prevent a stomach tube from being pulled out.
    For nurses to use it in hospitals, Dutch Nurses Association (V&VN) published a guideline [ref. 3].
    In mental health care, care for the disabled and psychogeriatric care, it always concerns care that is used against the will of the patient.
    The legal framework for using these interventions is (per 1-1-2020) governed by two laws, namely:
    
    * The Wet verplichte ggz (Wvggz: Mandatory Care In Mental Health Act) for people with psychiatric disorders
    * The Wet zorg en dwang (Wzd: Care and Compulsion Act) for people with intellectual disabilities and people with a psychogeriatric disorder, such as dementia.
    
    The Wvggz refers to the term compulsory care, while the Wzd uses the term involuntary care.
    A national registration system, the Argus registration, is used to register the interventions in the context of the Wvggz.
    """
* .
  * ^short = "FreedomRestrictingIntervention"
  * ^alias[+] = "VrijheidsbeperkendeInterventie"
* status ^comment = """
    This element is implictly mapped to the zib concepts NL-CM:14.6.8 (Start) and NL-CM:14.6.9 (End). Unless the status is explicitly recorded, the following guidance applies:
    
    * When Start is in the future, `.status` will usually be set to _preparation_.
    * When Start is in the past and End is present and in the future, `.status` will usually be set to _in-progress_.
    * When End is present and in the past, `.status` will usually be set to _completed_.
    * When End is not present, this means it was a point-in-time procedure and `.status` will usually be set to _completed_.
    * When a system is unable to infer the status from the Start and End, `.status` will be set to _unknown_.
    
    The _unknown_ code is not to be used to convey other statuses.  The _unknown_ code should be used when one of the statuses applies, but the authoring system doesn't know the current state of the procedure.
    
    This element is labeled as a modifier because the status contains codes that mark the resource as not currently valid.
    """
* code
  * ^short = "TypeOfIntervention"
  * ^alias[+] = "SoortInterventie"
  * ^definition = "The type of intervention describes the kind of freedom-restricting intervention/involuntary care."
* performedPeriod.start
  * ^short = "Start"
  * ^alias[+] = "Begin"
  * ^definition = "The date and time on which the intervention was started for duration registrations."
* performedPeriod.end
  * ^short = "End"
  * ^alias[+] = "Einde"
  * ^definition = "The date and time at which the intervention ended."
* performedDateTime
  * ^short = "Start"
  * ^alias[+] = "Begin"
  * ^definition = "The date and time on which the intervention was carried out for point in time registrations."
* reasonCode
  * ^short = "ReasonForUse"
  * ^alias[+] = "RedenVanToepassen"
  * ^definition = "The reason for use provides the justification for applying involuntary care"
* reasonReference[legalSituation-LegalStatus]
  * ^short = "LegalSituation"
  * ^alias[+] = "JuridischeSituatie"
  * ^definition = "The legal situation that applies to the patient during the intervention."
* reasonReference[legalSituation-Representation]
  * ^short = "LegalSituation"
  * ^alias[+] = "JuridischeSituatie"
  * ^definition = "The legal situation that applies to the patient during the intervention."

Mapping: NlbaseFreedomRestrictingIntervention-to-zib-freedomrestrictingintervention-v1.0-2020EN
Id: zib-freedomrestrictingintervention-v1.0-2020EN
Title: "zib FreedomRestrictingIntervention-v1.0(2020EN)"
Source: NlbaseFreedomRestrictingIntervention
Target: "https://zibs.nl/wiki/FreedomRestrictingIntervention-v1.0(2020EN)"
*  -> "NL-CM:14.6.1" "FreedomRestrictingIntervention"
* status -> "NL-CM:14.6.8" "Start (implicit, main mapping is on `Procedure.performedPeriod`)"
* status -> "NL-CM:14.6.9" "End (implicit, main mapping is on `Procedure.performedPeriod`)"
* code -> "NL-CM:14.6.5" "TypeOfIntervention"
* performedPeriod.start -> "NL-CM:14.6.8" "Start"
* performedPeriod.end -> "NL-CM:14.6.9" "End"
* performedDateTime -> "NL-CM:14.6.8" "Start"
* reasonCode -> "NL-CM:14.6.6" "ReasonForUse"
* reasonReference[legalSituation-LegalStatus] -> "NL-CM:14.6.4" "LegalSituation"
* reasonReference[legalSituation-Representation] -> "NL-CM:14.6.4" "LegalSituation"
