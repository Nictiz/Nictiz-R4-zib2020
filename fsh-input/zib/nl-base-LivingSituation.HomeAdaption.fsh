Profile: NlbaseLivingSituationHomeAdaption
Parent: Observation
Id: nl-base-LivingSituation.HomeAdaption
Title: "nl base LivingSituation.HomeAdaption"
* insert ProfileMetadata(nl-base-LivingSituation.HomeAdaption)
* ^purpose = "This Observation resource represents the HomeAdaption concept (NL-CM:7.8.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LivingSituation v3.3 (2020)](https://zibs.nl/wiki/LivingSituation-v3.3(2020EN))."

* code = http://snomed.info/sct#118871000146108
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.8.2--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Adaptions present in the home that have been made in the context of the illness or disability to make the functioning of the patient safer and more comfortable and to enable independent living."
* . ^comment = "This Observation resource represents the HomeAdaption concept (NL-CM:7.8.5) of zib LivingSituation. It can be used together with the [nl-base-LivingSituation](http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* valueCodeableConcept
  * ^short = "HomeAdaption"
  * ^alias[+] = "WoningAanpassing"
  * ^definition = "Adaptions present in the home that have been made in the context of the illness or disability to make the functioning of the patient safer and more comfortable and to enable independent living."

Mapping: NlbaseLivingSituationHomeAdaption-to-zib-livingsituation-v3.3-2020EN
Id: zib-livingsituation-v3.3-2020EN
Title: "zib LivingSituation-v3.3(2020EN)"
Source: NlbaseLivingSituationHomeAdaption
Target: "https://zibs.nl/wiki/LivingSituation-v3.3(2020EN)"
* valueCodeableConcept -> "NL-CM:7.8.5" "HomeAdaption"
