Profile: NlbaseHelpFromOthers
Parent: CarePlan
Id: nl-base-HelpFromOthers
Title: "nl base HelpFromOthers"
* insert ProfileMetadata(nl-base-HelpFromOthers)
* insert Purpose(HelpFromOthers, 3.01, CarePlan)

* category insert Discriminator(value, $this)
* category contains
    helpFromOthersCode 0..1
* category[helpFromOthersCode] = http://snomed.info/sct#243114000
* activity.detail.code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.3.2.1--20200901000000 (preferred)
* activity.detail.scheduled[x] insert Discriminator(type, $this)
* activity.detail.scheduledString only string
* activity.detail.performer insert Discriminator(profile, resolve(\))
* activity.detail.performer contains
    healthProfessional 0..1 and
    caregiver 0..1 and
    healthcareProvider 0..1
* activity.detail.performer[healthProfessional] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)
* activity.detail.performer[caregiver] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson)
* activity.detail.performer[healthcareProvider] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider-Organization)

// Short, alias, definition and comment texts
* ^description = """
    There are often multiple people or parties involved in the care for a patient with a disorder or disability, particularly in the event of home care. Their efforts enable the patient to function more or less independently. This includes not only caregivers, but also professional help such as that offered by home care organizations, nurses, aids and helpers.
    Current doctors and staff from the facility to which a patient is admitted do not fall under this concept.
    """
* .
  * ^short = "HelpFromOthers"
  * ^alias[+] = "HulpVanAnderen"
* status ^comment = "This element has no functional counterpart in the zib and cannot be implicitly mapped to other concepts. Unless a more appropriate status is recorded, it is assumed that only _active_ CarePlan resources will be exchanged."
* intent ^comment = "For zib HelpFromOthers, this will normally be _plan_, but the context may specify a more suitable intent."
* activity ^comment = "The zib HelpFromOthers always consists of a single type of help. For this reason, the cardinality of `.activity` is restricted to `0..1`."
* activity.detail.code
  * ^short = "TypeOfHelp"
  * ^alias[+] = "SoortHulp"
  * ^definition = "The type of help offered by the person in question."
* activity.detail.scheduledString
  * ^short = "Frequency"
  * ^alias[+] = "Frequentie"
  * ^definition = "The frequency of the provided support, e.g. daily/weekly."
* activity.detail.performer
  * ^short = "CareAid"
  * ^alias[+] = "Hulpverlener"
  * ^definition = "A care aid can be a health professional such as nurses, carers and helpers but also a caregiver or healthcare provider such as a home care organization."
* activity.detail.performer[healthProfessional]
  * ^short = "HealthProfessional"
  * ^alias[+] = "Zorgverlener"
  * ^definition = "Details of the health professional involved in the patient’s care."
  * insert PatternNlBaseHealthProfessional
* activity.detail.performer[caregiver]
  * ^short = "Caregiver"
  * ^alias[+] = "Mantelzorger"
  * ^definition = "Details of the caregiver involved in the patient’s support."
* activity.detail.performer[healthcareProvider]
  * ^short = "HealthcareProvider"
  * ^alias[+] = "Zorgaanbieder"
  * ^definition = "Details of the organization the health professional/aid works for in the event that it is not entered as a person."
* activity.detail.description
  * ^short = "Nature"
  * ^alias[+] = "Aard"
  * ^definition = "The nature of the help/support provided to the patient."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the help/support the patient receives from others."

Mapping: NlbaseHelpFromOthers-to-zib-helpfromothers-v3.01-2020EN
Id: zib-helpfromothers-v3.01-2020EN
Title: "zib HelpFromOthers-v3.01(2020EN)"
Source: NlbaseHelpFromOthers
Target: "https://zibs.nl/wiki/HelpFromOthers-v3.01(2020EN)"
*  -> "NL-CM:3.2.1" "HelpFromOthers"
* activity.detail.code -> "NL-CM:3.2.9" "TypeOfHelp"
* activity.detail.scheduledString -> "NL-CM:3.2.2" "Frequency"
* activity.detail.performer -> "NL-CM:3.2.5" "CareAid"
* activity.detail.performer[healthProfessional] -> "NL-CM:3.2.6" "HealthProfessional"
* activity.detail.performer[caregiver] -> "NL-CM:3.2.7" "Caregiver"
* activity.detail.performer[healthcareProvider] -> "NL-CM:3.2.8" "HealthcareProvider"
* activity.detail.description -> "NL-CM:3.2.3" "Nature"
* note.text -> "NL-CM:3.2.4" "Comment"
