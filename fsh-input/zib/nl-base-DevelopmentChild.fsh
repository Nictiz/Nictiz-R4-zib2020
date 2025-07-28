Profile: NlbaseDevelopmentChild
Parent: Observation
Id: nl-base-DevelopmentChild
Title: "nl base DevelopmentChild"
* insert ProfileMetadata(nl-base-DevelopmentChild)
* insert Purpose(DevelopmentChild, 1.2, Observation)

* code = http://snomed.info/sct#251803000
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    toiletTrainednessUrine 0..1 and
    toiletTrainednessFeces 0..1 and
    ageFirstMenstruation 0..1 and
    developmentLocomotion 0..1 and
    developmentSocial 0..1 and
    developmentLinguistics 0..1 and
    developmentCognition 0..1
* hasMember[toiletTrainednessUrine] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.ToiletTrainednessUrine)
* hasMember[toiletTrainednessFeces] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.ToiletTrainednessFeces)
* hasMember[ageFirstMenstruation] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.AgeFirstMenstruation)
* hasMember[developmentLocomotion] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.DevelopmentLocomotion)
* hasMember[developmentSocial] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.DevelopmentSocial)
* hasMember[developmentLinguistics] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.DevelopmentLinguistics)
* hasMember[developmentCognition] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.DevelopmentCognition)

// Short, alias, definition and comment texts
* ^description = "Information on the development and growth of a child is important in determining the kind of care that should be provided to the child and the family. When the child is being transferred, continuity of care can be achieved. Information can provide insight in the process of development and whether the child has a developmental delay."
* .
  * ^short = "DevelopmentChild"
  * ^alias[+] = "OntwikkelingKind"
  * ^comment = """
    Several concepts of zib DevelopmentChild are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * ToiletTrainednessUrine (NL-CM:4.32.4): [nl-base-DevelopmentChild.ToiletTrainednessUrine](http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.ToiletTrainednessUrine)
    * ToiletTrainednessFeces (NL-CM:4.32.5): [nl-base-DevelopmentChild.ToiletTrainednessFeces](http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.ToiletTrainednessFeces)
    * AgeFirstMenstruation (NL-CM:4.32.7): [nl-base-DevelopmentChild.AgeFirstMenstruation](http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.AgeFirstMenstruation)
    * DevelopmentLocomotion (NL-CM:4.32.6): [nl-base-DevelopmentChild.DevelopmentLocomotion](http://nictiz.nl/fhir/StructureDefinition/nl-base-evelopmentChild.DevelopmentLocomotion)
    * DevelopmentSocial (NL-CM:4.32.8): [nl-base-DevelopmentChild.DevelopmentSocial](http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.DevelopmentSocial)
    * DevelopmentLinguistics (NL-CM:4.32.9): [nl-base-DevelopmentChild.DevelopmentLinguistics](http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild.DevelopmentLinguistics)
    """
* effectiveDateTime
  * ^short = "DevelopmentChildDateTime"
  * ^alias[+] = "OntwikkelingKindDatumTijd"
  * ^definition = "The date and time on which the status of the development of the child are registered."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the development of the child."
* hasMember[toiletTrainednessUrine] ^definition = "The ToiletTrainednessUrine concept (NL-CM:4.32.4) of zib DevelopmentChild, represented as a distinct Observation resource."
* hasMember[toiletTrainednessFeces] ^definition = "The ToiletTrainednessFeces concept (NL-CM:4.32.5) of zib DevelopmentChild, represented as a distinct Observation resource."
* hasMember[ageFirstMenstruation] ^definition = "The AgeFirstMenstruation concept (NL-CM:4.32.7) of zib DevelopmentChild, represented as a distinct Observation resource."
* hasMember[developmentLocomotion] ^definition = "The DevelopmentLocomotion concept (NL-CM:4.32.6) of zib DevelopmentChild, represented as a distinct Observation resource."
* hasMember[developmentSocial] ^definition = "The DevelopmentSocial concept (NL-CM:4.32.8) of zib DevelopmentChild, represented as a distinct Observation resource."
* hasMember[developmentLinguistics] ^definition = "The DevelopmentLinguistics concept (NL-CM:4.32.9) of zib DevelopmentChild, represented as a distinct Observation resource."
* hasMember[developmentCognition] ^definition = "The DevelopmentCognition concept (NL-CM:4.32.10) of zib DevelopmentChild, represented as a distinct Observation resource."

Mapping: NlbaseDevelopmentChild-to-zib-developmentchild-v1.2-2020EN
Id: zib-developmentchild-v1.2-2020EN
Title: "zib DevelopmentChild-v1.2(2020EN)"
Source: NlbaseDevelopmentChild
Target: "https://zibs.nl/wiki/DevelopmentChild-v1.2(2020EN)"
*  -> "NL-CM:4.32.1" "DevelopmentChild"
* effectiveDateTime -> "NL-CM:4.32.2" "DevelopmentChildDateTime"
* note.text -> "NL-CM:4.32.3" "Comment"
