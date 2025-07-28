Profile: NlbaseLegalSituationLegalStatus
Parent: Condition
Id: nl-base-LegalSituation-LegalStatus
Title: "nl base LegalSituation LegalStatus"
* insert ProfileMetadata(nl-base-LegalSituation-LegalStatus)
* ^purpose = "This Condition resource represents the LegalStatus concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LegalSituation v2.0 (2020)](https://zibs.nl/wiki/LegalSituation-v2.0(2020EN))."

* category insert Discriminator(value, $this)
* category contains
    legalStatusCode 0..1
* category[legalStatusCode] = http://snomed.info/sct#303186005
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.17.1--20200901000000 (preferred)
* onset[x] insert Discriminator(type, $this)
* onsetDateTime only dateTime
* abatement[x] insert Discriminator(type, $this)
* abatementDateTime only dateTime

// Short, alias, definition and comment texts
* ^description = """
    A legal situation can concern a legal status and/or representation.
    
    The legal status indicates the basis on which the patient is staying in a healthcare organization. This can be either voluntary or involuntary, however the legal status is always determined by a judge.
    """
* .
  * ^short = "LegalSituation"
  * ^alias[+] = "JuridischeSituatie"
  * ^comment = "Zib LegalSituation is implemented using two profiles: this profile implements the LegalStatus concept of the zib, while <http://nictiz.nl/fhir/StructureDefinition/nl-base-LegalSituation-Representation> represents the Representation concept of the zib."
* code
  * ^short = "LegalStatus"
  * ^alias[+] = "JuridischeStatus"
  * ^definition = "The legal status that applies to the patient. The legal status indicates the basis on which the patient is staying in a healthcare organization. This can be either voluntary or involuntary, however the legal status is always determined by a judge. A patient can also receive healthcare based on a forensic status."
* onsetDateTime
  * ^short = "DateStart"
  * ^alias[+] = "DatumAanvang"
  * ^definition = "The date on which the legal situation of the patient starts."
* abatementDateTime
  * ^short = "DateStop"
  * ^alias[+] = "DatumEinde"
  * ^definition = "The date on which the legal situation of the patient ends."

Mapping: NlbaseLegalSituationLegalStatus-to-zib-legalsituation-v2.0-2020EN
Id: zib-legalsituation-v2.0-2020EN
Title: "zib LegalSituation-v2.0(2020EN)"
Source: NlbaseLegalSituationLegalStatus
Target: "https://zibs.nl/wiki/LegalSituation-v2.0(2020EN)"
*  -> "NL-CM:7.17.1" "LegalSituation"
* code -> "NL-CM:7.17.2" "LegalStatus"
* onsetDateTime -> "NL-CM:7.17.3" "DateStart"
* abatementDateTime -> "NL-CM:7.17.4" "DateStop"
