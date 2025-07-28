Profile: NlbaseTreatmentObjective
Parent: Goal
Id: nl-base-TreatmentObjective
Title: "nl base TreatmentObjective"
* insert ProfileMetadata(nl-base-TreatmentObjective)
* insert Purpose(TreatmentObjective, 3.2, Goal)

* target.measure from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.4--20200901000000 (preferred)
* target.detail[x] insert Discriminator(type, $this)
* target.detailCodeableConcept only CodeableConcept
* target.detailCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.3--20200901000000 (preferred)
* target.due[x] insert Discriminator(type, $this)
* target.dueDate only date
* addresses only Reference(http://hl7.org/fhir/StructureDefinition/Condition or http://hl7.org/fhir/StructureDefinition/Observation or http://hl7.org/fhir/StructureDefinition/MedicationStatement or http://hl7.org/fhir/StructureDefinition/NutritionOrder or http://hl7.org/fhir/StructureDefinition/ServiceRequest or http://hl7.org/fhir/StructureDefinition/RiskAssessment or http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)

// Short, alias, definition and comment texts
* ^description = "The treatment objective describes the desired result of the treatment/interventions in terms of the patient’s diagnosed problem. The objective and target date are entered in addition to the target value. Comparing the healthcare results to the treatment objective provides insight into the effectivity of the treatment/interventions."
* .
  * ^short = "TreatmentObjective / DesiredHealthCondition / FunctionalOrMentalStatus"
  * ^alias[+] = "Behandeldoel"
  * ^alias[+] = "GewensteGezondheidstoestand"
  * ^alias[+] = "FunctioneleOfMentaleStatus"
  * ^comment = "On the zib level, zib TreatmentObjective uses a reference to zib FunctionalOrMentalStatus (in future context). In FHIR the concepts from FunctionalOrMentalStatus are represented directly in the the Goal resource, with the exception of the reference to zib MedicalDevice; this reference is represented by the core extension resource-pertainsToGoal in the [nl-base-MedicalDevice](http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice) profile."
* lifecycleStatus ^comment = "No zib concept can be mapped (implicitly) to this element. Unless `.lifecycleStatus` is explicitly recorded, TreatmentObjectives may assumed to be _active_."
* description.text
  * ^short = "DesiredHealthcareResult"
  * ^alias[+] = "GewenstZorgresultaat"
  * ^definition = "The textual account of the treatment objective."
  * ^comment = """
    This element is used to represent the zib concept DesiredHealthcareResult (NL-CM:13.5.5) if present. If instead DesiredHealthCondition::FunctionalOrMentalStatus is used (NL-CM:13.5.3), this element should be populated with a textual representation containg at least FunctionalOrMentalStatus.StatusName (NL-CM:4.26.2) and FunctionalOrMentalStatus.StatusValue (NL-CM:4.26.3).
    
    Receiving systems that need to map back to the zib could look at `.target.measure` and `.target.detailCodeableConcept`; if these elements are absent, this element represents zib concept DesiredHealthcareResult. If present, the discrete data can be found in the aforementioned elements.
    """
* target.measure
  * ^short = "StatusName"
  * ^alias[+] = "StatusNaam"
  * ^definition = """
    Coded description of the functional or mental status or limitation.
    Code systems used include:
    
    * SNOMED CT
    * ICF (International Classification of Functioning, Disability and Health)
    * NOC (Nursing Outcomes Classification)
    * OMAHA
    """
* target.detailCodeableConcept
  * ^short = "StatusValue"
  * ^alias[+] = "StatusWaarde"
  * ^definition = """
    The extent to which the patient is limited by the functional or mental condition.
    
    If both the status name and the status value are recorded in code, then both values must come from the same code system. If the patient uses a medical device, the evaluation of the extent of the limitation will take place without this aid.
    
    The answer codes must be selected from the subselection of the code system corresponding with the request in accordance with the rules applicable to that system.
    """
* target.dueDate
  * ^short = "StatusDate"
  * ^alias[+] = "StatusDatum"
  * ^definition = "Indicates the date of the DesiredHealthCondition by which the goal should be met."
  * ^comment = "Please note that this definition differs from that of zib FunctionalOrMentalStatus. However, [ZIB-1657](https://nictiz.atlassian.net/browse/ZIB-1657) clarifies that in the current context, the StatusDate should be interpreted this way."
* addresses
  * ^short = "Problem"
  * ^alias[+] = "Probleem"
  * ^definition = "Description of the problem to which the treatment objective applies."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Explanatory comments as a description of the functional or mental status."

Mapping: NlbaseTreatmentObjective-to-zib-treatmentobjective-v3.2-2020EN
Id: zib-treatmentobjective-v3.2-2020EN
Title: "zib TreatmentObjective-v3.2(2020EN)"
Source: NlbaseTreatmentObjective
Target: "https://zibs.nl/wiki/TreatmentObjective-v3.2(2020EN)"
*  -> "NL-CM:13.5.1" "TreatmentObjective"
*  -> "NL-CM:13.5.3" "DesiredHealthCondition"
* description.text -> "NL-CM:13.5.5" "DesiredHealthcareResult"
* addresses -> "NL-CM:13.5.4" "Problem"

Mapping: NlbaseTreatmentObjective-to-zib-functionalormentalstatus-v3.2-2020EN
Id: zib-functionalormentalstatus-v3.2-2020EN
Title: "zib FunctionalOrMentalStatus-v3.2(2020EN)"
Source: NlbaseTreatmentObjective
Target: "https://zibs.nl/wiki/FunctionalOrMentalStatus-v3.2(2020EN)"
*  -> "NL-CM:4.26.1" "FunctionalOrMentalStatus"
* description.text -> "NL-CM:4.26.2" "StatusName (implicit, main mapping is on Goal.target.measure)"
* description.text -> "NL-CM:4.26.3" "StatusValue (implicit, main mapping is on Goal.target.detailCodeableConcept)"
* target.measure -> "NL-CM:4.26.2" "StatusName"
* target.detailCodeableConcept -> "NL-CM:4.26.3" "StatusValue"
* target.dueDate -> "NL-CM:4.26.6" "StatusDate"
* note.text -> "NL-CM:4.26.4" "Comment"
