Profile: NlcorewoundsWoundCharacteristics
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics
Id: nl-core-wounds.WoundCharacteristics
Title: "nl core wounds.WoundCharacteristics"
* insert ProfileMetadata(nl-core-wounds.WoundCharacteristics)
* ^purpose = "This Observation profile groups multiple observable properties of wounds that are used in the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Burnwound v3.4 (2020)](https://zibs.nl/wiki/Burnwound-v3.4(2020EN)), the Dutch [zib PressureUlcer v3.4 (2020)](https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)) and the Dutch [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN))."

* hasMember[dateOfLastDressingChange] ..1
* hasMember[dateOfLastDressingChange] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.DateOfLastDressingChange)
* hasMember[woundLength] ..1
* hasMember[woundLength] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundLength)
* hasMember[woundWidth] ..1
* hasMember[woundWidth] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundWidth)
* hasMember[woundDepth] ..1
* hasMember[woundDepth] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundDepth)
* hasMember[woundTissue] ..1
* hasMember[woundTissue] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Wound.WoundTissue)
* hasMember[woundInfection] ..1
* hasMember[woundInfection] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Wound.WoundInfection)
* hasMember[woundMoisture] ..1
* hasMember[woundMoisture] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Wound.WoundMoisture)
* hasMember[woundEdge] ..1
* hasMember[woundEdge] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Wound.WoundEdge)
* hasMember[extent] ..1
* hasMember[extent] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Burnwound.Extent)

// Short, alias, definition and comment texts
* ^description = "Observable properties of a wound, burnwound or pressureulcer."
* .
  * ^alias[+] = "nl-core-wounds.WoundCharacteristics"
  * ^comment = """
    The functional models of zibs Burnwound, PressureUlcer and Wound represent conditions that need to be tracked over time, but define point-in-time assessments about the current state of the wounds as well. For this reason, these three zibs are all mapped onto multiple resources: a Condition resource that represents the focal resource, and Observation and DocumentReference resources for all observable properties.
    
    Since multiple observable properties are usually assessed together, all Observation and DocumentReference resources resulting from a single assessment are grouped using the current Observation profile. For the Observation resources, this is done using `Observation.hasMember`. For the DocumentReference resources, the direction is reversed, so the current resource is referenced *from* `DocumentReference.context.related` in profile [nl-core-wounds.WoundImage](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundImage). It is this grouping Observation that is referenced from the Condition resources, on `Condition.evidence.detail`.
    
    This model allows to track multiple distinct assessment moments over time in connection with the Condition. For this reason, it is not expected that the Observations and DocumentReferences for individual outcomes are referenced directly from and to the Condition resources; all references should be referenced through this grouping Observation.
    
    Note that this model deviates somewhat from the zib approach. The zib model is meant to group all concepts relevant for a wound into a model, but it doesn't have a concept of changes over time. For this reason, all observable properties have a cardinality of `0..1` on the zib level, but this works out differently in the FHIR model.
    """
