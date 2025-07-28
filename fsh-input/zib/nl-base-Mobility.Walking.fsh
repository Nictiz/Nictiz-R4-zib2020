Profile: NlbaseMobilityWalking
Parent: Observation
Id: nl-base-Mobility.Walking
Title: "nl base Mobility.Walking"
* insert ProfileMetadata(nl-base-Mobility.Walking)
* ^purpose = "This Observation resource represents the Walking concept (NL-CM:4.3.3) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Mobility v3.3 (2020)](https://zibs.nl/wiki/Mobility-v3.3(2020EN))."

* code = http://snomed.info/sct#282097004
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.3.9--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Walking is moving body from one place to another by moving legs stepwise by self, capacity to bear weight of body and walk with effective gait within the range of speed from slow, moderate and fast pace."
* . ^comment = "This Observation resource represents the Walking concept (NL-CM:4.3.3) of zib Mobility. It can be used together with the [nl-base-Mobility](http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "Walking"
  * ^alias[+] = "Lopen"
  * ^definition = "Walking is moving body from one place to another by moving legs stepwise by self, capacity to bear weight of body and walk with effective gait within the range of speed from slow, moderate and fast pace."

Mapping: NlbaseMobilityWalking-to-zib-mobility-v3.3-2020EN
Id: zib-mobility-v3.3-2020EN
Title: "zib Mobility-v3.3(2020EN)"
Source: NlbaseMobilityWalking
Target: "https://zibs.nl/wiki/Mobility-v3.3(2020EN)"
* value[x] -> "NL-CM:4.3.3" "Walking"
