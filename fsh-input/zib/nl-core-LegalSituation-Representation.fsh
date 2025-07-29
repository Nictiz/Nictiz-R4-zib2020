Profile: NlcoreLegalSituationRepresentation
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LegalSituation-Representation
Id: nl-core-LegalSituation-Representation
Title: "nl core LegalSituation Representation"
* insert ProfileMetadata(nl-core-LegalSituation-Representation)
* ^purpose = "This Condition resource represents the Representation concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LegalSituation v2.0 (2020)](https://zibs.nl/wiki/LegalSituation-v2.0(2020EN))."

* category 1..
* category[representationCode] 1..1
* code 1..
* code ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    A legal situation can concern a legal status and/or representation.
    
    Representation is important in situations where a person is legally not competent to give permission and/or factually (partly) incapable of doing so. A representative supports and takes decisions in the interest of the representee when they cannot do so themselves (temporarily or permanently).
    """
* .
  * ^alias[+] = "nl-core-LegalSituation-Representation"
  * ^comment = "Zib LegalSituation is implemented using two profiles: this profile implements the Representation concept of the zib, while <http://nictiz.nl/fhir/StructureDefinition/nl-core-LegalSituation-LegalStatus> represents the LegalStatus concept of the zib."
