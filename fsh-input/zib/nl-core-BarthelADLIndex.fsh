Profile: NlcoreBarthelADLIndex
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BarthelADLIndex
Id: nl-core-BarthelADLIndex
Title: "nl core BarthelADLIndex"
* insert ProfileMetadata(nl-core-BarthelADLIndex)
* insert Purpose(BarthelADLIndex, 3.1, Observation)

* insert NlCorePatientForObservation
* valueInteger
  * ^minValueInteger = 0
  * ^maxValueInteger = 20
* component[bowels] ..1
* component[bowels].value[x] ^binding.strength = #required
* component[bladder] ..1
* component[bladder].value[x] ^binding.strength = #required
* component[grooming] ..1
* component[grooming].value[x] ^binding.strength = #required
* component[toiletUse] ..1
* component[toiletUse].value[x] ^binding.strength = #required
* component[feeding] ..1
* component[feeding].value[x] ^binding.strength = #required
* component[transfers] ..1
* component[transfers].value[x] ^binding.strength = #required
* component[mobility] ..1
* component[mobility].value[x] ^binding.strength = #required
* component[dressing] ..1
* component[dressing].value[x] ^binding.strength = #required
* component[managingStairs] ..1
* component[managingStairs].value[x] ^binding.strength = #required
* component[bathing] ..1
* component[bathing].value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    The Barthel ADL index is a validated scale used to measure and track patients’ activities of daily living (ADL) and indirectly, the extent to which they are dependent on help.
    The list comprises 10 variables: bowels, bladder, grooming, toilet use, feeding, transfers (from chair to bed and vice versa), mobility, dressing, climbing stairs and bathing, which are all given a score.
    The total score is the sum of the scores of the 10 variables.
    """
* . ^alias[+] = "nl-core-BarthelADLIndex"
