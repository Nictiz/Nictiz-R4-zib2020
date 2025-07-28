Profile: NlbaseDrugUse
Parent: Observation
Id: nl-base-DrugUse
Title: "nl base DrugUse"
* insert ProfileMetadata(nl-base-DrugUse)
* insert Purpose(DrugUse, 3.3, Observation)

* code = http://snomed.info/sct#228366006
* effective[x] insert Discriminator(type, $this)
* effectivePeriod only Period
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.4.2--20200901000000 (preferred)
* component insert Discriminator(value, code)
* component contains
    amount 0..1 and
    drugOrMedicationType 0..1 and
    routeOfAdministration 0..
* component[amount].code = http://snomed.info/sct#363908000
* component[amount].value[x] only string
* component[drugOrMedicationType].code = http://snomed.info/sct#105590001
* component[drugOrMedicationType].value[x] only CodeableConcept
* component[drugOrMedicationType].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.4.1--20200901000000 (preferred)
* component[routeOfAdministration].code = http://snomed.info/sct#410675002
* component[routeOfAdministration].value[x] only CodeableConcept
* component[routeOfAdministration].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.7.4.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    Drugs (or: narcotics, amphetamines, intoxicants, highs, hallucinogenics, illegal substances or dope) is a collective term for drugs and chemical substances with a more or less ‘drugging' (anesthetic, boosting and/or hallucinogenic) effect and which can lead to addiction. Drug [Online] Available at: nl.Wikipedia.org/wiki/drug [Accessed: 11 February 2015].
    
    This information model describes the information asked of the patient about their drug use.
    """
* .
  * ^short = "DrugUse"
  * ^alias[+] = "DrugsGebruik"
* effectivePeriod.start
  * ^short = "StartDate"
  * ^alias[+] = "StartDatum"
  * ^definition = "The date on which the patient started using."
* effectivePeriod.end
  * ^short = "StopDate"
  * ^alias[+] = "StopDatum"
  * ^definition = "The date on which the patient quit using"
* valueCodeableConcept
  * ^short = "DrugUseStatus"
  * ^alias[+] = "DrugsGebruikStatus"
  * ^definition = "Indication stating whether there was any drug use in the past or present."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Relevant comments on the drug use."
* component[amount].value[x]
  * ^short = "Amount"
  * ^alias[+] = "Hoeveelheid"
  * ^definition = "The number of units (pills, joints, shots etc.) per day, week, month or year or the frequency of use."
* component[drugOrMedicationType].value[x]
  * ^short = "DrugOrMedicationType"
  * ^alias[+] = "DrugsOfGeneesmiddelSoort"
  * ^definition = "Type of drug used by the patient."
* component[routeOfAdministration].value[x]
  * ^short = "RouteOfAdministration"
  * ^alias[+] = "Toedieningsweg"
  * ^definition = "The way the drugs are used."

Mapping: NlbaseDrugUse-to-zib-druguse-v3.3-2020EN
Id: zib-druguse-v3.3-2020EN
Title: "zib DrugUse-v3.3(2020EN)"
Source: NlbaseDrugUse
Target: "https://zibs.nl/wiki/DrugUse-v3.3(2020EN)"
*  -> "NL-CM:7.4.1" "DrugUse"
* effectivePeriod.start -> "NL-CM:7.4.6" "StartDate"
* effectivePeriod.end -> "NL-CM:7.4.7" "StopDate"
* valueCodeableConcept -> "NL-CM:7.4.3" "DrugUseStatus"
* note.text -> "NL-CM:7.4.9" "Comment"
* component[amount].value[x] -> "NL-CM:7.4.8" "Amount"
* component[drugOrMedicationType].value[x] -> "NL-CM:7.4.2" "DrugOrMedicationType"
* component[routeOfAdministration].value[x] -> "NL-CM:7.4.4" "RouteOfAdministration"
