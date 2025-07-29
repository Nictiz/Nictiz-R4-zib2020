Profile: NlcoreLegalSituationLegalStatus
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LegalSituation-LegalStatus
Id: nl-core-LegalSituation-LegalStatus
Title: "nl core LegalSituation LegalStatus"
* insert ProfileMetadata(nl-core-LegalSituation-LegalStatus)
* ^purpose = "This Condition resource represents the LegalStatus concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LegalSituation v2.0 (2020)](https://zibs.nl/wiki/LegalSituation-v2.0(2020EN))."

* category 1..
* category[legalStatusCode] 1..1
* code 1..
* code ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    A legal situation can concern a legal status and/or representation.
    
    The legal status indicates the basis on which the patient is staying in a healthcare organization. This can be either voluntary or involuntary, however the legal status is always determined by a judge.
    """
* .
  * ^alias[+] = "nl-core-LegalSituation-LegalStatus"
  * ^comment = "Zib LegalSituation is implemented using two profiles: this profile implements the LegalStatus concept of the zib, while <http://nictiz.nl/fhir/StructureDefinition/nl-core-LegalSituation-Representation> represents the Representation concept of the zib."
