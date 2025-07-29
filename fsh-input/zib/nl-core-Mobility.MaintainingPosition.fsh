Profile: NlcoreMobilityMaintainingPosition
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.MaintainingPosition
Id: nl-core-Mobility.MaintainingPosition
Title: "nl core Mobility.MaintainingPosition"
* insert ProfileMetadata(nl-core-Mobility.MaintainingPosition)
* ^purpose = "This Observation resource represents the MaintainingPosition concept (NL-CM:4.3.12) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Mobility v3.3 (2020)](https://zibs.nl/wiki/Mobility-v3.3(2020EN))."

* value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "Maintaining position is staying in the same position, such as sitting in a chair or standing, when required."
* .
  * ^alias[+] = "nl-core-Mobility.MaintainingPosition"
  * ^comment = "This Observation resource represents the MaintainingPosition concept (NL-CM:4.3.12) of zib Mobility. It can be used together with the [nl-core-Mobility](http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
