Profile: NlbaseTobaccoUse
Parent: Observation
Id: nl-base-TobaccoUse
Title: "nl base TobaccoUse"
* insert ProfileMetadata(nl-base-TobaccoUse)
* insert Purpose(TobaccoUse, 3.2, Observation)

* code = http://snomed.info/sct#365980008
* effective[x] insert Discriminator(type, $this)
* effectivePeriod only Period
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.2.2--20200901000000 (preferred)
* component insert Discriminator(value, code)
* component contains
    typeOfTobaccoUsed 0..1 and
    amount 0..1 and
    packYears 0..1
* component[typeOfTobaccoUsed].code = http://snomed.info/sct#53661000146106
* component[typeOfTobaccoUsed].value[x] only CodeableConcept
* component[typeOfTobaccoUsed].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.2.3--20200901000000 (preferred)
* component[amount].code = http://snomed.info/sct#266918002
* component[amount].value[x] only Quantity
* component[amount].value[x] = http://unitsofmeasure.org#None
* component[packYears].code = http://snomed.info/sct#401201003
* component[packYears].value[x] only integer

// Short, alias, definition and comment texts
* ^description = "Tobacco is a product that comes from the leaves of the tobacco plant, which is smoked as a drug. Smokable forms of tobacco include rolling tobacco, cigarettes, cigars and pipe tobacco. This information model describes the information asked of the patient about their use of tobacco."
* .
  * ^short = "TobaccoUse"
  * ^alias[+] = "TabakGebruik"
* effectivePeriod.start
  * ^short = "StartDate"
  * ^alias[+] = "StartDatum"
  * ^definition = "The date on which the patient started smoking."
* effectivePeriod.end
  * ^short = "StopDate"
  * ^alias[+] = "StopDatum"
  * ^definition = "The date on which the patient quit smoking"
* valueCodeableConcept
  * ^short = "TobaccoUseStatus"
  * ^alias[+] = "TabakGebruikStatus"
  * ^definition = "The status of the patient’s tobacco use."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Relevant comments on the patient’s use of tobacco."
* component[typeOfTobaccoUsed].code ^comment = "The code to identify this concept (SNOMED 53661000146106) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1403](https://bits.nictiz.nl/browse/ZIB-1403) for more information."
* component[typeOfTobaccoUsed].value[x]
  * ^short = "TypeOfTobaccoUsed"
  * ^alias[+] = "SoortTabakGebruik"
  * ^definition = "Type of tobacco the patient uses."
* component[amount].value[x]
  * ^short = "Amount"
  * ^alias[+] = "Hoeveelheid"
  * ^definition = "The number of cigarettes, cigars or grams of rolling tobacco consumed per day, week, month or year."
* component[packYears].value[x]
  * ^short = "PackYears"
  * ^alias[+] = "PackYears"
  * ^definition = "The unit indicating the smoker’s total exposure to tobacco smoke.  For cigarettes, this is calculated using the number of smoked packs of cigarettes per day (one pack = 20 cigarettes) times the number of years of smoking. For other forms of tobacco, this is usually converted to an equivalent cigarette consumption. Often, only the number of pack years is estimated."

Mapping: NlbaseTobaccoUse-to-zib-tobaccouse-v3.2-2020EN
Id: zib-tobaccouse-v3.2-2020EN
Title: "zib TobaccoUse-v3.2(2020EN)"
Source: NlbaseTobaccoUse
Target: "https://zibs.nl/wiki/TobaccoUse-v3.2(2020EN)"
*  -> "NL-CM:7.2.1" "TobaccoUse"
* effectivePeriod.start -> "NL-CM:7.2.4" "StartDate"
* effectivePeriod.end -> "NL-CM:7.2.5" "StopDate"
* valueCodeableConcept -> "NL-CM:7.2.10" "TobaccoUseStatus"
* note.text -> "NL-CM:7.2.3" "Comment"
* component[typeOfTobaccoUsed].value[x] -> "NL-CM:7.2.9" "TypeOfTobaccoUsed"
* component[amount].value[x] -> "NL-CM:7.2.6" "Amount"
* component[packYears].value[x] -> "NL-CM:7.2.7" "PackYears"
