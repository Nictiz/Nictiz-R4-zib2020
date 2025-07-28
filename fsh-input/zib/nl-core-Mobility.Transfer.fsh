Profile: NlcoreMobilityTransfer
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.Transfer
Id: nl-core-Mobility.Transfer
Title: "nl core Mobility.Transfer"
* insert ProfileMetadata(nl-core-Mobility.Transfer)
* ^purpose = "This Observation resource represents the Transfer concept (NL-CM:4.3.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Mobility v3.3 (2020)](https://zibs.nl/wiki/Mobility-v3.3(2020EN))."

* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.3.7--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "A transfer is moving from one surface to another without changing the body’s position, such as sliding across a couch or moving from the bed to a chair."
* .
  * ^alias[+] = "nl-core-Mobility.Transfer"
  * ^comment = "This Observation resource represents the Transfer concept (NL-CM:4.3.5) of zib Mobility. It can be used together with the [nl-core-Mobility](http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
