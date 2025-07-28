Profile: NlbaseIllnessPerception
Parent: Observation
Id: nl-base-IllnessPerception
Title: "nl base IllnessPerception"
* insert ProfileMetadata(nl-base-IllnessPerception)
* insert Purpose(IllnessPerception, 3.1, Observation)

* code = http://snomed.info/sct#363910003
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    patientIllnessInsight 0..1 and
    copingWithIllnessByPatient 0..1 and
    copingWithIllnessByFamily 0..1
* hasMember[patientIllnessInsight] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception.PatientIllnessInsight)
* hasMember[copingWithIllnessByPatient] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception.CopingWithIllnessByPatient)
* hasMember[copingWithIllnessByFamily] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception.CopingWithIllnessByFamily)

// Short, alias, definition and comment texts
* ^description = "In nearly all cases, a lengthy or life-threatening illness is a traumatic experience for the patient and their environment. Every patient deals with this in their own way. The way in which a person deals with problems and stress is also referred to as coping. Illness perception entails both the way the patient sees their situation and the way in which the patient and their environment deal with the situation (coping strategies)."
* .
  * ^short = "IllnessPerception"
  * ^alias[+] = "Ziektebeleving"
  * ^comment = """
    Several concepts of zib IllnessPerception are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * PatientIllnessInsight (NL-CM:18.5.3): [nl-base-IllnessPerception.PatientIllnessInsight](http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception.PatientIllnessInsight)
    * CopingWithIllnessByPatient (NL-CM:18.5.4): [nl-base-IllnessPerception.CopingWithIllnessByPatient](http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception.CopingWithIllnessByPatient)
    * CopingWithIllnessByPatient(NL-CM:18.5.5): [nl-base-IllnessPerception.CopingWithIllnessByFamily](http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception.CopingWithIllnessByFamily)
    """
* hasMember[patientIllnessInsight] ^definition = "The PatientIllnessInsight concept (NL-CM:18.5.3) of zib IllnessPerception, represented as a distinct Observation resource."
* hasMember[copingWithIllnessByPatient] ^definition = "The CopingWithIllnessByPatient concept (NL-CM:18.5.4) of zib IllnessPerception, represented as a distinct Observation resource."
* hasMember[copingWithIllnessByFamily] ^definition = "The CopingWithIllnessByFamily concept (NL-CM:18.5.5) of zib IllnessPerception, represented as a distinct Observation resource."

Mapping: NlbaseIllnessPerception-to-zib-illnessperception-v3.1-2020EN
Id: zib-illnessperception-v3.1-2020EN
Title: "zib IllnessPerception-v3.1(2020EN)"
Source: NlbaseIllnessPerception
Target: "https://zibs.nl/wiki/IllnessPerception-v3.1(2020EN)"
*  -> "NL-CM:18.5.1" "IllnessPerception"
