Profile: NlcoreMobilityWalking
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.Walking
Id: nl-core-Mobility.Walking
Title: "nl core Mobility.Walking"
* insert ProfileMetadata(nl-core-Mobility.Walking)
* ^purpose = "This Observation resource represents the Walking concept (NL-CM:4.3.3) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Mobility v3.3 (2020)](https://zibs.nl/wiki/Mobility-v3.3(2020EN))."

* value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = "Walking is moving body from one place to another by moving legs stepwise by self, capacity to bear weight of body and walk with effective gait within the range of speed from slow, moderate and fast pace."
* .
  * ^alias[+] = "nl-core-Mobility.Walking"
  * ^comment = "This Observation resource represents the Walking concept (NL-CM:4.3.3) of zib Mobility. It can be used together with the [nl-core-Mobility](http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
