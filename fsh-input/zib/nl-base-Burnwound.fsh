Profile: NlbaseBurnwound
Parent: Condition
Id: nl-base-Burnwound
Title: "nl base Burnwound"
* insert ProfileMetadata(nl-base-Burnwound)
* insert Purpose(Burnwound, 3.4, Condition)

* category insert Discriminator(value, $this)
* category contains
    burnWoundCode 0..1
* category[burnWoundCode] = http://snomed.info/sct#125666000
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.19.4.3--20200901000000 (preferred)
* bodySite only CodeableConcept
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AnatomicalLocation
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (preferred)
* bodySite.extension[laterality] 0..
* onset[x] insert Discriminator(type, $this)
* onsetDateTime only dateTime
* stage.summary from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.19.4.1--20200901000000 (preferred)
* evidence.detail insert Discriminator(profile, resolve(\))
* evidence.detail contains
    woundCharacteristics 0..
* evidence.detail[woundCharacteristics] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics)

// Short, alias, definition and comment texts
* ^description = """
    A burn wound is a wound caused by skin being exposed to heat for a certain time above a certain critical temperature. Heat above this critical temperature (+/- 40°C) will cause damage to the skin. There are different types of burn wounds, which are categorized according to the depth of the burn wound.
    
    The depth of the burn wound depends on:
    the temperature of the impacting heat;
    the duration of the impact of heat on the skin;
    the source of the burn (e.g. fire, fluid).
    """
* .
  * ^short = "Burnwound"
  * ^alias[+] = "Brandwond"
  * ^comment = """
    The functional model of zib Burnwound represents a condition that needs to be tracked over time, but defines point-in-time assessments about the current state of the wound as well. For this reason, this zib is mapped onto multiple resources: this Condition profile represents the focal resource, while all point-in-time properties are mapped onto Observation and DocumentReference profiles. Those observable properties, in turn, are grouped using the [nl-base-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics) Observation profile, which can be referenced on `Condition.evidence.detail` (see slice "woundCharacteristics").
    
    This model allows to track multiple distinct assessment moments over time in connection with the Condition. For this reason, it is not expected that the Observations for individual outcomes or DocumentReference resources are referenced from or to this Condition resource directly; all references should be channeled through the nl-base-wounds.WoundCharacteristics grouping Observation. Note that the individual Observations are referenced from the grouping Observation, but that the direction for DocumentReference resources is reversed.
    
    This model deviates somewhat from the zib approach. The zib model is meant to group all concepts relevant for a wound into a model, but it doesn't have a concept of changes over time. For this reason, all observable properties have a cardinality of `0..1` on the zib level, but this works out differently in the FHIR model.
    """
* code
  * ^short = "BurnType"
  * ^alias[+] = "BrandwondSoort"
  * ^definition = "Indication of the kind of the burn wound, differentiated into the cause of the injury."
* bodySite
  * ^short = "Location / AnatomicalLocation"
  * ^alias[+] = "AnatomischeLocatie"
  * ^definition = "The location of the burn wound on the body."
* bodySite.extension[laterality].value[x] ^comment = "Please note: this concept represents Laterality concept of both zibs AnatomicalLocation and Burnwound. These concepts are exactly the same: the concept in zib Burnwound is a remnant that was left in error when the concept was migrated to zib AnatomicalLocation. See [ZIB-1951](https://nictiz.atlassian.net/issues/ZIB-1951) for more information."
* onsetDateTime
  * ^short = "DateOfOnset"
  * ^alias[+] = "OntstaansDatum"
  * ^definition = "Date on which the burn wound appeared."
* stage.summary
  * ^short = "Depth"
  * ^alias[+] = "Dieptegraad"
  * ^definition = "Description of the severity of the burn wound, ranging from degree 1 - 3."
* evidence.detail[woundCharacteristics] ^comment = "The functional model of zib Burnwound represents a condition that needs to be tracked over time, but defines point-in-time assessments about the current state of the wound as well. For this reason, this zib is mapped onto multiple resources: this Condition profile represents the focal resource, while all point-in-time observations are mapped onto Observation profiles. See the comment on the root of this profile for further guidance."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the burn wound."

Mapping: NlbaseBurnwound-to-zib-burnwound-v3.4-2020EN
Id: zib-burnwound-v3.4-2020EN
Title: "zib Burnwound-v3.4(2020EN)"
Source: NlbaseBurnwound
Target: "https://zibs.nl/wiki/Burnwound-v3.4(2020EN)"
*  -> "NL-CM:19.4.1" "BurnWound"
* code -> "NL-CM:19.4.9" "BurnType"
* bodySite -> "NL-CM:19.4.12" "AnatomicalLocation"
* bodySite.extension[laterality].value[x] -> "NL-CM:19.4.10" "Laterality"
* onsetDateTime -> "NL-CM:19.4.3" "DateOfOnset"
* stage.summary -> "NL-CM:19.4.2" "Depth"
* note.text -> "NL-CM:19.4.5" "Comment"
