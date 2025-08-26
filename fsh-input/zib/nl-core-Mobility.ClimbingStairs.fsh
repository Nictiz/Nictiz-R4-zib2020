Profile: NlcoreMobilityClimbingStairs
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.ClimbingStairs
Id: nl-core-Mobility.ClimbingStairs
Title: "nl core Mobility.ClimbingStairs"
* insert ProfileMetadata(nl-core-Mobility.ClimbingStairs)
* ^purpose = "This Observation resource represents the ClimbingStairs concept (NL-CM:4.3.18) of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Mobility v3.3 (2020)](https://zibs.nl/wiki/Mobility-v3.3(2020EN))."

* insert NlCorePatientForObservation
* value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "ClimbingStairs indicates the extent to which a patient is capable of going up and down stairs independently."
* .
  * ^alias[+] = "nl-core-Mobility.ClimbingStairs"
  * ^comment = "This Observation resource represents the ClimbingStairs concept (NL-CM:4.3.18) of zib Mobility. It can be used together with the [nl-core-Mobility](http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
