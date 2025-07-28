Extension: ExtFeedingPatternInfantFeedingMethod
Id: ext-FeedingPatternInfant.FeedingMethod
Title: "ext FeedingPatternInfant.FeedingMethod"
Context: Observation.component
* insert ProfileMetadata(ext-FeedingPatternInfant.FeedingMethod)

* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.31.2--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "An extension to provide the method how the feeding is given to the infant."
* value[x]
  * ^short = "FeedingMethod"
  * ^alias[+] = "VoedingMethode"
  * ^definition = "The method how the feeding is given to the infant."

Mapping: ExtFeedingPatternInfantFeedingMethod-to-zib-feedingpatterninfant-v1.1-2020EN
Id: zib-feedingpatterninfant-v1.1-2020EN
Title: "zib FeedingPatternInfant-v1.1(2020EN)"
Source: ExtFeedingPatternInfantFeedingMethod
Target: "https://zibs.nl/wiki/FeedingPatternInfant-v1.1(2020EN)"
* value[x] -> "NL-CM:4.31.4" "FeedingMethod"
