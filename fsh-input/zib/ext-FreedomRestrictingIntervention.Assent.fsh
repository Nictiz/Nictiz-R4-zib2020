Extension: ExtFreedomRestrictingInterventionAssent
Id: ext-FreedomRestrictingIntervention.Assent
Title: "ext FreedomRestrictingIntervention.Assent"
Context: Procedure
* insert ProfileMetadata(ext-FreedomRestrictingIntervention.Assent)

* value[x] only CodeableConcept
* value[x].coding from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.14.6.5--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "An extension to provide the assent given to the health professional(s) by the patient or legal representative to implement the involuntary care."
* value[x]
  * ^short = "Assent"
  * ^alias[+] = "Instemming"
  * ^definition = "The assent given to the health professional(s) by legal representative to implement the involuntary care."

Mapping: ExtFreedomRestrictingInterventionAssent-to-zib-freedomrestrictingintervention-v1.0-2020EN
Id: zib-freedomrestrictingintervention-v1.0-2020EN
Title: "zib FreedomRestrictingIntervention-v1.0(2020EN)"
Source: ExtFreedomRestrictingInterventionAssent
Target: "https://zibs.nl/wiki/FreedomRestrictingIntervention-v1.0(2020EN)"
* value[x] -> "NL-CM:14.6.7" "Assent"
