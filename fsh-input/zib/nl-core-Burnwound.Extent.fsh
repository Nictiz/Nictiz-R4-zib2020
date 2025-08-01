Profile: NlcoreBurnwoundExtent
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Burnwound.Extent
Id: nl-core-Burnwound.Extent
Title: "nl core Burnwound.Extent"
* insert ProfileMetadata(nl-core-Burnwound.Extent)
* ^purpose = "This Observation resource represents the Extent concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Burnwound v3.4 (2020)](https://zibs.nl/wiki/Burnwound-v3.4(2020EN))."

* insert NlCorePatientForObservation

// Short, alias, definition and comment texts
* ^description = "The extent of a burn wound is indicated in a percentage of the ‘Total Body Surface Area’ (TBSA)."
* .
  * ^alias[+] = "nl-core-Burnwound.Extent"
  * ^comment = "This Observation resource represents the Extent concept (NL-CM:19.4.7) of zib Burnwound. It is usually part of an assessment, which is represented using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
