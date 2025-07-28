Profile: NlbaseBowelFunction
Parent: Observation
Id: nl-base-BowelFunction
Title: "nl base BowelFunction"
* insert ProfileMetadata(nl-base-BowelFunction)
* insert Purpose(BowelFunction, 3.1.1, Observation)

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-StomaReference named stoma 0..1 and
    http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo named incontinenceMaterial 0..*
* extension[incontinenceMaterial].value[x] only Reference(Resource or http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice)
* code = http://snomed.info/sct#111989001
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    fecalContinence 0..1 and
    frequency 0..1 and
    defecationConsistency 0..1 and
    defecationColor 0..1
* hasMember[fecalContinence] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.FecalContinence)
* hasMember[frequency] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.Frequency)
* hasMember[defecationConsistency] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.DefecationConsistency)
* hasMember[defecationColor] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.DefecationColor)

// Short, alias, definition and comment texts
* ^description = "An important function of the rectum in particular is the temporary storage and excretion of feces, at the moment there is cause to do so. Disrupting the bowel functions can lead to fecal incontinence and constipation."
* .
  * ^short = "BowelFunction"
  * ^alias[+] = "Darmfunctie"
  * ^comment = """
    Several concepts of zib BowelFunction are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * FecalContinence (NL-CM:4.15.2): [nl-base-BowelFunction.FecalContinence](http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.FecalContinence)
    * Frequency (NL-CM:4.15.4): [nl-base-BowelFunction.Frequency](http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.Frequency)
    * DefecationConsistency(NL-CM:4.15.9): [nl-base-BowelFunction.DefecationConsistency](http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.DefecationConsistency)
    * DefecationColor(NL-CM:4.15.10): [nl-base-BowelFunction.DefecationColor](http://nictiz.nl/fhir/StructureDefinition/nl-base-BowelFunction.DefecationColor)
    """
* extension[stoma].value[x]
  * ^short = "Stoma"
  * ^alias[+] = "Stoma"
  * ^definition = "Stoma describes the presence of an unnatural, surgically created opening. If the patient has a stoma, the type of stoma must be entered along with the date on and location at which the stoma and any stoma pouches were placed. A comment can also be entered."
* extension[incontinenceMaterial].value[x]
  * ^short = "IncontinenceMaterial"
  * ^alias[+] = "Incontinentiemateriaal"
  * ^definition = "A description of the incontinence material used."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the BowelFunction."
* hasMember[fecalContinence] ^definition = "The FecalContinence concept (NL-CM:4.15.2) of zib BowelFunction, represented as a distinct Observation resource."
* hasMember[frequency] ^definition = "The Frequency concept (NL-CM:4.15.4) of zib BowelFunction, represented as a distinct Observation resource."
* hasMember[defecationConsistency] ^definition = "The DefecationConsistency concept (NL-CM:4.15.9) of zib BowelFunction, represented as a distinct Observation resource."
* hasMember[defecationColor] ^definition = "The DefecationColor concept (NL-CM:4.15.10) of zib BowelFunction, represented as a distinct Observation resource."

Mapping: NlbaseBowelFunction-to-zib-bowelfunction-v3.1.1-2020EN
Id: zib-bowelfunction-v3.1.1-2020EN
Title: "zib BowelFunction-v3.1.1(2020EN)"
Source: NlbaseBowelFunction
Target: "https://zibs.nl/wiki/BowelFunction-v3.1.1(2020EN)"
*  -> "NL-CM:4.15.1" "BowelFunction"
* extension[stoma].value[x] -> "NL-CM:4.15.3" "Stoma"
* extension[incontinenceMaterial].value[x] -> "NL-CM:4.15.6" "IncontinenceMaterial"
* note.text -> "NL-CM:4.15.7" "Comment"
