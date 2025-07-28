Profile: NlbasePregnancyDateLastMenstruation
Parent: Observation
Id: nl-base-Pregnancy.DateLastMenstruation
Title: "nl base Pregnancy.DateLastMenstruation"
* insert ProfileMetadata(nl-base-Pregnancy.DateLastMenstruation)
* ^purpose = "This Observation resource represents the DateLastMenstruation concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Pregnancy v4.0 (2020)](https://zibs.nl/wiki/Pregnancy-v4.0(2020EN))."

* code = http://snomed.info/sct#21840007
* value[x] insert Discriminator(type, $this)
* valueDateTime only dateTime

// Short, alias, definition and comment texts
* ^description = "Pregnancy or gravidity is the condition in which a woman carries a fertilized egg, which grows into an embryo and then a fetus. A pregnancy of between 37 and 42 weeks is considered normal. “Term pregnancy” is 37 to 42 weeks. The term gravidity is also used for the number of times a woman has been pregnant. This and parity - the number of times a woman has given birth - provides insight into the patient’s obstetric history."
* . ^comment = "This profile on the Observation resource represents the DateLastMenstruation concept (NL-CM:7.14.8) of zib Pregnancy. It can be used together with the [nl-base-Pregnancy](http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* valueDateTime
  * ^short = "DateLastMenstruation"
  * ^alias[+] = "DatumLaatsteMenstruatie"
  * ^definition = "The date on which the last menstruation started."

Mapping: NlbasePregnancyDateLastMenstruation-to-zib-pregnancy-v4.0-2020EN
Id: zib-pregnancy-v4.0-2020EN
Title: "zib Pregnancy-v4.0(2020EN)"
Source: NlbasePregnancyDateLastMenstruation
Target: "https://zibs.nl/wiki/Pregnancy-v4.0(2020EN)"
* valueDateTime -> "NL-CM:7.14.8" "DateLastMenstruation"
