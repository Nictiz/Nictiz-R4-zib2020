Profile: NlcoreApgarScore1Minute
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ApgarScore-1Minute
Id: nl-core-ApgarScore-1Minute
Title: "nl core ApgarScore 1Minute"
* insert ProfileMetadata(nl-core-ApgarScore-1Minute)
* insert Purpose(ApgarScore, 1.0.1, Observation)

* insert NlCorePatientForObservation
* valueInteger
  * ^minValueInteger = 0
  * ^maxValueInteger = 10
* note ..1
* component[respiratoryScore] ..1
* component[respiratoryScore].value[x] ^binding.strength = #required
* component[appearanceScore] ..1
* component[appearanceScore].value[x] ^binding.strength = #required
* component[pulseScore] ..1
* component[pulseScore].value[x] ^binding.strength = #required
* component[grimaceScore] ..1
* component[grimaceScore].value[x] ^binding.strength = #required
* component[muscleToneScore] ..1
* component[muscleToneScore].value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    The Apgar score represents the overall clinical status of a newborn child. This is evaluated one, five and ten minutes after birth based on 5 parameters: Appearance, Pulse, Grimace, Activity, Respiration. If the score measured at 5 minutes is < 8, the Apgar score is measured again at 10, 15, 20 minutes etc. until the score = 8.
    
    The zib explicitly defines the Apgar score at 1, 5 and 10 minutes after birth. This profile represents the Apgar score at 1 minute after birth. Profiles have also been defined for the Apgar score [at 5 minutes](http://nictiz.nl/fhir/StructureDefinition/zib-ApgarScore-5Minute) and [at 10 minutes](http://nictiz.nl/fhir/StructureDefinition/zib-ApgarScore-10Minute) after birth.
    """
* . ^alias[+] = "nl-core-ApgarScore-1Minute"
