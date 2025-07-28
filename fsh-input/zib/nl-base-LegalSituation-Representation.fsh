Profile: NlbaseLegalSituationRepresentation
Parent: Condition
Id: nl-base-LegalSituation-Representation
Title: "nl base LegalSituation Representation"
* insert ProfileMetadata(nl-base-LegalSituation-Representation)
* ^purpose = "This Condition resource represents the Representation concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LegalSituation v2.0 (2020)](https://zibs.nl/wiki/LegalSituation-v2.0(2020EN))."

* category insert Discriminator(value, $this)
* category contains
    representationCode 0..1
* category[representationCode] = http://snomed.info/sct#151701000146105
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.17.2--20200901000000 (preferred)
* onset[x] insert Discriminator(type, $this)
* onsetDateTime only dateTime
* abatement[x] insert Discriminator(type, $this)
* abatementDateTime only dateTime

// Short, alias, definition and comment texts
* ^description = """
    A legal situation can concern a legal status and/or representation.
    
    Representation is important in situations where a person is legally not competent to give permission and/or factually (partly) incapable of doing so. A representative supports and takes decisions in the interest of the representee when they cannot do so themselves (temporarily or permanently).
    """
* .
  * ^short = "LegalSituation"
  * ^alias[+] = "JuridischeSituatie"
  * ^comment = "Zib LegalSituation is implemented using two profiles: this profile implements the Representation concept of the zib, while <http://nictiz.nl/fhir/StructureDefinition/nl-base-LegalSituation-LegalStatus> represents the LegalStatus concept of the zib."
* code
  * ^short = "Representation"
  * ^alias[+] = "Vertegenwoordiging"
  * ^definition = "In some situations, a person is legally not competent to give permission and/or factually (partly) incapable of doing so. A representative supports and takes decisions in the interest of the representee when they cannot do so themselves (temporarily or permanently). The representative should involve the patient as much as possible in the fulfillment of their tasks and the factual capability of the patient must be honored as much as possible. The Wgbo (Dutch law) determines who are able to become representatives as well as an enforced order."
* onsetDateTime
  * ^short = "DateStart"
  * ^alias[+] = "DatumAanvang"
  * ^definition = "The date on which the legal situation of the patient starts."
* abatementDateTime
  * ^short = "DateStop"
  * ^alias[+] = "DatumEinde"
  * ^definition = "The date on which the legal situation of the patient ends."

Mapping: NlbaseLegalSituationRepresentation-to-zib-legalsituation-v2.0-2020EN
Id: zib-legalsituation-v2.0-2020EN
Title: "zib LegalSituation-v2.0(2020EN)"
Source: NlbaseLegalSituationRepresentation
Target: "https://zibs.nl/wiki/LegalSituation-v2.0(2020EN)"
*  -> "NL-CM:7.17.1" "LegalSituation"
* code -> "NL-CM:7.17.5" "Representation"
* onsetDateTime -> "NL-CM:7.17.3" "DateStart"
* abatementDateTime -> "NL-CM:7.17.4" "DateStop"
