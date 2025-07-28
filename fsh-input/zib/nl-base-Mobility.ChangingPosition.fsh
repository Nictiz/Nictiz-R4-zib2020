Profile: NlbaseMobilityChangingPosition
Parent: Observation
Id: nl-base-Mobility.ChangingPosition
Title: "nl base Mobility.ChangingPosition"
* insert ProfileMetadata(nl-base-Mobility.ChangingPosition)
* ^purpose = "This Observation resource represents the ChangingPosition concept (NL_CM:4.3.8) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Mobility v3.3 (2020)](https://zibs.nl/wiki/Mobility-v3.3(2020EN))."

* code = http://snomed.info/sct#282869009
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.3.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Changing position entails the body going from one position to another and going from one location to the next, such as getting out of a chair and into bed, or kneeling or crouching and getting back up."
* .
  * ^short = "Mobility"
  * ^comment = "This Observation resource represents the ChangingPosition concept (NL-CM:4.3.8) of zib Mobility. It can be used together with the [nl-base-Mobility](http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "ChangingPosition"
  * ^alias[+] = "HoudingVeranderen"
  * ^definition = "Changing position entails the body going from one position to another and going from one location to the next, such as getting out of a chair and into bed, or kneeling or crouching and getting back up."

Mapping: NlbaseMobilityChangingPosition-to-zib-mobility-v3.3-2020EN
Id: zib-mobility-v3.3-2020EN
Title: "zib Mobility-v3.3(2020EN)"
Source: NlbaseMobilityChangingPosition
Target: "https://zibs.nl/wiki/Mobility-v3.3(2020EN)"
* value[x] -> "NL-CM:4.3.8" "ChangingPosition"
