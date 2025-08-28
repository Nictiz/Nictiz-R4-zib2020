Profile: NlcoreO2Saturation
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-O2Saturation
Id: nl-core-O2Saturation
Title: "nl core O2Saturation"
* insert ProfileMetadata(nl-core-O2Saturation)
* insert Purpose(O2Saturation, 3.1, Observation)

* subject only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* note ..1
* component[extraOxygenAdministration] ..1

// Short, alias, definition and comment texts
* ^description = "Arterial oxygen saturation, also referred to as saturation, is an indicator for the amount of oxygen bound to the hemoglobin in the red blood cells of the arteries. The measurement is usually carried out as a transcutaneous measurement with a blood oxygen monitor or pulse oximeter. The saturation level is expressed as a percentage and should be over 95% in healthy people."
* . ^alias[+] = "nl-core-O2Saturation"
