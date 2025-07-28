Profile: NlbaseMobilityMaintainingPosition
Parent: Observation
Id: nl-base-Mobility.MaintainingPosition
Title: "nl base Mobility.MaintainingPosition"
* insert ProfileMetadata(nl-base-Mobility.MaintainingPosition)
* ^purpose = "This Observation resource represents the MaintainingPosition concept (NL-CM:4.3.12) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Mobility v3.3 (2020)](https://zibs.nl/wiki/Mobility-v3.3(2020EN))."

* code = http://snomed.info/sct#249868004
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.3.4--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Maintaining position is staying in the same position, such as sitting in a chair or standing, when required."
* .
  * ^short = "Mobility"
  * ^comment = "This Observation resource represents the MaintainingPosition concept (NL-CM:4.3.12) of zib Mobility. It can be used together with the [nl-base-Mobility](http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "MaintainingPosition"
  * ^alias[+] = "HoudingHandhaven"
  * ^definition = "Maintaining position is staying in the same position, such as sitting in a chair or standing, when required."

Mapping: NlbaseMobilityMaintainingPosition-to-zib-mobility-v3.3-2020EN
Id: zib-mobility-v3.3-2020EN
Title: "zib Mobility-v3.3(2020EN)"
Source: NlbaseMobilityMaintainingPosition
Target: "https://zibs.nl/wiki/Mobility-v3.3(2020EN)"
* value[x] -> "NL-CM:4.3.12" "MaintainingPosition"
