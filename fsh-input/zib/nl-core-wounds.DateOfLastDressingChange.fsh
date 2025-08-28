Profile: NlcorewoundsDateOfLastDressingChange
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.DateOfLastDressingChange
Id: nl-core-wounds.DateOfLastDressingChange
Title: "nl core wounds.DateOfLastDressingChange"
* insert ProfileMetadata(nl-core-wounds.DateOfLastDressingChange)
* ^purpose = "This Observation resource represents the DateOfLastDressingChange concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Burnwound v3.4 (2020)](https://zibs.nl/wiki/Burnwound-v3.4(2020EN)), the Dutch [zib PressureUlcer v3.4 (2020)](https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)) and the Dutch [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN)) (NL-CM:19.4.8/NL-CM:19.1.8/NL-CM:19.2.3)."

* insert NlCorePatientForObservation

// Short, alias, definition and comment texts
* ^description = "Date on which the dressing was last changed."
* .
  * ^alias[+] = "nl-core-wounds.DateOfLastDressingChange"
  * ^comment = "This Observation resource represents the DateOfLastDressingChange concept of zibs Burnwound, PressureUlcer and Wound (NL-CM:19.4.8/NL-CM:19.1.8/NL-CM:19.2.3). It is usually part of an assessment, which is represented using the [nl-core-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-core-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
