Profile: NlbaseFunctionalOrMentalStatus
Parent: Observation
Id: nl-base-FunctionalOrMentalStatus
Title: "nl base FunctionalOrMentalStatus"
* insert ProfileMetadata(nl-base-FunctionalOrMentalStatus)
* insert Purpose(FunctionalOrMentalStatus, 3.2, Observation)

* extension contains
    http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo named medicalDevice 0..*
* extension[medicalDevice].value[x] only Reference(Resource or http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice)
* category insert Discriminator(value, $this)
* category contains
    functionalStatusFinding 0..1 and
    mentalStatusFinding 0..1
* category obeys zib-FunctionalOrMentalStatus-1
* category[functionalStatusFinding] ^condition[+] = zib-FunctionalOrMentalStatus-1
* category[functionalStatusFinding] = http://snomed.info/sct#118228005
* category[mentalStatusFinding] ^condition[+] = zib-FunctionalOrMentalStatus-1
* category[mentalStatusFinding] = http://snomed.info/sct#384821006
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.4--20200901000000 (preferred)
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.3--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "The functional or mental status provides insight into the patient’s functional and mental limitations."
* .
  * ^short = "FunctionalOrMentalStatus"
  * ^alias[+] = "FunctioneleOfMentaleStatus"
* extension[medicalDevice].value[x]
  * ^short = "MedicalDevice"
  * ^alias[+] = "Hulpmiddel"
  * ^definition = "Medical aid the patient has or will receive to reduce the impact of the disability or disorder."
* code
  * ^short = "StatusName"
  * ^alias[+] = "StatusNaam"
  * ^definition = """
    Coded description of the functional or mental status or limitation. &#xD;&#xA;Code systems used include: 
    
    -  SNOMED CT
    -  ICF (International Classification of Functioning, Disability and Health)
    -  NOC (Nursing Outcomes Classification)
    -  OMAHA
    """
* effectiveDateTime
  * ^short = "StatusDate"
  * ^alias[+] = "StatusDatum"
  * ^definition = "Date on which the status was determined. A ‘vague’ date, such as only the year, is permitted."
* valueCodeableConcept
  * ^short = "StatusValue"
  * ^alias[+] = "StatusWaarde"
  * ^definition = """
    The extent to which the patient is limited by the functional or mental condition.
    
    If both the status name and the status value are recorded in code, then both values must come from the same code system. If the patient uses a medical device, the evaluation of the extent of the limitation will take place without this aid.
    
    The answer codes must be selected from the subselection of the code system corresponding with the request in accordance with the rules applicable to that system.
    """
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Explanatory comments as a description of the functional or mental status."

Invariant: zib-FunctionalOrMentalStatus-1
Description: "Either a category for functional status finding or mental status finding is present."
Severity: #warning
Expression: "where(coding.system = 'http://snomed.info/sct' and coding.code = '118228005').exists() xor where(coding.system = 'http://snomed.info/sct' and coding.code = '384821006').exists()"

Mapping: NlbaseFunctionalOrMentalStatus-to-zib-functionalormentalstatus-v3.2-2020EN
Id: zib-functionalormentalstatus-v3.2-2020EN
Title: "zib FunctionalOrMentalStatus-v3.2(2020EN)"
Source: NlbaseFunctionalOrMentalStatus
Target: "https://zibs.nl/wiki/FunctionalOrMentalStatus-v3.2(2020EN)"
*  -> "NL-CM:4.26.1" "FunctionalOrMentalStatus"
* extension[medicalDevice].value[x] -> "NL-CM:4.26.5" "MedicalDevice"
* code -> "NL-CM:4.26.2" "StatusName"
* effectiveDateTime -> "NL-CM:4.26.6" "StatusDate"
* valueCodeableConcept -> "NL-CM:4.26.3" "StatusValue"
* note.text -> "NL-CM:4.26.4" "Comment"
