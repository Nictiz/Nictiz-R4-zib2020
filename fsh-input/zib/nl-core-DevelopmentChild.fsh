Profile: NlcoreDevelopmentChild
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild
Id: nl-core-DevelopmentChild
Title: "nl core DevelopmentChild"
* insert ProfileMetadata(nl-core-DevelopmentChild)
* insert Purpose(DevelopmentChild, 1.2, Observation)

* note ..1
* hasMember[toiletTrainednessUrine] ..1
* hasMember[toiletTrainednessFeces] ..1
* hasMember[ageFirstMenstruation] ..1
* hasMember[developmentLocomotion] ..1
* hasMember[developmentSocial] ..1
* hasMember[developmentLinguistics] ..1
* hasMember[developmentCognition] ..1

// Short, alias, definition and comment texts
* ^description = "Information on the development and growth of a child is important in determining the kind of care that should be provided to the child and the family. When the child is being transferred, continuity of care can be achieved. Information can provide insight in the process of development and whether the child has a developmental delay."
* .
  * ^alias[+] = "nl-core-DevelopmentChild"
  * ^comment = """
    Several concepts of zib DevelopmentChild are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * ToiletTrainednessUrine (NL-CM:4.32.4): [nl-core-DevelopmentChild.ToiletTrainednessUrine](http://nictiz.nl/fhir/StructureDefinition/nl-core-DevelopmentChild.ToiletTrainednessUrine)
    * ToiletTrainednessFeces (NL-CM:4.32.5): [nl-core-DevelopmentChild.ToiletTrainednessFeces](http://nictiz.nl/fhir/StructureDefinition/nl-core-DevelopmentChild.ToiletTrainednessFeces)
    * AgeFirstMenstruation (NL-CM:4.32.7): [nl-core-DevelopmentChild.AgeFirstMenstruation](http://nictiz.nl/fhir/StructureDefinition/nl-core-DevelopmentChild.AgeFirstMenstruation)
    * DevelopmentLocomotion (NL-CM:4.32.6): [nl-core-DevelopmentChild.DevelopmentLocomotion](http://nictiz.nl/fhir/StructureDefinition/nl-core-evelopmentChild.DevelopmentLocomotion)
    * DevelopmentSocial (NL-CM:4.32.8): [nl-core-DevelopmentChild.DevelopmentSocial](http://nictiz.nl/fhir/StructureDefinition/nl-core-DevelopmentChild.DevelopmentSocial)
    * DevelopmentLinguistics (NL-CM:4.32.9): [nl-core-DevelopmentChild.DevelopmentLinguistics](http://nictiz.nl/fhir/StructureDefinition/nl-core-DevelopmentChild.DevelopmentLinguistics)
    """
