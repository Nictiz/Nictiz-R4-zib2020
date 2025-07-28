Profile: NlbaseDevelopmentChildDevelopmentLocomotion
Parent: Observation
Id: nl-base-DevelopmentChild.DevelopmentLocomotion
Title: "nl base DevelopmentChild.DevelopmentLocomotion"
* insert ProfileMetadata(nl-base-DevelopmentChild.DevelopmentLocomotion)
* ^purpose = "This Observation resource represents the DevelopmentLocomotion concept (NL-CM:4.32.6) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) DevelopmentChild v1.2 (2020)](https://zibs.nl/wiki/DevelopmentChild-v1.2(2020EN))."

* code = http://snomed.info/sct#282716004
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.32.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Milestones of locomotive development of a child."
* . ^comment = "This Observation resource represents the DevelopmentLocomotion concept (NL-CM:4.32.6) of zib DevelopmentChild. It can be used together with the [nl-base-DevelopmentChild](http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* effectiveDateTime
  * ^short = "DevelopmentChildDateTime"
  * ^alias[+] = "OntwikkelingKindDatumTijd"
  * ^definition = "The date and time on which the status of the development of the child are registered."
* value[x]
  * ^short = "DevelopmentLocomotion"
  * ^alias[+] = "OntwikkelingMotoriek"
  * ^definition = "Milestones of locomotive development of a child."

Mapping: NlbaseDevelopmentChildDevelopmentLocomotion-to-zib-developmentchild-v1.2-2020EN
Id: zib-developmentchild-v1.2-2020EN
Title: "zib DevelopmentChild-v1.2(2020EN)"
Source: NlbaseDevelopmentChildDevelopmentLocomotion
Target: "https://zibs.nl/wiki/DevelopmentChild-v1.2(2020EN)"
* effectiveDateTime -> "NL-CM:4.32.2" "DevelopmentChildDateTime"
* value[x] -> "NL-CM:4.32.6" "DevelopmentLocomotion"
