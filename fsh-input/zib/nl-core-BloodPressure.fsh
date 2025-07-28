Profile: NlcoreBloodPressure
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BloodPressure
Id: nl-core-BloodPressure
Title: "nl core BloodPressure"
* insert ProfileMetadata(nl-core-BloodPressure)
* insert Purpose(BloodPressure, 3.2.1, Observation)

* extension[position].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.4.5--20200901000000 (extensible)
* note ..1
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.4.4--20200901000000 (extensible)
* method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.4.1--20200901000000 (extensible)
* component[SystolicBP] 1..1
* component[DiastolicBP] 1..1
* component[diastolicEndpoint] ..1
* component[diastolicEndpoint].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.4.2--20200901000000 (required)
* component[cuffType] ..1
* component[cuffType].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.4.3--20200901000000 (required)
* component[averageBloodPressure] ..1

// Short, alias, definition and comment texts
* ^description = "The blood pressure is a parameter for determining the condition of the blood circulation and is expressed in systolic and diastolic pressure in mmHg."
* . ^alias[+] = "nl-core-BloodPressure"
