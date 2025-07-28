Profile: NlbaseVisualFunction
Parent: Observation
Id: nl-base-VisualFunction
Title: "nl base VisualFunction"
* insert ProfileMetadata(nl-base-VisualFunction)
* insert Purpose(VisualFunction, 3.1, Observation)

* extension contains
    http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo named visualAid 0..*
* extension[visualAid].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/Resource or http://nictiz.nl/fhir/StructureDefinition/nl-base-VisualFunction.VisualAid)
* code = http://snomed.info/sct#281004000
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept

// Short, alias, definition and comment texts
* ^description = """
    Sight is the ability to observe lit objects, with the goal of orienting yourself on objects and people in a lit environment. This pertains to observing the light stimuli, and not processing them in the brain.
    A sight disorder can lead to things including orientation problems.
    """
* .
  * ^short = "VisualFunction"
  * ^alias[+] = "FunctieZien"
* extension[visualAid].value[x]
  * ^short = "VisualAid"
  * ^alias[+] = "ZienHulpmiddel"
  * ^definition = "The medical aids used to support the visual function."
* valueCodeableConcept
  * ^short = "VisualFunction"
  * ^alias[+] = "VisueleFunctie"
  * ^definition = "The ability to see as a result of response to stimuli of visual organs."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the visual function."

Mapping: NlbaseVisualFunction-to-zib-visualfunction-v3.1-2020EN
Id: zib-visualfunction-v3.1-2020EN
Title: "zib VisualFunction-v3.1(2020EN)"
Source: NlbaseVisualFunction
Target: "https://zibs.nl/wiki/VisualFunction-v3.1(2020EN)"
*  -> "NL-CM:4.16.1" "VisualFunction"
* extension[visualAid].value[x] -> "NL-CM:4.16.4" "VisualAid"
* valueCodeableConcept -> "NL-CM:4.16.3" "VisualFunction"
* note.text -> "NL-CM:4.16.2" "Comment"
