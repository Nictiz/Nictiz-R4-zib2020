Profile: NlbaseMedicationContraIndication
Parent: Flag
Id: nl-base-MedicationContraIndication
Title: "nl base MedicationContraIndication"
* insert ProfileMetadata(nl-base-MedicationContraIndication)
* insert Purpose(MedicationContraIndication, 1.0, Flag)

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-Comment named comment 0..1 and
    http://nictiz.nl/fhir/StructureDefinition/ext-MedicationContraIndication.ReasonClosure named reasonClosure 0..1
* category insert Discriminator(value, $this)
* category contains
    medicationContraIndicationCode 0..1
* category[medicationContraIndicationCode] = http://snomed.info/sct#140401000146105
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.9.14.1--20200901000000 (preferred)
* author only Reference(Device or Organization or Patient or Practitioner or PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)

// Short, alias, definition and comment texts
* ^description = "A contraindication (CI) for medication safety is a condition or characteristic of a patient where healthcare professionals are not allowed to subscribe certain medicines, or only under certain conditions."
* .
  * ^short = "MedicationContraIndication"
  * ^alias[+] = "MedicatieContraIndicatie"
  * ^comment = "Although a medication contra-indication could be represented using both the Flag or the DetectedIssue resource, the latter is an _event_ from the FHIR workflow perspective and associated with a specific action. For this reason, it is not a proper representation of zib MedicationContraIndication and this zib has been mapped onto the Flag resource."
* extension[comment].value[x]
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the contraindication important for interpretation which cannot be captured in any of the other data items. For example, a comment on a contraindication with an end date in the future."
* status ^comment = """
    This element is implictly mapped to the zib concept NL-CM:9.14.3 (EndDate). Unless the status is explicitly recorded, the following guidance applies:
    
    * When EndDateTime is present and in the past, `.status` will usually be set to _inactive_.
    * In all other situations, `.status` will usually be set to _active_.
    This element is labeled as a modifier because the status contains codes that mark the resource as entered in error.
    """
* code
  * ^short = "MedicationContraIndicationName"
  * ^alias[+] = "MedicatieContraIndicatieNaam"
  * ^definition = "The name and code of the contraindication from the Dutch National Contraindication list (G-standard Thesaurus 40)."
* period.start
  * ^short = "StartDate"
  * ^alias[+] = "BeginDatum"
  * ^definition = """
    The date and possibly time when the contraindication became relevant for medication safety monitoring.
    
    Note: the zib specifies the StartDate concept as \"The date and possibly time when the contraindication for medication [monitoring] was identified\". This sentence was chosen specifically to indicate that the zib is about safety monitoring, which can only start once the contraindication has been identified. However, a date in the future is not prohibited, in which case the StartDate will not align with the identification date.
    """
* period.end
  * ^short = "EndDate"
  * ^alias[+] = "EindDatum"
  * ^definition = "The date and, if applicable, time when the contraindication for medication monitoring is considered no longer applicable."
* author
  * ^short = "Reporter"
  * ^alias[+] = "Melder"
  * ^definition = "The health professional who takes responsibility for registering the contraindication."
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-base-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-base-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-base-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """

Mapping: NlbaseMedicationContraIndication-to-zib-medicationcontraindication-v1.0-2020EN
Id: zib-medicationcontraindication-v1.0-2020EN
Title: "zib MedicationContraIndication-v1.0(2020EN)"
Source: NlbaseMedicationContraIndication
Target: "https://zibs.nl/wiki/MedicationContraIndication-v1.0(2020EN)"
*  -> "NL-CM:9.14.1" "MedicationContraIndication"
* extension[comment].value[x] -> "NL-CM:9.14.7" "Comment"
* status -> "NL-CM:9.14.3" "EndDate (implicit, main mapping is on `Flag.period.end`)"
* code -> "NL-CM:9.14.6" "MedicationContraIndicationName"
* period.start -> "NL-CM:9.14.2" "StartDate"
* period.end -> "NL-CM:9.14.3" "EndDate"
* author -> "NL-CM:9.14.5" "Reporter"
