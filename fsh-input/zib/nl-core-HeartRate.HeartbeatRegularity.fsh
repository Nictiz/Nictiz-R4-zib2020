Profile: NlcoreHeartRateHeartbeatRegularity
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-HeartRate.HeartbeatRegularity
Id: nl-core-HeartRate.HeartbeatRegularity
Title: "nl core HeartRate.HeartbeatRegularity"
* insert ProfileMetadata(nl-core-HeartRate.HeartbeatRegularity)
* ^purpose = "This Observation resource represents the HeartbeatRegularity concept (NL-CM-12.3.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) HeartRate v3.4 (2020)](https://zibs.nl/wiki/HeartRate-v3.4(2020EN))."

* value[x] ^binding.strength = #required
* method ^binding.strength = #extensible

// Short, alias, definition and comment texts
* ^description = "Regularity of the heartbeat."
* .
  * ^alias[+] = "nl-core-HeartRate.HeartbeatRegularity"
  * ^comment = "This Observation resource represents the HeartbeatRegularity concept (NL-CM:12.3.5) of zib HeartRate. It can be used together with the [nl-core-HeartRate](http://nictiz.nl/fhir/StructureDefinition/nl-core-HeartRate) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
