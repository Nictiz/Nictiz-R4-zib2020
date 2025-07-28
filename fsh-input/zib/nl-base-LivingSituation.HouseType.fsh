Profile: NlbaseLivingSituationHouseType
Parent: Observation
Id: nl-base-LivingSituation.HouseType
Title: "nl base LivingSituation.HouseType"
* insert ProfileMetadata(nl-base-LivingSituation.HouseType)
* ^purpose = "This Observation resource represents the HouseType concept (NL-CM:7.8.3) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LivingSituation v3.3 (2020)](https://zibs.nl/wiki/LivingSituation-v3.3(2020EN))."

* code = http://snomed.info/sct#272497004
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.8.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Type of home the patient lives in."
* . ^comment = "This Observation resource represents the HouseType concept (NL-CM:7.8.3) of zib LivingSituation. It can be used together with the [nl-base-LivingSituation](http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* valueCodeableConcept
  * ^short = "HouseType"
  * ^alias[+] = "WoningType"
  * ^definition = "Type of home the patient lives in."

Mapping: NlbaseLivingSituationHouseType-to-zib-livingsituation-v3.3-2020EN
Id: zib-livingsituation-v3.3-2020EN
Title: "zib LivingSituation-v3.3(2020EN)"
Source: NlbaseLivingSituationHouseType
Target: "https://zibs.nl/wiki/LivingSituation-v3.3(2020EN)"
* valueCodeableConcept -> "NL-CM:7.8.3" "HouseType"
