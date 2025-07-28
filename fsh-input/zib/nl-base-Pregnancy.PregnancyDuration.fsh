Profile: NlbasePregnancyPregnancyDuration
Parent: Observation
Id: nl-base-Pregnancy.PregnancyDuration
Title: "nl base Pregnancy.PregnancyDuration"
* insert ProfileMetadata(nl-base-Pregnancy.PregnancyDuration)
* ^purpose = "This Observation resource represents the PregnancyDuration concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Pregnancy v4.0 (2020)](https://zibs.nl/wiki/Pregnancy-v4.0(2020EN))."

* code = http://snomed.info/sct#57036006
* value[x] insert Discriminator(type, $this)
* valueQuantity only Quantity

// Short, alias, definition and comment texts
* ^description = "Pregnancy or gravidity is the condition in which a woman carries a fertilized egg, which grows into an embryo and then a fetus. A pregnancy of between 37 and 42 weeks is considered normal. “Term pregnancy” is 37 to 42 weeks. The term gravidity is also used for the number of times a woman has been pregnant. This and parity - the number of times a woman has given birth - provides insight into the patient’s obstetric history."
* . ^comment = "This profile on the Observation resource represents the PregnancyDuration concept (NL-CM:7.14.4) of zib Pregnancy. It can be used together with the [nl-base-Pregnancy](http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* valueQuantity
  * ^short = "PregnancyDuration"
  * ^alias[+] = "Zwangerschapsduur"
  * ^definition = "Duration of the pregnancy on the day on which the patient was asked. The duration can be given in days (d) or weeks (wk)."

Mapping: NlbasePregnancyPregnancyDuration-to-zib-pregnancy-v4.0-2020EN
Id: zib-pregnancy-v4.0-2020EN
Title: "zib Pregnancy-v4.0(2020EN)"
Source: NlbasePregnancyPregnancyDuration
Target: "https://zibs.nl/wiki/Pregnancy-v4.0(2020EN)"
* valueQuantity -> "NL-CM:7.14.4" "PregnancyDuration"
