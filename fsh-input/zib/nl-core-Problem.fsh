Profile: NlcoreProblem
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem
Id: nl-core-Problem
Title: "nl core Problem"
* insert ProfileMetadata(nl-core-Problem)
* insert Purpose(Problem, 4.4, Condition)

* verificationStatus.coding 1..
* verificationStatus.coding[verificationStatusCodelist] 1..1
* verificationStatus.coding[verificationStatusCodelist] ^binding.strength = #required
* category[problemType] ..1
* category[problemType] ^binding.strength = #required
* code ^binding.strength = #required
* code.extension[furtherSpecificationProblemName] ..1
* bodySite ..1
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AnatomicalLocation
* bodySite ^binding.strength = #required
* insert NlCorePatientForCondition
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
