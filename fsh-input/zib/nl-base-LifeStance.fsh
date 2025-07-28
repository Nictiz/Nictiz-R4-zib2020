Profile: NlbaseLifeStance
Parent: Observation
Id: nl-base-LifeStance
Title: "nl base LifeStance"
* insert ProfileMetadata(nl-base-LifeStance)
* insert Purpose(LifeStance, 3.2, Observation)

* code = http://snomed.info/sct#160538000
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.5.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Patient’s life stance and/or religion."
* .
  * ^short = "LifeStanceRC"
  * ^alias[+] = "LevensovertuigingRC"
  * ^comment = "Please note: a core extension exists to communicate the religious affiliations of a Patient: <http://hl7.org/fhir/StructureDefinition/patient-religion>. However, zib LifeStance covers more than just religious affiliations of a Patient (although in actuality the core extension also covers more than just religious affiliations). For this reason, the core extension cannot faithfully represent zib LifeStance. The use of the core extension in addition to this profile is not prohibited, as long as the values don't contradict each other."
* valueCodeableConcept
  * ^short = "LifeStance"
  * ^alias[+] = "Levensovertuiging"
  * ^definition = "Patient’s life stance and/or religion."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Explanation that reflects the importance of religion or life stance for the patient, for example how much value the patient attaches to rituals and the like."

Mapping: NlbaseLifeStance-to-zib-lifestance-v3.2-2020EN
Id: zib-lifestance-v3.2-2020EN
Title: "zib LifeStance-v3.2(2020EN)"
Source: NlbaseLifeStance
Target: "https://zibs.nl/wiki/LifeStance-v3.2(2020EN)"
*  -> "NL-CM:7.5.1" "LifeStanceRC"
* valueCodeableConcept -> "NL-CM:7.5.2" "LifeStance"
* note.text -> "NL-CM:7.5.3" "Comment"
