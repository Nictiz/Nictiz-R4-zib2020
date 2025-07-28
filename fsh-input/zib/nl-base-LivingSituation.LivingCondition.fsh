Profile: NlbaseLivingSituationLivingCondition
Parent: Observation
Id: nl-base-LivingSituation.LivingCondition
Title: "nl base LivingSituation.LivingCondition"
* insert ProfileMetadata(nl-base-LivingSituation.LivingCondition)
* ^purpose = "This Observation resource represents the HomeAdaption concept (NL-CM:7.8.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LivingSituation v3.3 (2020)](https://zibs.nl/wiki/LivingSituation-v3.3(2020EN))."

* code = http://snomed.info/sct#224249004
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.8.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Conditions that affect the accessibility of the home or the stay in the home."
* . ^comment = "This Observation resource represents the LivingCondition concept (NL-CM:7.8.4) of zib LivingSituation. It can be used together with the [nl-base-LivingSituation](http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* valueCodeableConcept
  * ^short = "LivingCondition"
  * ^alias[+] = "WoonOmstandigheid"
  * ^definition = "Conditions that affect the accessibility of the home or the stay in the home."

Mapping: NlbaseLivingSituationLivingCondition-to-zib-livingsituation-v3.3-2020EN
Id: zib-livingsituation-v3.3-2020EN
Title: "zib LivingSituation-v3.3(2020EN)"
Source: NlbaseLivingSituationLivingCondition
Target: "https://zibs.nl/wiki/LivingSituation-v3.3(2020EN)"
* valueCodeableConcept -> "NL-CM:7.8.4" "LivingCondition"
