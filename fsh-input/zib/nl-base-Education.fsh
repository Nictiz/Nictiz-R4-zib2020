Profile: NlbaseEducation
Parent: Observation
Id: nl-base-Education
Title: "nl base Education"
* insert ProfileMetadata(nl-base-Education)
* insert Purpose(Education, 3.2, Observation)

* code = http://snomed.info/sct#105421008
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.9--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Education indicates the highest level of education achieved."
* valueCodeableConcept
  * ^short = "SchoolType"
  * ^alias[+] = "Schooltype"
  * ^definition = "Indication of the highest level of education achieved."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "If deemed relevant, a specification of the degree program can be provided by means of an explanation (e.g.: patient is in medical school)."

Mapping: NlbaseEducation-to-zib-education-v3.2-2020EN
Id: zib-education-v3.2-2020EN
Title: "zib Education-v3.2(2020EN)"
Source: NlbaseEducation
Target: "https://zibs.nl/wiki/Education-v3.2(2020EN)"
* valueCodeableConcept -> "NL-CM:7.10.2" "SchoolType"
* note.text -> "NL-CM:7.10.3" "Comment"
