Profile: NlcoreBloodPressure
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BloodPressure
Id: nl-core-BloodPressure
Title: "nl core BloodPressure"
* insert ProfileMetadata(nl-core-BloodPressure)
* insert Purpose(BloodPressure, 3.2.1, Observation)

* extension[position].value[x] ^binding.strength = #extensible
* note ..1
* bodySite ^binding.strength = #extensible
* method ^binding.strength = #extensible
* component[SystolicBP] 1..1
* component[DiastolicBP] 1..1
* component[diastolicEndpoint] ..1
* component[diastolicEndpoint].value[x] ^binding.strength = #required
* component[cuffType] ..1
* component[cuffType].value[x] ^binding.strength = #required
* component[averageBloodPressure] ..1

// Short, alias, definition and comment texts
* ^description = "The blood pressure is a parameter for determining the condition of the blood circulation and is expressed in systolic and diastolic pressure in mmHg."
* . ^alias[+] = "nl-core-BloodPressure"
