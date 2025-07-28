Profile: NlbaseLivingSituation
Parent: Observation
Id: nl-base-LivingSituation
Title: "nl base LivingSituation"
* insert ProfileMetadata(nl-base-LivingSituation)
* insert Purpose(LivingSituation, 3.3, Observation)

* code = http://snomed.info/sct#365508006
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    houseType 0..1 and
    homeAdaption 0.. and
    livingCondition 0..
* hasMember[houseType] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation.HouseType)
* hasMember[homeAdaption] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation.HomeAdaption)
* hasMember[livingCondition] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation.LivingCondition)

// Short, alias, definition and comment texts
* ^description = "The living situation is the physical environment in which the patient normally lives, sleeps, keeps their clothing, etc."
* .
  * ^short = "LivingSituation"
  * ^alias[+] = "Woonsituatie"
  * ^comment = """
    Several concepts of zib LivingSituation are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * HouseType (NL-CM:7.8.3): [nl-base-LivingSituation.HouseType](http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation.HouseType)
    * HomeAdaption (NL-CM:7.8.5): [nl-base-LivingSituation.HomeAdaption ](http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation.HomeAdaption)
    * LivingCondition (NL-CM:7.8.4): [nl-base-LivingSituation.LivingCondition ](http://nictiz.nl/fhir/StructureDefinition/nl-base-LivingSituation.LivingCondition)
    """
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comments in free text on problems or details of the patient’s living situation that may be relevant."
* hasMember[houseType] ^definition = "The HouseType concept (NL-CM:7.8.3) of zib LivingSituation, represented as a distinct Observation resource."
* hasMember[homeAdaption] ^definition = "The HomeAdaption concept (NL-CM:7.8.5) of zib LivingSituation, represented as a distinct Observation resource."
* hasMember[livingCondition] ^definition = "The LivingCondition concept (NL-CM:7.8.4) of zib LivingSituation, represented as a distinct Observation resource."

Mapping: NlbaseLivingSituation-to-zib-livingsituation-v3.3-2020EN
Id: zib-livingsituation-v3.3-2020EN
Title: "zib LivingSituation-v3.3(2020EN)"
Source: NlbaseLivingSituation
Target: "https://zibs.nl/wiki/LivingSituation-v3.3(2020EN)"
*  -> "NL-CM:7.8.1" "LivingSituation"
* note.text -> "NL-CM:7.8.2" "Comment"
