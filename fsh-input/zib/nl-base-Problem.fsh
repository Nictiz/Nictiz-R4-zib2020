Profile: NlbaseProblem
Parent: Condition
Id: nl-base-Problem
Title: "nl base Problem"
* insert ProfileMetadata(nl-base-Problem)
* insert Purpose(Problem, 4.4, Condition)

* clinicalStatus insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/ProbleemStatusCodelijst-to-ConditionClinicalStatusCodes)
* clinicalStatus from http://hl7.org/fhir/ValueSet/condition-clinical|4.0.1 (preferred)
* verificationStatus insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/VerificatieStatusCodelijst-to-ConditionVerificationStatus)
* verificationStatus from http://hl7.org/fhir/ValueSet/condition-ver-status|4.0.1 (preferred)
* verificationStatus.coding insert Discriminator(value, $this)
* verificationStatus.coding contains
    verificationStatusCodelist 0..1
* verificationStatus.coding[verificationStatusCodelist] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.5.1.4--20200901000000 (preferred)
* category insert Discriminator(value, $this)
* category contains
    problemType 0..1
* category[problemType] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.5.1.1--20200901000000 (preferred)
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.5.1.3--20200901000000 (preferred)
* code.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-Problem.FurtherSpecificationProblemName named furtherSpecificationProblemName 0..1
* bodySite only CodeableConcept
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AnatomicalLocation
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (preferred)
* onset[x] insert Discriminator(type, $this)
* onsetDateTime only dateTime
* abatement[x] insert Discriminator(type, $this)
* abatementDateTime only dateTime

// Short, alias, definition and comment texts
* ^description = """
    A problem describes a situation with regard to an individual’s health and/or welfare. This situation can be described by the person involved (the patient) themselves (in the form of a complaint), or by their healthcare provider (in the form of a diagnosis, for example). The situation can form cause for diagnostic or therapeutic policy.
    
    A problem includes all kinds of medical or nursing information that represents a health problem. A problem can represent various types of health problems:
     
    A complaint, finding by patient: a subjective, negatively experienced observation of the patient’s health. Examples: stomach ache, amnesia
    
    A symptom: an observation by or about the patient which may indicate a certain disease. Examples: fever, blood in stool, white spots on the roof of the mouth;
    
    A diagnosis: medical interpretation of complaints and findings. Examples: Diabetes Mellitus type II, pneumonia, hemolytic-uremic syndrome.
    
    A functional limitation: a reduction of functional options. Examples: reduced mobility, help required for dressing.
    
    A complication: Every diagnosis seen by the healthcare provider as an unforeseen and undesired result of medical action. Examples: post-operative wound infections, loss of hearing through the use of antibiotics.
    """
* .
  * ^short = "Problem"
  * ^alias[+] = "Probleem"
* clinicalStatus
  * ^short = "ProblemStatus"
  * ^alias[+] = "ProbleemStatus"
  * ^definition = """
    The problem status describes the condition of the problem:
    1. Active problems are problems of which the patient experiences symptoms or for which evidence exists.
    
    2. Problems with the status 'Inactive' refer to problems that don't affect the patient anymore or that of which there is no evidence of existence anymore.
    """
* verificationStatus
  * ^short = "VerificationStatus"
  * ^alias[+] = "VerificatieStatus"
  * ^definition = "Clinical status of the problem or the diagnosis."
* category[problemType]
  * ^short = "ProblemType"
  * ^alias[+] = "ProbleemType"
  * ^definition = "The type of problem; see the concept description."
* code
  * ^short = "ProblemName"
  * ^alias[+] = "ProbleemNaam"
  * ^definition = "The problem name defines the problem. Depending on the setting, different code systems can be used. The ProblemNameCodelist provides an overview of the possible code systems."
* bodySite
  * ^short = "Location / ProblemAnatomicalLocation"
  * ^alias[+] = "ProbleemAnatomischeLocatie"
  * ^definition = "Anatomical location which is the focus of the problem."
* onsetDateTime
  * ^short = "ProblemStartDate"
  * ^alias[+] = "ProbleemBeginDatum"
  * ^definition = "Onset of the symptom, complaint, functional limitation, complication or date of diagnosis. A ‘vague’ date, such as only the year or the month and the year, is permitted."
* abatementDateTime
  * ^short = "ProblemEndDate"
  * ^alias[+] = "ProbleemEindDatum"
  * ^definition = "Date on which the disorder to which the problem applies, is considered not to be present anymore.This datum needs not to be the same as the date of the change in problem status. A ‘vague’ date, such as only the year or the month and the year, is permitted."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment by the one who determined or updated the Problem."

Mapping: NlbaseProblem-to-zib-problem-v4.4-2020EN
Id: zib-problem-v4.4-2020EN
Title: "zib Problem-v4.4(2020EN)"
Source: NlbaseProblem
Target: "https://zibs.nl/wiki/Problem-v4.4(2020EN)"
*  -> "NL-CM:5.1.1" "Problem"
* clinicalStatus -> "NL-CM:5.1.4" "ProblemStatus"
* verificationStatus -> "NL-CM:5.1.10" "VerificationStatus"
* category[problemType] -> "NL-CM:5.1.8" "ProblemType"
* code -> "NL-CM:5.1.3" "ProblemName"
* bodySite -> "NL-CM:5.1.14" "ProblemAnatomicalLocation"
* onsetDateTime -> "NL-CM:5.1.6" "ProblemStartDate"
* abatementDateTime -> "NL-CM:5.1.9" "ProblemEndDate"
* note.text -> "NL-CM:5.1.5" "Comment"
