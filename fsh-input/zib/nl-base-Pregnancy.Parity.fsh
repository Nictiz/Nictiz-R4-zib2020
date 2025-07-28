Profile: NlbasePregnancyParity
Parent: Observation
Id: nl-base-Pregnancy.Parity
Title: "nl base Pregnancy.Parity"
* insert ProfileMetadata(nl-base-Pregnancy.Parity)
* ^purpose = "This Observation resource represents the Parity concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Pregnancy v4.0 (2020)](https://zibs.nl/wiki/Pregnancy-v4.0(2020EN))."

* code = http://snomed.info/sct#364325004
* value[x] insert Discriminator(type, $this)
* valueInteger only integer

// Short, alias, definition and comment texts
* ^description = "Pregnancy or gravidity is the condition in which a woman carries a fertilized egg, which grows into an embryo and then a fetus. A pregnancy of between 37 and 42 weeks is considered normal. “Term pregnancy” is 37 to 42 weeks. The term gravidity is also used for the number of times a woman has been pregnant. This and parity - the number of times a woman has given birth - provides insight into the patient’s obstetric history."
* . ^comment = "This profile on the Observation resource represents the Parity concept (NL-CM:7.14.6) of zib Pregnancy. It can be used together with the [nl-base-Pregnancy](http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* valueInteger
  * ^short = "Parity"
  * ^alias[+] = "Pariteit"
  * ^definition = "Number of previous pregnancies ending in partum (>= 16w 0d / 112 days)."

Mapping: NlbasePregnancyParity-to-zib-pregnancy-v4.0-2020EN
Id: zib-pregnancy-v4.0-2020EN
Title: "zib Pregnancy-v4.0(2020EN)"
Source: NlbasePregnancyParity
Target: "https://zibs.nl/wiki/Pregnancy-v4.0(2020EN)"
* valueInteger -> "NL-CM:7.14.6" "Parity"
