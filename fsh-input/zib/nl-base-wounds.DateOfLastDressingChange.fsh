Profile: NlbasewoundsDateOfLastDressingChange
Parent: Observation
Id: nl-base-wounds.DateOfLastDressingChange
Title: "nl base wounds.DateOfLastDressingChange"
* insert ProfileMetadata(nl-base-wounds.DateOfLastDressingChange)
* ^purpose = "This Observation resource represents the DateOfLastDressingChange concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Burnwound v3.4 (2020)](https://zibs.nl/wiki/Burnwound-v3.4(2020EN)), the Dutch [zib PressureUlcer v3.4 (2020)](https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)) and the Dutch [zib Wound v3.3 (2020)](https://zibs.nl/wiki/Wound-v3.3(2020EN)) (NL-CM:19.4.8/NL-CM:19.1.8/NL-CM:19.2.3)."

* code = http://snomed.info/sct#360541000146109
* value[x] only dateTime

// Short, alias, definition and comment texts
* ^description = "Date on which the dressing was last changed."
* . ^comment = "This Observation resource represents the DateOfLastDressingChange concept of zibs Burnwound, PressureUlcer and Wound (NL-CM:19.4.8/NL-CM:19.1.8/NL-CM:19.2.3). It is usually part of an assessment, which is represented using the [nl-base-wounds.WoundCharacteristics](http://nictiz.nl/fhir/StructureDefinition/nl-base-wounds.WoundCharacteristics) profile. See the comment on the root of that profile for guidance on using this resource."
* value[x]
  * ^short = "DateOfLastDressingChange"
  * ^alias[+] = "DatumLaatsteVerbandwissel"
  * ^definition = "The date on which the dressing was last changed."

Mapping: NlbasewoundsDateOfLastDressingChange-to-zib-burnwound-v3.4-2020EN
Id: zib-burnwound-v3.4-2020EN
Title: "zib Burnwound-v3.4(2020EN)"
Source: NlbasewoundsDateOfLastDressingChange
Target: "https://zibs.nl/wiki/Burnwound-v3.4(2020EN)"
* value[x] -> "NL-CM:19.4.8" "DateOfLastDressingChange"

Mapping: NlbasewoundsDateOfLastDressingChange-to-zib-pressureulcer-v3.4-2020EN
Id: zib-pressureulcer-v3.4-2020EN
Title: "zib PressureUlcer-v3.4(2020EN)"
Source: NlbasewoundsDateOfLastDressingChange
Target: "https://zibs.nl/wiki/PressureUlcer-v3.4(2020EN)"
* value[x] -> "NL-CM:19.1.8" "DateOfLastDressingChange"

Mapping: NlbasewoundsDateOfLastDressingChange-to-zib-wound-v3.3-2020EN
Id: zib-wound-v3.3-2020EN
Title: "zib Wound-v3.3(2020EN)"
Source: NlbasewoundsDateOfLastDressingChange
Target: "https://zibs.nl/wiki/Wound-v3.3(2020EN)"
* value[x] -> "NL-CM:19.2.3" "DateOfLastDressingChange"
