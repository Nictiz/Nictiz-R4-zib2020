Profile: NlbaseMobilityClimbingStairs
Parent: Observation
Id: nl-base-Mobility.ClimbingStairs
Title: "nl base Mobility.ClimbingStairs"
* insert ProfileMetadata(nl-base-Mobility.ClimbingStairs)
* ^purpose = "This Observation resource represents the ClimbingStairs concept (NL-CM:4.3.18) of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Mobility v3.3 (2020)](https://zibs.nl/wiki/Mobility-v3.3(2020EN))."

* code = http://snomed.info/sct#301587001
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.3.12--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "ClimbingStairs indicates the extent to which a patient is capable of going up and down stairs independently."
* .
  * ^short = "Mobility"
  * ^comment = "This Observation resource represents the ClimbingStairs concept (NL-CM:4.3.18) of zib Mobility. It can be used together with the [nl-base-Mobility](http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "ClimbingStairs"
  * ^alias[+] = "Traplopen"
  * ^definition = "ClimbingStairs indicates the extent to which a patient is capable of going up and down stairs independently."

Mapping: NlbaseMobilityClimbingStairs-to-zib-mobility-v3.3-2020EN
Id: zib-mobility-v3.3-2020EN
Title: "zib Mobility-v3.3(2020EN)"
Source: NlbaseMobilityClimbingStairs
Target: "https://zibs.nl/wiki/Mobility-v3.3(2020EN)"
* value[x] -> "NL-CM:4.3.18" "ClimbingStairs"
