Profile: NlcorePregnancyPregnancyDuration
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy.PregnancyDuration
Id: nl-core-Pregnancy.PregnancyDuration
Title: "nl core Pregnancy.PregnancyDuration"
* insert ProfileMetadata(nl-core-Pregnancy.PregnancyDuration)
* ^purpose = "This Observation resource represents the PregnancyDuration concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Pregnancy v4.0 (2020)](https://zibs.nl/wiki/Pregnancy-v4.0(2020EN))."

* subject only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)

// Short, alias, definition and comment texts
* ^description = "Pregnancy or gravidity is the condition in which a woman carries a fertilized egg, which grows into an embryo and then a fetus. A pregnancy of between 37 and 42 weeks is considered normal. “Term pregnancy” is 37 to 42 weeks. The term gravidity is also used for the number of times a woman has been pregnant. This and parity - the number of times a woman has given birth - provides insight into the patient’s obstetric history."
* .
  * ^alias[+] = "nl-core-Pregnancy.PregnancyDuration"
  * ^comment = "This profile on the Observation resource represents the PregnancyDuration concept (NL-CM:7.14.4) of zib Pregnancy. It can be used together with the [nl-core-Pregnancy](http://nictiz.nl/fhir/StructureDefinition/nl-core-Pregnancy) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
