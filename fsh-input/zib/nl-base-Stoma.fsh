Profile: NlbaseStoma
Parent: Condition
Id: nl-base-Stoma
Title: "nl base Stoma"
* insert ProfileMetadata(nl-base-Stoma)
* insert Purpose(Stoma, 3.3, Condition)

* category insert Discriminator(value, $this)
* category contains
    stomaCode 0..1
* category[stomaCode] = http://snomed.info/sct#245857005
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.5.2.1--20200901000000 (preferred)
* bodySite only CodeableConcept
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AnatomicalLocation
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (preferred)
* onset[x] insert Discriminator(type, $this)
* onset[x] only dateTime
* onsetDateTime only dateTime

// Short, alias, definition and comment texts
* ^description = "A stoma is an unnatural, surgically created opening connecting a body cavity with the outside world. A stoma is created e.g. as an exit opening for feces or urine in the event that they cannot leave the body naturally. In the case of a tracheostomy, the stoma is intended to facilitate breathing if that is no longer possible via the oral, nasal and throat cavity."
* .
  * ^short = "Stoma"
  * ^alias[+] = "Stoma"
  * ^comment = "Please note that on a functional level, zib Stoma references zib MedicalDevice, but in FHIR this direction is reversed. Therefore, the concept StomaMaterial (NL-CM:5.2.3) is mapped on `DeviceUseStatement.reasonReference` in profile [nl-base-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice) instead of in this profile."
* code
  * ^short = "StomaType"
  * ^alias[+] = "StomaType"
  * ^definition = "Stoma type indicates which body cavity the stoma is in and the kind of stoma used."
* bodySite
  * ^short = "Location / AnatomicalLocation"
  * ^alias[+] = "AnatomischeLocatie"
  * ^definition = "Anatomical location of the stoma on the patient."
* onsetDateTime
  * ^short = "CreationDate"
  * ^alias[+] = "AanlegDatum"
  * ^definition = "The date on which the stoma was created in the patient. A vague date, such as only the year, is permitted."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the stoma."

Mapping: NlbaseStoma-to-zib-stoma-v3.3-2020EN
Id: zib-stoma-v3.3-2020EN
Title: "zib Stoma-v3.3(2020EN)"
Source: NlbaseStoma
Target: "https://zibs.nl/wiki/Stoma-v3.3(2020EN)"
*  -> "NL-CM:5.2.1" "Stoma"
* code -> "NL-CM:5.2.2" "StomaType"
* bodySite -> "NL-CM:5.2.9" "AnatomicalLocation"
* onsetDateTime -> "NL-CM:5.2.5" "CreationDate"
* note.text -> "NL-CM:5.2.7" "Comment"
