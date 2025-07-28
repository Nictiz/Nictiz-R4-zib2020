Profile: NlbaseHeartRateHeartbeatRegularity
Parent: http://nictiz.nl/fhir/StructureDefinition/pattern-VitalSigns
Id: nl-base-HeartRate.HeartbeatRegularity
Title: "nl base HeartRate.HeartbeatRegularity"
* insert ProfileMetadata(nl-base-HeartRate.HeartbeatRegularity)
* ^purpose = "This Observation resource represents the HeartbeatRegularity concept (NL-CM-12.3.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) HeartRate v3.4 (2020)](https://zibs.nl/wiki/HeartRate-v3.4(2020EN))."

* code = http://snomed.info/sct#301112006
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.3.1--20200901000000 (preferred)
* method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.3.2--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Regularity of the heartbeat."
* . ^comment = "This Observation resource represents the HeartbeatRegularity concept (NL-CM:12.3.5) of zib HeartRate. It can be used together with the [nl-base-HeartRate](http://nictiz.nl/fhir/StructureDefinition/nl-base-HeartRate) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* effectiveDateTime
  * ^short = "HeartRateDateTime"
  * ^alias[+] = "HartfrequentieDatumTijd"
  * ^definition = "Date and time of the heart rate measurement."
* value[x]
  * ^short = "HeartbeatRegularity"
  * ^alias[+] = "HartslagRegelmatigheid"
  * ^definition = "Regularity of the heartbeat."
* method
  * ^short = "HeartRateMeasurementMethod"
  * ^alias[+] = "HartslagMeetMethode"
  * ^definition = "The method used to count and observe the heart rate."

Mapping: NlbaseHeartRateHeartbeatRegularity-to-zib-heartrate-v3.4-2020EN
Id: zib-heartrate-v3.4-2020EN
Title: "zib HeartRate-v3.4(2020EN)"
Source: NlbaseHeartRateHeartbeatRegularity
Target: "https://zibs.nl/wiki/HeartRate-v3.4(2020EN)"
* effectiveDateTime -> "NL-CM:12.3.4" "HeartRateDateTime"
* value[x] -> "NL-CM:12.3.5" "HeartbeatRegularity"
* method -> "NL-CM:12.3.6" "HeartRateMeasurementMethod"
