Profile: NlbaseDevelopmentChildAgeFirstMenstruation
Parent: Observation
Id: nl-base-DevelopmentChild.AgeFirstMenstruation
Title: "nl base DevelopmentChild.AgeFirstMenstruation"
* insert ProfileMetadata(nl-base-DevelopmentChild.AgeFirstMenstruation)
* ^purpose = "This Observation resource represents the AgeFirstMenstruation concept (NL-CM:4.32.7) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) DevelopmentChild v1.2 (2020)](https://zibs.nl/wiki/DevelopmentChild-v1.2(2020EN))."

* code = http://loinc.org#42798-9
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] only Quantity

// Short, alias, definition and comment texts
* ^description = "The age of the start of the first menstruation."
* . ^comment = "This Observation resource represents the AgeFirstMenstruation concept (NL-CM:4.32.7) of zib DevelopmentChild. It can be used together with the [nl-base-DevelopmentChild](http://nictiz.nl/fhir/StructureDefinition/nl-base-DevelopmentChild) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* effectiveDateTime
  * ^short = "DevelopmentChildDateTime"
  * ^alias[+] = "OntwikkelingKindDatumTijd"
  * ^definition = "The date and time on which the status of the development of the child are registered."
* value[x]
  * ^short = "AgeFirstMenstruation"
  * ^alias[+] = "LeeftijdEersteMenstruatie"
  * ^definition = "The age of the start of the first menstruation."

Mapping: NlbaseDevelopmentChildAgeFirstMenstruation-to-zib-developmentchild-v1.2-2020EN
Id: zib-developmentchild-v1.2-2020EN
Title: "zib DevelopmentChild-v1.2(2020EN)"
Source: NlbaseDevelopmentChildAgeFirstMenstruation
Target: "https://zibs.nl/wiki/DevelopmentChild-v1.2(2020EN)"
* effectiveDateTime -> "NL-CM:4.32.2" "DevelopmentChildDateTime"
* value[x] -> "NL-CM:4.32.7" "AgeFirstMenstruation"
