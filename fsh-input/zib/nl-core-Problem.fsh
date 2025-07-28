Profile: NlcoreProblem
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem
Id: nl-core-Problem
Title: "nl core Problem"
* insert ProfileMetadata(nl-core-Problem)
* insert Purpose(Problem, 4.4, Condition)

* clinicalStatus from http://hl7.org/fhir/ValueSet/condition-clinical|4.0.1 (required)
* verificationStatus from http://hl7.org/fhir/ValueSet/condition-ver-status|4.0.1 (required)
* verificationStatus.coding 1..
* verificationStatus.coding[verificationStatusCodelist] 1..1
* verificationStatus.coding[verificationStatusCodelist] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.5.1.4--20200901000000 (required)
* category[problemType] ..1
* category[problemType] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.5.1.1--20200901000000 (required)
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.5.1.3--20200901000000 (required)
* code.extension[furtherSpecificationProblemName] ..1
* bodySite ..1
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.11--20200901000000 (required)
* note ..1

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
* . ^alias[+] = "nl-core-Problem"
