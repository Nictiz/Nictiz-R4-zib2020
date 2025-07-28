Profile: NlcoreMobilityChangingPosition
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.ChangingPosition
Id: nl-core-Mobility.ChangingPosition
Title: "nl core Mobility.ChangingPosition"
* insert ProfileMetadata(nl-core-Mobility.ChangingPosition)
* ^purpose = "This Observation resource represents the ChangingPosition concept (NL_CM:4.3.8) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Mobility v3.3 (2020)](https://zibs.nl/wiki/Mobility-v3.3(2020EN))."

* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.3.1--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = "Changing position entails the body going from one position to another and going from one location to the next, such as getting out of a chair and into bed, or kneeling or crouching and getting back up."
* .
  * ^alias[+] = "nl-core-Mobility.ChangingPosition"
  * ^comment = "This Observation resource represents the ChangingPosition concept (NL-CM:4.3.8) of zib Mobility. It can be used together with the [nl-core-Mobility](http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
