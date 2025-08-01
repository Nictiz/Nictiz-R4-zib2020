Profile: NlcoreFLACCpainScale
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-FLACCpainScale
Id: nl-core-FLACCpainScale
Title: "nl core FLACCpainScale"
* insert ProfileMetadata(nl-core-FLACCpainScale)
* insert Purpose(FLACCpainScale, 1.1, Observation)

* insert NlCorePatientForObservation
* valueInteger
  * ^minValueInteger = 0
  * ^maxValueInteger = 10
* note ..1
* component[face] ..1
* component[face].value[x] ^binding.strength = #required
* component[legs] ..1
* component[legs].value[x] ^binding.strength = #required
* component[activity] ..1
* component[activity].value[x] ^binding.strength = #required
* component[cry] ..1
* component[cry].value[x] ^binding.strength = #required
* component[consolability] ..1
* component[consolability].value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    The FLACC (Faces, Legs, Activity, Cry and Consolability) is a pain assessment tool, that is used to assess pain in children aged 0-7 years old by observing their behaviour.
    The FLACC has five subscales that need to be addressed. The final score indicates whether the observed child suffers pain and 'how much'. The score is often combined with a NRS-score that is completed by the nurses on basis of clinical experience.
    """
* . ^alias[+] = "nl-core-FLACCpainScale"
