Profile: NlcoreLivingSituation
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation
Id: nl-core-LivingSituation
Title: "nl core LivingSituation"
* insert ProfileMetadata(nl-core-LivingSituation)
* insert Purpose(LivingSituation, 3.3, Observation)

* insert NlCorePatientForObservation
* note ..1
* hasMember[houseType] ..1
* hasMember[houseType] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-LivingSituation.HouseType)
* hasMember[homeAdaption] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-LivingSituation.HomeAdaption)
* hasMember[livingCondition] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-LivingSituation.LivingCondition)

// Short, alias, definition and comment texts
* ^description = "The living situation is the physical environment in which the patient normally lives, sleeps, keeps their clothing, etc."
* .
  * ^alias[+] = "nl-core-LivingSituation"
  * ^comment = """
    Several concepts of zib LivingSituation are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * HouseType (NL-CM:7.8.3): [nl-core-LivingSituation.HouseType](http://nictiz.nl/fhir/StructureDefinition/nl-core-LivingSituation.HouseType)
    * HomeAdaption (NL-CM:7.8.5): [nl-core-LivingSituation.HomeAdaption ](http://nictiz.nl/fhir/StructureDefinition/nl-core-LivingSituation.HomeAdaption)
    * LivingCondition (NL-CM:7.8.4): [nl-core-LivingSituation.LivingCondition ](http://nictiz.nl/fhir/StructureDefinition/nl-core-LivingSituation.LivingCondition)
    """
