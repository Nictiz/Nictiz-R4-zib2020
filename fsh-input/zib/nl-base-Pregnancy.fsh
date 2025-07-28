Profile: NlbasePregnancy
Parent: Observation
Id: nl-base-Pregnancy
Title: "nl base Pregnancy"
* insert ProfileMetadata(nl-base-Pregnancy)
* insert Purpose(Pregnancy, 4.0, Observation)

* code = http://snomed.info/sct#118185001
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    pregnancyDuration 0..1 and
    parity 0..1 and
    gravidity 0..1 and
    estimatedDateOfDelivery 0..1 and
    dateLastMenstruation 0..1
* hasMember[pregnancyDuration] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy.PregnancyDuration)
* hasMember[parity] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy.Parity)
* hasMember[gravidity] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy.Gravidity)
* hasMember[estimatedDateOfDelivery] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy.EstimatedDateOfDelivery)
* hasMember[dateLastMenstruation] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy.DateLastMenstruation)

// Short, alias, definition and comment texts
* ^description = "Pregnancy or gravidity is the condition in which a woman carries a fertilized egg, which grows into an embryo and then a fetus. A pregnancy of between 37 and 42 weeks is considered normal. “Term pregnancy” is 37 to 42 weeks. The term gravidity is also used for the number of times a woman has been pregnant. This and parity - the number of times a woman has given birth - provides insight into the patient’s obstetric history."
* .
  * ^short = "Pregnancy"
  * ^alias[+] = "Zwangerschap"
  * ^comment = """
    Several concepts of zib Pregnancy are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * [nl-base-Pregnancy.DateLastMenstruation](http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy.DateLastMenstruation)
    * [nl-base-Pregnancy.EstimatedDateOfDelivery](http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy.EstimatedDateOfDelivery)
    * [nl-base-Pregnancy.Gravidity](http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy.Gravidity)
    * [nl-base-Pregnancy.Parity](http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy.Parity)
    * [nl-base-Pregnancy.PregnancyDuration](http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy.PregnancyDuration)
    """
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the pregnancy."

Mapping: NlbasePregnancy-to-zib-pregnancy-v4.0-2020EN
Id: zib-pregnancy-v4.0-2020EN
Title: "zib Pregnancy-v4.0(2020EN)"
Source: NlbasePregnancy
Target: "https://zibs.nl/wiki/Pregnancy-v4.0(2020EN)"
*  -> "NL-CM:7.14.1" "Pregnancy"
* note.text -> "NL-CM:7.14.7" "Comment"
