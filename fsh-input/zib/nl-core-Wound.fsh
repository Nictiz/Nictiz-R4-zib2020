Profile: NlcoreWound
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound
Id: nl-core-Wound
Title: "nl core Wound"
* insert ProfileMetadata(nl-core-Wound)
* insert Purpose(Wound, 3.3, Condition)

* category 1..
* category[woundCode] 1..1
* code ^binding.strength = #extensible
* insert NlCorePatientForCondition
* bodySite ..1
* bodySite insert PatternNlCoreAnatomicalLocation
* evidence.detail[woundCharacteristics] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics)
* note ..1

// Short, alias, definition and comment texts
* ^description = """
    A wound is an interruption of the continuity of the skin, often caused by external influences.
    A commonly used model for documenting the wound properties is the TIME (‘Tissue’, ‘Infection’, ‘Moisture’, ‘Edge’) model, which can be used to systematically describe the wound. For wound tissue (T in the TIME model), the structure of the WCS model (Woundcare Consultant Society, WCS Kenniscentrum Wondzorg) is used. The WCS model is not suited for describing oncological ulcers. There is a separate classification for that.
    Oncological ulcers are skin defects which result from the tumor process. They are different from wounds resulting from cancer treatment, such as radiotherapy, chemotherapy or surgery.
    
    The concept does not describe decubitus wounds and burn wounds. For these, the relevant information models can be used.
    """
* .
  * ^alias[+] = "nl-core-Wound"
  * ^comment = """
    The functional model of zib Wound represents a condition that needs to be tracked over time, but defines point-in-time assessments about the current state of the wound as well. For this reason, this zib is mapped onto multiple resources: this Condition profile represents the focal resource, while all point-in-time properties are mapped onto Observation and DocumentReference profiles. Those observable properties, in turn, are grouped using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) Observation profile, which can be referenced on `Condition.evidence.detail` (see slice "woundCharacteristics").
    
    This model allows to track multiple distinct assessment moments over time in connection with the Condition. For this reason, it is not expected that the Observations for individual outcomes or DocumentReference resources are referenced from or to this Condition resource directly; all references should be channeled through the nl-core-wounds.WoundCharacteristics grouping Observation. Note that the individual Observations are referenced from the grouping Observation, but that the direction for DocumentReference resources is reversed.
    
    This model deviates somewhat from the zib approach. The zib model is meant to group all concepts relevant for a wound into a model, but it doesn't have a concept of changes over time. For this reason, all observable properties have a cardinality of `0..1` on the zib level, but this works out differently in the FHIR model.
    """
