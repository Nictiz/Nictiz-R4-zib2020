Profile: NlbasePregnancyEstimatedDateOfDelivery
Parent: Observation
Id: nl-base-Pregnancy.EstimatedDateOfDelivery
Title: "nl base Pregnancy.EstimatedDateOfDelivery"
* insert ProfileMetadata(nl-base-Pregnancy.EstimatedDateOfDelivery)
* ^purpose = "This Observation resource represents the EstimatedDateOfDelivery concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Pregnancy v4.0 (2020)](https://zibs.nl/wiki/Pregnancy-v4.0(2020EN))."

* code = http://snomed.info/sct#161714006
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueDateTime only dateTime
* method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.14.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Pregnancy or gravidity is the condition in which a woman carries a fertilized egg, which grows into an embryo and then a fetus. A pregnancy of between 37 and 42 weeks is considered normal. “Term pregnancy” is 37 to 42 weeks. The term gravidity is also used for the number of times a woman has been pregnant. This and parity - the number of times a woman has given birth - provides insight into the patient’s obstetric history."
* . ^comment = "This profile on the Observation resource represents the EstimatedDateOfDelivery concept (NL-CM:7.14.3) of zib Pregnancy. It can be used together with the [nl-base-Pregnancy](http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* effectiveDateTime
  * ^short = "DateOfEstimation"
  * ^alias[+] = "DatumBepaling"
  * ^definition = "Date on which the delivery date is estimated."
* valueDateTime
  * ^short = "EstimatedDateOfDelivery"
  * ^alias[+] = "ATermeDatum"
  * ^definition = "The date on which the pregnancy is expected to be 40w 0d (280 days). Different due dates are used at various points in the pregnancy."
* method
  * ^short = "EstimatingMethod"
  * ^alias[+] = "BepalingsMethode"
  * ^definition = "Method by which the delivery date is estimated."

Mapping: NlbasePregnancyEstimatedDateOfDelivery-to-zib-pregnancy-v4.0-2020EN
Id: zib-pregnancy-v4.0-2020EN
Title: "zib Pregnancy-v4.0(2020EN)"
Source: NlbasePregnancyEstimatedDateOfDelivery
Target: "https://zibs.nl/wiki/Pregnancy-v4.0(2020EN)"
* effectiveDateTime -> "NL-CM:7.14.11" "DateOfEstimation"
* valueDateTime -> "NL-CM:7.14.3" "EstimatedDateOfDelivery"
* method -> "NL-CM:7.14.10" "EstimatingMethod"
