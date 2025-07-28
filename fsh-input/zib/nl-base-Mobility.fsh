Profile: NlbaseMobility
Parent: Observation
Id: nl-base-Mobility
Title: "nl base Mobility"
* insert ProfileMetadata(nl-base-Mobility)
* insert Purpose(Mobility, 3.3, Observation)

* extension contains
    http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo named medicalDevice 0..*
* extension[medicalDevice].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/Resource or http://nictiz.nl/fhir/StructureDefinition/nl-base-MedicalDevice)
* code = http://snomed.info/sct#301438001
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    walking 0..1 and
    climbingStairs 0..1 and
    changingPosition 0..1 and
    maintainingPosition 0..1 and
    transfer 0..1
* hasMember[walking] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.Walking)
* hasMember[climbingStairs] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.ClimbingStairs)
* hasMember[changingPosition] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.ChangingPosition)
* hasMember[maintainingPosition] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.MaintainingPosition)
* hasMember[transfer] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.Transfer)

// Short, alias, definition and comment texts
* ^description = "Mobility describes the abilities and any limitations in all aspects of mobility, such as changing position, walking and moving forward, in some cases with the help of an aid."
* .
  * ^short = "Mobility"
  * ^alias[+] = "Mobiliteit"
  * ^comment = """
    Several concepts of zib Mobility are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * Walking (NL-CM:4.3.3): [nl-base-Mobility.Walking](http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.Walking)
    * ClimbingStairs (NL-CM:4.3.18): [nl-base-Mobility.ClimbingStairs](http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.ClimbingStairs)
    * ChangingPosition (NL-CM:4.3.8): [nl-base-Mobility.ChangingPosition](http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.ChangingPosition)
    * MaintainingPosition (NL-CM:4.3.12): [nl-base-Mobility.MaintainingPosition](http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.MaintainingPosition)
    * Transfer (NL-CM:4.3.5): [nl-base-Mobility.Transfer](http://nictiz.nl/fhir/StructureDefinition/nl-base-Mobility.Transfer)
    """
* extension[medicalDevice].value[x]
  * ^short = "MedicalDevice"
  * ^alias[+] = "MedischHulpmiddel"
  * ^definition = "Description of medical aids that can be used for limitations in mobility."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the patient’s mobility."
* hasMember[walking] ^definition = "The Walking concept (NL-CM:4.3.3) of zib Mobility, represented as a distinct Observation resource."
* hasMember[climbingStairs] ^definition = "The ClimbingStairs concept (NL-CM:4.3.18) of zib Mobility, represented as a distinct Observation resource."
* hasMember[changingPosition] ^definition = "The ChangingPosition concept (NL-CM:4.3.8) of zib Mobility, represented as a distinct Observation resource."
* hasMember[maintainingPosition] ^definition = "The MaintainingPosition concept (NL-CM:4.3.12) of zib Mobility, represented as a distinct Observation resource."
* hasMember[transfer] ^definition = "The Transfer concept (NL-CM:4.3.5) of zib Mobility, represented as a distinct Observation resource."

Mapping: NlbaseMobility-to-zib-mobility-v3.3-2020EN
Id: zib-mobility-v3.3-2020EN
Title: "zib Mobility-v3.3(2020EN)"
Source: NlbaseMobility
Target: "https://zibs.nl/wiki/Mobility-v3.3(2020EN)"
*  -> "NL-CM:4.3.1" "Mobility"
* extension[medicalDevice].value[x] -> "NL-CM:4.3.4" "MedicalDevice"
* note.text -> "NL-CM:4.3.16" "Comment"
