Profile: NlbaseMobilityTransfer
Parent: Observation
Id: nl-base-Mobility.Transfer
Title: "nl base Mobility.Transfer"
* insert ProfileMetadata(nl-base-Mobility.Transfer)
* ^purpose = "This Observation resource represents the Transfer concept (NL-CM:4.3.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Mobility v3.3 (2020)](https://zibs.nl/wiki/Mobility-v3.3(2020EN))."

* code = http://snomed.info/sct#364666007
* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.3.7--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "A transfer is moving from one surface to another without changing the body’s position, such as sliding across a couch or moving from the bed to a chair."
* .
  * ^short = "Mobility"
  * ^comment = "This Observation resource represents the Transfer concept (NL-CM:4.3.5) of zib Mobility. It can be used together with the [nl-base-Mobility](http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* value[x]
  * ^short = "Transfer"
  * ^alias[+] = "UitvoerenTransfer"
  * ^definition = "A transfer is moving from one surface to another without changing the body’s position, such as sliding across a couch or moving from the bed to a chair."

Mapping: NlbaseMobilityTransfer-to-zib-mobility-v3.3-2020EN
Id: zib-mobility-v3.3-2020EN
Title: "zib Mobility-v3.3(2020EN)"
Source: NlbaseMobilityTransfer
Target: "https://zibs.nl/wiki/Mobility-v3.3(2020EN)"
* value[x] -> "NL-CM:4.3.5" "Transfer"
