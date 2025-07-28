Extension: ExtLanguageProficiencyCommunicationDetails
Id: ext-LanguageProficiency.CommunicationDetails
Title: "ext LanguageProficiency.CommunicationDetails"
Context: Patient.communication
* insert ProfileMetadata(ext-LanguageProficiency.CommunicationDetails)

* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.12.6--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "An extension to provide additional ways or tools that the person uses to communicate, such as braille, sign language, etc."
* ^purpose = "This extension represents the CommunicationDetails concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LanguageProficiency v3.2 (2020)](https://zibs.nl/wiki/LanguageProficiency-v3.2(2020EN))."
* value[x]
  * ^short = "CommunicationDetails"
  * ^alias[+] = "CommunicatieBijzonderheden"
  * ^definition = "Additional ways or tools that the person uses to communicate, such as braille, sign language, etc."

Mapping: ExtLanguageProficiencyCommunicationDetails-to-zib-languageproficiency-v3.2-2020EN
Id: zib-languageproficiency-v3.2-2020EN
Title: "zib LanguageProficiency-v3.2(2020EN)"
Source: ExtLanguageProficiencyCommunicationDetails
Target: "https://zibs.nl/wiki/LanguageProficiency-v3.2(2020EN)"
* value[x] -> "NL-CM:7.12.9" "CommunicationDetails"
