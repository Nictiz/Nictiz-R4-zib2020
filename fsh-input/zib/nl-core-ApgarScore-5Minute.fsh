Profile: NlcoreApgarScore5Minute
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ApgarScore-5Minute
Id: nl-core-ApgarScore-5Minute
Title: "nl core ApgarScore 5Minute"
* insert ProfileMetadata(nl-core-ApgarScore-5Minute)
* insert Purpose(ApgarScore, 1.0.1, Observation)

* note ..1
* component[respiratoryScore] ..1
* component[respiratoryScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.16.1--20200901000000 (required)
* component[appearanceScore] ..1
* component[appearanceScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.16.4--20200901000000 (required)
* component[pulseScore] ..1
* component[pulseScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.16.2--20200901000000 (required)
* component[grimaceScore] ..1
* component[grimaceScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.16.5--20200901000000 (required)
* component[muscleToneScore] ..1
* component[muscleToneScore].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.16.3--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    The Apgar score represents the overall clinical status of a newborn child. This is evaluated one, five and ten minutes after birth based on 5 parameters: Appearance, Pulse, Grimace, Activity, Respiration. If the score measured at 5 minutes is < 8, the Apgar score is measured again at 10, 15, 20 minutes etc. until the score = 8.
    
    The zib explicitly defines the Apgar score at 1, 5 and 10 minutes after birth. This profile represents the Apgar score at 5 minutes after birth. Profiles have also been defined for the Apgar score [at 1 minute](http://nictiz.nl/fhir/StructureDefinition/zib-ApgarScore-1Minute) and [at 10 minutes](http://nictiz.nl/fhir/StructureDefinition/zib-ApgarScore-10Minute) after birth.
    """
* . ^alias[+] = "nl-core-ApgarScore-5Minute"
