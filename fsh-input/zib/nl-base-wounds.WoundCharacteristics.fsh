Profile: NlbasewoundsWoundCharacteristics
Parent: Observation
Id: nl-base-wounds.WoundCharacteristics
Title: "nl base wounds.WoundCharacteristics"
* insert ProfileMetadata(nl-base-wounds.WoundCharacteristics)
* ^purpose = "This Observation profile groups multiple observable properties of wounds that are used in the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Burnwound v3.4 (2020)](https://zibs.nl/wiki/Burnwound-v3.4(2020EN)), the Dutch [zib PressureUlcer v3.4 (2020)](https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)) and the Dutch [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN))."

* code = http://snomed.info/sct#225552003
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    dateOfLastDressingChange 0..1 and
    woundLength 0..1 and
    woundWidth 0..1 and
    woundDepth 0..1 and
    woundTissue 0..1 and
    woundInfection 0..1 and
    woundMoisture 0..1 and
    woundEdge 0..1 and
    extent 0..1
* hasMember[dateOfLastDressingChange] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.DateOfLastDressingChange)
* hasMember[woundLength] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundLength)
* hasMember[woundWidth] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundWidth)
* hasMember[woundDepth] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundDepth)
* hasMember[woundTissue] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound.WoundTissue)
* hasMember[woundInfection] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound.WoundInfection)
* hasMember[woundMoisture] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound.WoundMoisture)
* hasMember[woundEdge] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Wound.WoundEdge)
* hasMember[extent] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Burnwound.Extent)

// Short, alias, definition and comment texts
* ^description = "Observable properties of a wound, burnwound or pressureulcer."
* . ^comment = """
    The functional models of zibs Burnwound, PressureUlcer and Wound represent conditions that need to be tracked over time, but define point-in-time assessments about the current state of the wounds as well. For this reason, these three zibs are all mapped onto multiple resources: a Condition resource that represents the focal resource, and Observation and DocumentReference resources for all observable properties.
    
    Since multiple observable properties are usually assessed together, all Observation and DocumentReference resources resulting from a single assessment are grouped using the current Observation profile. For the Observation resources, this is done using `Observation.hasMember`. For the DocumentReference resources, the direction is reversed, so the current resource is referenced *from* `DocumentReference.context.related` in profile [nl-base-wounds.WoundImage](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundImage). It is this grouping Observation that is referenced from the Condition resources, on `Condition.evidence.detail`.
    
    This model allows to track multiple distinct assessment moments over time in connection with the Condition. For this reason, it is not expected that the Observations and DocumentReferences for individual outcomes are referenced directly from and to the Condition resources; all references should be referenced through this grouping Observation.
    
    Note that this model deviates somewhat from the zib approach. The zib model is meant to group all concepts relevant for a wound into a model, but it doesn't have a concept of changes over time. For this reason, all observable properties have a cardinality of `0..1` on the zib level, but this works out differently in the FHIR model.
    """

Mapping: NlbasewoundsWoundCharacteristics-to-zib-burnwound-v3.4-2020EN
Id: zib-burnwound-v3.4-2020EN
Title: "zib Burnwound-v3.4(2020EN)"
Source: NlbasewoundsWoundCharacteristics
Target: "https://zibs.nl/wiki/Burnwound-v3.4(2020EN)"

Mapping: NlbasewoundsWoundCharacteristics-to-zib-pressureulcer-v3.4-2020EN
Id: zib-pressureulcer-v3.4-2020EN
Title: "zib PressureUlcer-v3.4(2020EN)"
Source: NlbasewoundsWoundCharacteristics
Target: "https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)"

Mapping: NlbasewoundsWoundCharacteristics-to-zib-wound-v3.3-2020EN
Id: zib-wound-v3.3-2020EN
Title: "zib Wound-v3.3(2020EN)"
Source: NlbasewoundsWoundCharacteristics
Target: "https://zibs.nl/wiki/Wound-v3.3(2020EN)"
