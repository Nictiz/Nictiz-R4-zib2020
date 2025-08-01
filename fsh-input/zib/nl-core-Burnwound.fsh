Profile: NlcoreBurnwound
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Burnwound
Id: nl-core-Burnwound
Title: "nl core Burnwound"
* insert ProfileMetadata(nl-core-Burnwound)
* insert Purpose(Burnwound, 3.4, Condition)

* category 1..
* category[burnWoundCode] 1..1
* code ^binding.strength = #extensible
* bodySite ..1
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AnatomicalLocation
* bodySite ^binding.strength = #required
* bodySite.extension[laterality].value[x] ^binding.strength = #required
* insert NlCorePatientForCondition
* stage ..1
* stage.summary ^binding.strength = #required
* evidence.detail[woundCharacteristics] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics)
* note ..1

// Short, alias, definition and comment texts
* ^description = """
    A burn wound is a wound caused by skin being exposed to heat for a certain time above a certain critical temperature. Heat above this critical temperature (+/- 40°C) will cause damage to the skin. There are different types of burn wounds, which are categorized according to the depth of the burn wound.
    
    The depth of the burn wound depends on:
    the temperature of the impacting heat;
    the duration of the impact of heat on the skin;
    the source of the burn (e.g. fire, fluid).
    """
* .
  * ^alias[+] = "nl-core-Burnwound"
  * ^comment = """
    The functional model of zib Burnwound represents a condition that needs to be tracked over time, but defines point-in-time assessments about the current state of the wound as well. For this reason, this zib is mapped onto multiple resources: this Condition profile represents the focal resource, while all point-in-time properties are mapped onto Observation and DocumentReference profiles. Those observable properties, in turn, are grouped using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) Observation profile, which can be referenced on `Condition.evidence.detail` (see slice "woundCharacteristics").
    
    This model allows to track multiple distinct assessment moments over time in connection with the Condition. For this reason, it is not expected that the Observations for individual outcomes or DocumentReference resources are referenced from or to this Condition resource directly; all references should be channeled through the nl-core-wounds.WoundCharacteristics grouping Observation. Note that the individual Observations are referenced from the grouping Observation, but that the direction for DocumentReference resources is reversed.
    
    This model deviates somewhat from the zib approach. The zib model is meant to group all concepts relevant for a wound into a model, but it doesn't have a concept of changes over time. For this reason, all observable properties have a cardinality of `0..1` on the zib level, but this works out differently in the FHIR model.
    """
