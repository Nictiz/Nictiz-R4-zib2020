Profile: NlbaseAlert
Parent: Flag
Id: nl-base-Alert
Title: "nl base Alert"
* insert ProfileMetadata(nl-base-Alert)
* insert Purpose(Alert, 4.1, Flag)

* . obeys zib-Alert-1 and zib-Alert-2
* extension contains
    http://hl7.org/fhir/StructureDefinition/flag-detail named condition 0..1 and
    http://nictiz.nl/fhir/StructureDefinition/ext-Comment named comment 0..1
* extension[condition]
  * ^condition[+] = zib-Alert-1
  * ^condition[+] = zib-Alert-2
* extension[condition].value[x]
  * ^condition[+] = zib-Alert-1
  * ^condition[+] = zib-Alert-2
* extension[condition].value[x] only Reference(Resource or http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)
* category insert Discriminator(value, $this)
* category contains
    alertType 0..1
* category[alertType] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.3.1--20200901000000 (preferred)
* code
  * ^condition[+] = zib-Alert-1
  * ^condition[+] = zib-Alert-2
* code.coding insert Discriminator(value, $this)
* code.coding contains
    alertName 0..1 and
    dataAbsentReason 0..1
* code.coding[alertName] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.3.2--20200901000000 (preferred)
* code.coding[alertName] ^condition[+] = zib-Alert-1
* code.coding[dataAbsentReason] = http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* code.coding[dataAbsentReason] ^condition[+] = zib-Alert-2

// Short, alias, definition and comment texts
* ^description = """
    An alert describes a clinical or administrative fact brought to the attention of the users of the clinical systems to be taken into account when shaping diagnostic and therapeutic policy or in dealing with the patient, usually because of a safety risk.
    Disorders that describe the body’s sensitivity to a substance which results in a specific physiological reaction after being exposed to that substance are referred to as allergies. These are described in a separate information model.
    Warnings for non-allergic disorders can concern:
    * A disorder, condition or diagnosis which can be considered as a contraindication for undergoing a certain type of therapy, such as pregnancy or long QT syndrome;
    * Impaired functioning of an organ system (heart failure, impaired liver or kidney function, weakened immune system);
    * Risk of spreading certain microorganisms (multi-resistant bacteria, tubercle bacilli, HIV, HBV, Ebola virus);
    * Other risks
    """
* .
  * ^short = "Alert"
  * ^comment = "One of the zib concepts Condition::Concern and AlertName must be selected. If `.code` contains a code from AlertNaamCodelijst, `.extension:condition` SHALL not exist. On the other hand, if `.extension:condition` is populated, `.code` SHALL contain code _not-applicable_ from system _http://terminology.hl7.org/CodeSystem/data-absent-reason_."
* extension[condition].value[x]
  * ^short = "Condition"
  * ^alias[+] = "Conditie"
  * ^definition = "The patient’s health problem or condition that is the subject of the alert. This could involve a patient’s problem, condition or diagnosis that is seen as a contraindication in prescribing medication or which has to be taken into account when shaping diagnostic and therapeutic policy. This can be in the patient’s own interest, or it can involve a problem or disorder that can make the patient a risk to their surroundings, such as an infection hazard. These are references to conditions included on the patient’s problem list."
  * ^comment = "One of the zib concepts Condition::Concern and AlertName must be selected. If `.code` contains a code from AlertNaamCodelijst, `.extension:condition` SHALL not exist. On the other hand, if `.extension:condition` is populated, `.code` SHALL contain code _not-applicable_ from system _http://hl7.org/fhir/ValueSet/data-absent-reason_."
* extension[comment].value[x]
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Explanatory comments to the alert that can not be expressed in any of the other elements."
* status ^comment = """
    Sending systems that don't record an explicit status can use the following guidance to infer a value from the zib:
    
    * EndDateTime present and in the past: _inactive_
    * EndDateTime absent: _active_
    * EndDateTime present and in the future - goes against both FHIR and zib definitions, but in a case where this might occur: _active_
    """
* category[alertType]
  * ^short = "AlertType"
  * ^alias[+] = "AlertType"
  * ^definition = "Indicates the type of alert, meaning a rough description of the cause or origin of the warning."
* code.coding[alertName]
  * ^short = "AlertName"
  * ^alias[+] = "AlertNaam"
  * ^definition = "A warning, other than a condition or problem. For example, a patient can be given an ‘Aggressive patient' alert. The warning can be entered in code (there are codes for frequently used alerts), but seeing the dynamic nature of the warnings cf. SARS and Ebola, these alerts will often be entered as free text."
  * ^comment = "If this slice is used, slice `:dataAbsentReason` MUST be absent and `Flag.extension:condition` MUST NOT exist. See the guidance on the root."
* code.coding[dataAbsentReason] ^comment = "This slice MUST be used when `Flag.extension:condition` is populated. Slice `:alertName` MUST be absent in this case. See the guidance on the root."
* period.start
  * ^short = "StartDateTime"
  * ^alias[+] = "BeginDatumTijd"
  * ^definition = "The date and time at which the described condition was entered as a warning. This can be an exact date and time, or a rough indication of the date (such as only the year, or the month and the year)."
* period.end
  * ^short = "EndDateTime"
  * ^alias[+] = "EindDatumTijd"
  * ^definition = "The date and time at which the described condition was retracted as a warning. This can be an exact date and time, or a rough indication of the date (such as only the year, or the month and the year)."

Invariant: zib-Alert-1
Description: "One concept from Condition::Concern and AlertName must be selected. If Flag.code contains a code from AlertNaamCodelijst, Flag.extension:condition SHALL not exist."
Severity: #error
Expression: "code.memberOf('http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.3.2--20200901000000') implies extension.where(url = 'http://hl7.org/fhir/StructureDefinition/flag-detail').exists().not()"

Invariant: zib-Alert-2
Description: "One concept from Condition::Concern and AlertName must be selected. If Flag.extension:condition is filled, Flag.code SHALL contain code 'not-applicable' from system 'http://terminology.hl7.org/CodeSystem/data-absent-reason'."
Severity: #error
Expression: "extension('http://hl7.org/fhir/StructureDefinition/flag-detail').exists() implies code.coding.where($this.system = 'http://terminology.hl7.org/CodeSystem/data-absent-reason' and $this.code = 'not-applicable').exists()"

Mapping: NlbaseAlert-to-zib-alert-v4.1-2020EN
Id: zib-alert-v4.1-2020EN
Title: "zib Alert-v4.1(2020EN)"
Source: NlbaseAlert
Target: "https://zibs.nl/wiki/Alert-v4.1(2020EN)"
*  -> "NL-CM:8.3.1" "Alert"
* extension[condition].value[x] -> "NL-CM:8.3.3" "Condition"
* extension[comment].value[x] -> "NL-CM:8.3.7" "Comment"
* status -> "NL-CM:8.3.8" "EndDateTime (implicit, main mapping is on Flag.period.end)"
* category[alertType] -> "NL-CM:8.3.6" "AlertType"
* code.coding[alertName] -> "NL-CM:8.3.4" "AlertName"
* period.start -> "NL-CM:8.3.5" "StartDateTime"
* period.end -> "NL-CM:8.3.8" "EndDateTime"
