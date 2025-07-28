Extension: ExtFreedomRestrictingInterventionLegallyCapable
Id: ext-FreedomRestrictingIntervention.LegallyCapable
Title: "ext FreedomRestrictingIntervention.LegallyCapable"
Context: Procedure
* insert ProfileMetadata(ext-FreedomRestrictingIntervention.LegallyCapable)

* . 0..*
* extension insert Discriminator(value, url)
* extension contains
    legallyCapable 0..1 and
    legallyCapableComment 0..1
* extension[legallyCapable] ^condition[+] = zib-FreedomRestrictingIntervention-01
* extension[legallyCapable].value[x] ^condition[+] = zib-FreedomRestrictingIntervention-01
* extension[legallyCapable].value[x] only boolean
* extension[legallyCapableComment] ^condition[+] = zib-FreedomRestrictingIntervention-01
* extension[legallyCapableComment].value[x] ^condition[+] = zib-FreedomRestrictingIntervention-01
* extension[legallyCapableComment].value[x] only string

// Short, alias, definition and comment texts
* ^description = "An extension to indicate whether the patient is deemed capable of overseeing the consequences of a certain procedure, situation or decision, and to provide a comment on the decisions which the patient is legally capable of making."
* ^purpose = "This extension represents the LegallyCapable and LegallyCapableComment concepts of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) FreedomRestrictingIntervention v1.0 (2020)](https://zibs.nl/wiki/FreedomRestrictingIntervention-v1.0(2020EN))."
* extension[legallyCapable].value[x]
  * ^short = "LegallyCapable"
  * ^alias[+] = "Wilsbekwaam"
  * ^definition = "Indicator stating whether the patient is deemed capable of overseeing the consequences of a certain procedure, situation or decision."
* extension[legallyCapableComment].value[x]
  * ^short = "LegallyCapableComment"
  * ^alias[+] = "WilsbekwaamToelichting"
  * ^definition = "Comment on the decisions which the patient is legally capable of making."

Invariant: zib-FreedomRestrictingIntervention-01
Description: "If the patient is not legally capable, an explanation must be provided"
Severity: #warning
Expression: "extension.where(url='legallyCapable').value = false implies extension.where(url='legallyCapableComment').value.exists()"

Mapping: ExtFreedomRestrictingInterventionLegallyCapable-to-zib-freedomrestrictingintervention-v1.0-2020EN
Id: zib-freedomrestrictingintervention-v1.0-2020EN
Title: "zib FreedomRestrictingIntervention-v1.0(2020EN)"
Source: ExtFreedomRestrictingInterventionLegallyCapable
Target: "https://zibs.nl/wiki/FreedomRestrictingIntervention-v1.0(2020EN)"
* extension[legallyCapable].value[x] -> "NL-CM:14.6.2" "LegallyCapable"
* extension[legallyCapableComment].value[x] -> "NL-CM:14.6.3" "LegallyCapableComment"
