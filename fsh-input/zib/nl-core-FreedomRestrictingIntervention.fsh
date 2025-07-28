Profile: NlcoreFreedomRestrictingIntervention
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-FreedomRestrictingIntervention
Id: nl-core-FreedomRestrictingIntervention
Title: "nl core FreedomRestrictingIntervention"
* insert ProfileMetadata(nl-core-FreedomRestrictingIntervention)
* insert Purpose(FreedomRestrictingIntervention, 1.0, Procedure)

* extension[legallyCapable] ..1
* extension[assent] ..1
* category 1..
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.20--20200901000000 (extensible)
* reasonCode ..1
* reasonCode from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.20.5.4--20200901000000 (extensible)
* reasonReference[legalSituation-LegalStatus] ..1
* reasonReference[legalSituation-LegalStatus] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-LegalSituation-LegalStatus)
* reasonReference[legalSituation-Representation] ..1
* reasonReference[legalSituation-Representation] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-LegalSituation-Representation)

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
* . ^alias[+] = "nl-core-FreedomRestrictingIntervention"
