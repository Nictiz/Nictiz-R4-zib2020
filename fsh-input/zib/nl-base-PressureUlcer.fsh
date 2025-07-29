Profile: NlbasePressureUlcer
Parent: Condition
Id: nl-base-PressureUlcer
Title: "nl base PressureUlcer"
* insert ProfileMetadata(nl-base-PressureUlcer)
* insert Purpose(PressureUlcer, 3.4, Condition)

* code = http://snomed.info/sct#399912005
* bodySite only CodeableConcept
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AnatomicalLocation
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (preferred)
* onset[x] insert Discriminator(type, $this)
* onsetDateTime only dateTime
* stage.summary from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.19.1.1--20200901000000 (preferred)
* evidence.detail insert Discriminator(profile, resolve(\))
* evidence.detail contains
    woundCharacteristics 0..
* evidence.detail[woundCharacteristics] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics)

// Short, alias, definition and comment texts
* ^description = """
    A pressure ulcer is localized damage to the skin and/or underlying tissue, often over a bony prominence, as a result of pressure or pressure combined with friction.
    A pressure ulcer involves a major disease burden and reduces the quality of life for a patient. Adequate risk evaluation, prevention and treatment of pressure ulcers can lead to a fewer incidences and prevalence of pressure ulcers.
    """
* .
  * ^short = "PressureUlcer"
  * ^alias[+] = "DecubitusWond"
  * ^comment = """
    The functional model of zib PressureUlcer represents a condition that needs to be tracked over time, but defines point-in-time assessments about the current state of the wound as well. For this reason, this zib is mapped onto multiple resources: this Condition profile represents the focal resource, while all point-in-time properties are mapped onto Observation and DocumentReference profiles. Those observable properties, in turn, are grouped using the [nl-base-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics) Observation profile, which can be referenced on `Condition.evidence.detail` (see slice "woundCharacteristics").
    
    This model allows to track multiple distinct assessment moments over time in connection with the Condition. For this reason, it is not expected that the Observations for individual outcomes or DocumentReference resources are referenced from or to this Condition resource directly; all references should be channeled through the nl-base-wounds.WoundCharacteristics grouping Observation. Note that the individual Observations are referenced from the grouping Observation, but that the direction for DocumentReference resources is reversed.
    
    This model deviates somewhat from the zib approach. The zib model is meant to group all concepts relevant for a wound into a model, but it doesn't have a concept of changes over time. For this reason, all observable properties have a cardinality of `0..1` on the zib level, but this works out differently in the FHIR model.
    """
* bodySite
  * ^short = "Location / AnatomicalLocation"
  * ^alias[+] = "AnatomischeLocatie"
  * ^definition = "The location of the decubitus wound on the body."
* onsetDateTime
  * ^short = "DateOfOnset"
  * ^alias[+] = "OntstaansDatum"
  * ^definition = "The date on which the pressure ulcer appeared."
* stage.summary
  * ^short = "DecubitusCategory"
  * ^alias[+] = "DecubitusCategorie"
  * ^definition = "Description of the condition of the pressure ulcer, ranging from category 1 - 4."
* evidence.detail[woundCharacteristics] ^comment = "The functional model of zib PressureUlcer represents a condition that needs to be tracked over time, but defines point-in-time assessments about the current state of the wound as well. For this reason, this zib is mapped onto multiple resources: this Condition profile represents the focal resource, while all point-in-time observations are mapped onto Observation profiles. See the comment on the root of this profile for further guidance."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment of the decubitus wound."

Mapping: NlbasePressureUlcer-to-zib-pressureulcer-v3.4-2020EN
Id: zib-pressureulcer-v3.4-2020EN
Title: "zib PressureUlcer-v3.4(2020EN)"
Source: NlbasePressureUlcer
Target: "https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)"
*  -> "NL-CM:19.1.1" "PressureUlcer"
* bodySite -> "NL-CM:19.1.14" "AnatomicalLocation"
* onsetDateTime -> "NL-CM:19.1.3" "DateOfOnset"
* stage.summary -> "NL-CM:19.1.2" "DecubitusCategory"
* note.text -> "NL-CM:19.1.5" "Comment"
