Profile: NlcoreMobility
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility
Id: nl-core-Mobility
Title: "nl core Mobility"
* insert ProfileMetadata(nl-core-Mobility)
* insert Purpose(Mobility, 3.3, Observation)

* extension[medicalDevice].value[x] only Reference(Resource or http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicalDevice)
* insert NlCorePatientForObservation
* note ..1
* hasMember[walking] ..1
* hasMember[walking] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility.Walking)
* hasMember[climbingStairs] ..1
* hasMember[climbingStairs] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility.ClimbingStairs)
* hasMember[changingPosition] ..1
* hasMember[changingPosition] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility.ChangingPosition)
* hasMember[maintainingPosition] ..1
* hasMember[maintainingPosition] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility.MaintainingPosition)
* hasMember[transfer] ..1
* hasMember[transfer] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility.Transfer)

// Short, alias, definition and comment texts
* ^description = "Mobility describes the abilities and any limitations in all aspects of mobility, such as changing position, walking and moving forward, in some cases with the help of an aid."
* .
  * ^alias[+] = "nl-core-Mobility"
  * ^comment = """
    Several concepts of zib Mobility are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * Walking (NL-CM:4.3.3): [nl-core-Mobility.Walking](http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility.Walking)
    * ClimbingStairs (NL-CM:4.3.18): [nl-core-Mobility.ClimbingStairs](http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility.ClimbingStairs)
    * ChangingPosition (NL-CM:4.3.8): [nl-core-Mobility.ChangingPosition](http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility.ChangingPosition)
    * MaintainingPosition (NL-CM:4.3.12): [nl-core-Mobility.MaintainingPosition](http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility.MaintainingPosition)
    * Transfer (NL-CM:4.3.5): [nl-core-Mobility.Transfer](http://nictiz.nl/fhir/StructureDefinition/nl-core-Mobility.Transfer)
    """
