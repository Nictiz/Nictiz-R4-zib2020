Profile: NlbaseWound
Parent: Condition
Id: nl-base-Wound
Title: "nl base Wound"
* insert ProfileMetadata(nl-base-Wound)
* insert Purpose(Wound, 3.3, Condition)

* category insert Discriminator(value, $this)
* category contains
    woundCode 0..1
* category[woundCode] = http://snomed.info/sct#416462003
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.19.2.4--20200901000000 (preferred)
* bodySite only CodeableConcept
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AnatomicalLocation
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (preferred)
* onset[x] insert Discriminator(type, $this)
* onsetDateTime only dateTime
* evidence.detail insert Discriminator(profile, resolve(\))
* evidence.detail contains
    woundCharacteristics 0..
* evidence.detail[woundCharacteristics] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics)

// Short, alias, definition and comment texts
* ^description = """
    A wound is an interruption of the continuity of the skin, often caused by external influences.
    A commonly used model for documenting the wound properties is the TIME (‘Tissue’, ‘Infection’, ‘Moisture’, ‘Edge’) model, which can be used to systematically describe the wound. For wound tissue (T in the TIME model), the structure of the WCS model (Woundcare Consultant Society, WCS Kenniscentrum Wondzorg) is used. The WCS model is not suited for describing oncological ulcers. There is a separate classification for that.
    Oncological ulcers are skin defects which result from the tumor process. They are different from wounds resulting from cancer treatment, such as radiotherapy, chemotherapy or surgery.
    
    The concept does not describe decubitus wounds and burn wounds. For these, the relevant information models can be used.
    """
* .
  * ^short = "Wound"
  * ^alias[+] = "Wond"
  * ^comment = """
    The functional model of zib Wound represents a condition that needs to be tracked over time, but defines point-in-time assessments about the current state of the wound as well. For this reason, this zib is mapped onto multiple resources: this Condition profile represents the focal resource, while all point-in-time properties are mapped onto Observation and DocumentReference profiles. Those observable properties, in turn, are grouped using the [nl-base-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics) Observation profile, which can be referenced on `Condition.evidence.detail` (see slice \"woundCharacteristics\").
    
    This model allows to track multiple distinct assessment moments over time in connection with the Condition. For this reason, it is not expected that the Observations for individual outcomes or DocumentReference resources are referenced from or to this Condition resource directly; all references should be channeled through the nl-base-wounds.WoundCharacteristics grouping Observation. Note that the individual Observations are referenced from the grouping Observation, but that the direction for DocumentReference resources is reversed.
    
    This model deviates somewhat from the zib approach. The zib model is meant to group all concepts relevant for a wound into a model, but it doesn't have a concept of changes over time. For this reason, all observable properties have a cardinality of `0..1` on the zib level, but this works out differently in the FHIR model.
    """
* code
  * ^short = "WoundType"
  * ^alias[+] = "WondSoort"
  * ^definition = "Description of the type of wound."
* bodySite
  * ^short = "Location / AnatomicalLocation"
  * ^alias[+] = "AnatomischeLocatie"
  * ^definition = "The location of the wound on the body."
* onsetDateTime
  * ^short = "WoundDateOfOnset"
  * ^alias[+] = "WondOntstaansdatum"
  * ^definition = "The date on which the wound appeared."
* evidence.detail[woundCharacteristics] ^comment = "The functional model of zib Wound represents a condition that needs to be tracked over time, but defines point-in-time assessments about the current state of the wound as well. For this reason, this zib is mapped onto multiple resources: this Condition profile represents the focal resource, while all point-in-time observations are mapped onto Observation profiles. See the comment on the root of this profile for further guidance."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the wound."

Mapping: NlbaseWound-to-zib-wound-v3.3-2020EN
Id: zib-wound-v3.3-2020EN
Title: "zib Wound-v3.3(2020EN)"
Source: NlbaseWound
Target: "https://zibs.nl/wiki/Wound-v3.3(2020EN)"
*  -> "NL-CM:19.2.1" "Wound"
* code -> "NL-CM:19.2.5" "WoundType"
* bodySite -> "NL-CM:19.2.19" "AnatomicalLocation"
* onsetDateTime -> "NL-CM:19.2.2" "WoundDateOfOnset"
* note.text -> "NL-CM:19.2.9" "Comment"
