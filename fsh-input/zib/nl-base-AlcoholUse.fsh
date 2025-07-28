Profile: NlbaseAlcoholUse
Parent: Observation
Id: nl-base-AlcoholUse
Title: "nl base AlcoholUse"
* insert ProfileMetadata(nl-base-AlcoholUse)
* insert Purpose(AlcoholUse, 3.2, Observation)

* code = http://snomed.info/sct#228273003
* effective[x] insert Discriminator(type, $this)
* effectivePeriod only Period
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.3.2--20200901000000 (preferred)
* component insert Discriminator(value, code)
* component contains
    amount 0..1
* component[amount].code = http://snomed.info/sct#897148007
* component[amount].value[x] only Quantity
* component[amount].value[x] = 'None'

// Short, alias, definition and comment texts
* ^description = "In the context of this information model, alcohol is the collective term for alcoholic beverages consumed as a leisure product. This information model describes the information asked of the patient about their alcohol use."
* .
  * ^short = "AlcoholUse"
  * ^alias[+] = "AlcoholGebruik"
* effectivePeriod.start
  * ^short = "StartDate"
  * ^alias[+] = "StartDatum"
  * ^definition = "The date on which the patient started using alcohol."
* effectivePeriod.end
  * ^short = "StopDate"
  * ^alias[+] = "StopDatum"
  * ^definition = "The date on which the patient stopped consuming alcohol."
* valueCodeableConcept
  * ^short = "AlcoholUseStatus"
  * ^alias[+] = "AlcoholGebruikStatus"
  * ^definition = "The status of the patient’s alcohol use."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Relevant comments on the alcohol consumption."
* component[amount].value[x]
  * ^short = "Amount"
  * ^alias[+] = "Hoeveelheid"
  * ^definition = "The extent of the patient’s alcohol use in units of alcohol per time period."

Mapping: NlbaseAlcoholUse-to-zib-alcoholuse-v3.2-2020EN
Id: zib-alcoholuse-v3.2-2020EN
Title: "zib AlcoholUse-v3.2(2020EN)"
Source: NlbaseAlcoholUse
Target: "https://zibs.nl/wiki/AlcoholUse-v3.2(2020EN)"
*  -> "NL-CM:7.3.1" "AlcoholUse"
* effectivePeriod.start -> "NL-CM:7.3.4" "StartDate"
* effectivePeriod.end -> "NL-CM:7.3.5" "StopDate"
* valueCodeableConcept -> "NL-CM:7.3.2" "AlcoholUseStatus"
* note.text -> "NL-CM:7.3.7" "Comment"
* component[amount].value[x] -> "NL-CM:7.3.6" "Amount"
