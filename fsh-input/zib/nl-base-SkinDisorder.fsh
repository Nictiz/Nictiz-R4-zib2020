Profile: NlbaseSkinDisorder
Parent: Condition
Id: nl-base-SkinDisorder
Title: "nl base SkinDisorder"
* insert ProfileMetadata(nl-base-SkinDisorder)
* insert Purpose(SkinDisorder, 3.3, Observation)

* extension contains
    http://hl7.org/fhir/StructureDefinition/condition-dueTo named cause 0..1
* extension[cause].value[x] only Reference(Condition or Procedure or MedicationAdministration or Immunization or MedicationStatement or http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)
* category insert Discriminator(value, $this)
* category contains
    skinDisorderCode 0..1
* category[skinDisorderCode] = http://snomed.info/sct#95320005
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.19.3.1--20200901000000 (preferred)
* bodySite insert PatternNlBaseAnatomicalLocation
* onset[x] insert Discriminator(type, $this)
* onsetDateTime only dateTime

// Short, alias, definition and comment texts
* ^description = "A skin condition is a disturbance of the organ skin caused by a source to be specified later on."
* .
  * ^short = "SkinDisorder"
  * ^alias[+] = "Huidaandoening"
* extension[cause].value[x]
  * ^short = "Cause"
  * ^alias[+] = "Oorzaak"
  * ^definition = "The cause of the problem underlying the skin disorder."
* code
  * ^short = "TypeOfDisorder"
  * ^alias[+] = "SoortAandoening"
  * ^definition = "A description of the patient’s type of skin disorder."
* bodySite
  * ^short = "Location / AnatomicalLocation"
  * ^alias[+] = "AnatomischeLocatie"
  * ^definition = "The location of the skin condition on the body."
* onsetDateTime
  * ^short = "DateOfOnset"
  * ^alias[+] = "OntstaansDatum"
  * ^definition = "The date on which the skin condition started. A ‘vague’ date, such as only the year, is permitted."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the skin condition and how to care for it."

Mapping: NlbaseSkinDisorder-to-zib-skindisorder-v3.3-2020EN
Id: zib-skindisorder-v3.3-2020EN
Title: "zib SkinDisorder-v3.3(2020EN)"
Source: NlbaseSkinDisorder
Target: "https://zibs.nl/wiki/SkinDisorder-v3.3(2020EN)"
*  -> "NL-CM:19.3.1" "SkinDisorder"
* extension[cause].value[x] -> "NL-CM:19.3.7" "Cause"
* code -> "NL-CM:19.3.2" "TypeOfDisorder"
* bodySite -> "NL-CM:19.3.9" "Location / AnatomicalLocation"
* onsetDateTime -> "NL-CM:19.3.3" "DateOfOnset"
* note.text -> "NL-CM:19.3.6" "Comment"
