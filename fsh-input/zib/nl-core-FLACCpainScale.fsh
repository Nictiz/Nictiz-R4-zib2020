Profile: NlcoreFLACCpainScale
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-FLACCpainScale
Id: nl-core-FLACCpainScale
Title: "nl core FLACCpainScale"
* insert ProfileMetadata(nl-core-FLACCpainScale)
* insert Purpose(FLACCpainScale, 1.1, Observation)

* note ..1
* component[face] ..1
* component[face].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.13.1--20200901000000 (required)
* component[legs] ..1
* component[legs].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.13.2--20200901000000 (required)
* component[activity] ..1
* component[activity].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.13.3--20200901000000 (required)
* component[cry] ..1
* component[cry].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.13.4--20200901000000 (required)
* component[consolability] ..1
* component[consolability].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.13.5--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    The FLACC (Faces, Legs, Activity, Cry and Consolability) is a pain assessment tool, that is used to assess pain in children aged 0-7 years old by observing their behaviour.
    The FLACC has five subscales that need to be addressed. The final score indicates whether the observed child suffers pain and 'how much'. The score is often combined with a NRS-score that is completed by the nurses on basis of clinical experience.
    """
* . ^alias[+] = "nl-core-FLACCpainScale"
