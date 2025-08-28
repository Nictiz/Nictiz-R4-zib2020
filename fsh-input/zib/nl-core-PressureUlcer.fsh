Profile: NlcorePressureUlcer
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-PressureUlcer
Id: nl-core-PressureUlcer
Title: "nl core PressureUlcer"
* insert ProfileMetadata(nl-core-PressureUlcer)
* insert Purpose(PressureUlcer, 3.4, Condition)

* insert NlCorePatientForCondition
* bodySite ..1
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AnatomicalLocation
* bodySite ^binding.strength = #required
* stage ..1
* stage.summary ^binding.strength = #required
* evidence.detail[woundCharacteristics] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics)
* note ..1

// Short, alias, definition and comment texts
* ^description = """
    A pressure ulcer is localized damage to the skin and/or underlying tissue, often over a bony prominence, as a result of pressure or pressure combined with friction.
    A pressure ulcer involves a major disease burden and reduces the quality of life for a patient. Adequate risk evaluation, prevention and treatment of pressure ulcers can lead to a fewer incidences and prevalence of pressure ulcers.
    """
* .
  * ^alias[+] = "nl-core-PressureUlcer"
  * ^comment = """
    The functional model of zib PressureUlcer represents a condition that needs to be tracked over time, but defines point-in-time assessments about the current state of the wound as well. For this reason, this zib is mapped onto multiple resources: this Condition profile represents the focal resource, while all point-in-time properties are mapped onto Observation and DocumentReference profiles. Those observable properties, in turn, are grouped using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) Observation profile, which can be referenced on `Condition.evidence.detail` (see slice "woundCharacteristics").
    
    This model allows to track multiple distinct assessment moments over time in connection with the Condition. For this reason, it is not expected that the Observations for individual outcomes or DocumentReference resources are referenced from or to this Condition resource directly; all references should be channeled through the nl-core-wounds.WoundCharacteristics grouping Observation. Note that the individual Observations are referenced from the grouping Observation, but that the direction for DocumentReference resources is reversed.
    
    This model deviates somewhat from the zib approach. The zib model is meant to group all concepts relevant for a wound into a model, but it doesn't have a concept of changes over time. For this reason, all observable properties have a cardinality of `0..1` on the zib level, but this works out differently in the FHIR model.
    """
