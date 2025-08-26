Profile: NlcoreBowelFunction
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction
Id: nl-core-BowelFunction
Title: "nl core BowelFunction"
* insert ProfileMetadata(nl-core-BowelFunction)
* insert Purpose(BowelFunction, 3.1.1, Observation)

* extension[stoma] ..1
* extension[stoma].value[x] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Stoma)
* extension[incontinenceMaterial].value[x] only Reference(Resource or http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice)
* insert NlCorePatientForObservation
* note ..1
* hasMember[fecalContinence] ..1
* hasMember[fecalContinence] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-BowelFunction.FecalContinence)
* hasMember[frequency] ..1
* hasMember[frequency] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-BowelFunction.Frequency)
* hasMember[defecationConsistency] ..1
* hasMember[defecationConsistency] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-BowelFunction.DefecationConsistency)
* hasMember[defecationColor] ..1
* hasMember[defecationColor] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-BowelFunction.DefecationColor)

// Short, alias, definition and comment texts
* ^description = "An important function of the rectum in particular is the temporary storage and excretion of feces, at the moment there is cause to do so. Disrupting the bowel functions can lead to fecal incontinence and constipation."
* .
  * ^alias[+] = "nl-core-BowelFunction"
  * ^comment = """
    Several concepts of zib BowelFunction are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * FecalContinence (NL-CM:4.15.2): [nl-core-BowelFunction.FecalContinence](http://nictiz.nl/fhir/StructureDefinition/nl-core-BowelFunction.FecalContinence)
    * Frequency (NL-CM:4.15.4): [nl-core-BowelFunction.Frequency](http://nictiz.nl/fhir/StructureDefinition/nl-core-BowelFunction.Frequency)
    * DefecationConsistency(NL-CM:4.15.9): [nl-core-BowelFunction.DefecationConsistency](http://nictiz.nl/fhir/StructureDefinition/nl-core-BowelFunction.DefecationConsistency)
    * DefecationColor(NL-CM:4.15.10): [nl-core-BowelFunction.DefecationColor](http://nictiz.nl/fhir/StructureDefinition/nl-core-BowelFunction.DefecationColor)
    """
