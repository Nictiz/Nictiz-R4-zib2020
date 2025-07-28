Profile: NlcorePregnancy
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Pregnancy
Id: nl-core-Pregnancy
Title: "nl core Pregnancy"
* insert ProfileMetadata(nl-core-Pregnancy)
* insert Purpose(Pregnancy, 4.0, Observation)

* note ..1
* hasMember[pregnancyDuration] ..1
* hasMember[pregnancyDuration] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Pregnancy.PregnancyDuration)
* hasMember[parity] ..1
* hasMember[parity] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Pregnancy.Parity)
* hasMember[gravidity] ..1
* hasMember[gravidity] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Pregnancy.Gravidity)
* hasMember[estimatedDateOfDelivery] ..1
* hasMember[estimatedDateOfDelivery] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Pregnancy.EstimatedDateOfDelivery)
* hasMember[dateLastMenstruation] ..1
* hasMember[dateLastMenstruation] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Pregnancy.DateLastMenstruation)

// Short, alias, definition and comment texts
* ^description = "Pregnancy or gravidity is the condition in which a woman carries a fertilized egg, which grows into an embryo and then a fetus. A pregnancy of between 37 and 42 weeks is considered normal. “Term pregnancy” is 37 to 42 weeks. The term gravidity is also used for the number of times a woman has been pregnant. This and parity - the number of times a woman has given birth - provides insight into the patient’s obstetric history."
* .
  * ^alias[+] = "nl-core-Pregnancy"
  * ^comment = """
    Several concepts of zib Pregnancy are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * [nl-core-Pregnancy.DateLastMenstruation](http://nictiz.nl/fhir/StructureDefinition/nl-core-Pregnancy.DateLastMenstruation)
    * [nl-core-Pregnancy.EstimatedDateOfDelivery](http://nictiz.nl/fhir/StructureDefinition/nl-core-Pregnancy.EstimatedDateOfDelivery)
    * [nl-core-Pregnancy.Gravidity](http://nictiz.nl/fhir/StructureDefinition/nl-core-Pregnancy.Gravidity)
    * [nl-core-Pregnancy.Parity](http://nictiz.nl/fhir/StructureDefinition/nl-core-Pregnancy.Parity)
    * [nl-core-Pregnancy.PregnancyDuration](http://nictiz.nl/fhir/StructureDefinition/nl-core-Pregnancy.PregnancyDuration)
    """
