Profile: NlcoreIllnessPerception
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-IllnessPerception
Id: nl-core-IllnessPerception
Title: "nl core IllnessPerception"
* insert ProfileMetadata(nl-core-IllnessPerception)
* insert Purpose(IllnessPerception, 3.1, Observation)

* hasMember[patientIllnessInsight] ..1
* hasMember[copingWithIllnessByPatient] ..1
* hasMember[copingWithIllnessByFamily] ..1

// Short, alias, definition and comment texts
* ^description = "In nearly all cases, a lengthy or life-threatening illness is a traumatic experience for the patient and their environment. Every patient deals with this in their own way. The way in which a person deals with problems and stress is also referred to as coping. Illness perception entails both the way the patient sees their situation and the way in which the patient and their environment deal with the situation (coping strategies)."
* .
  * ^alias[+] = "nl-core-IllnessPerception"
  * ^comment = """
    Several concepts of zib IllnessPerception are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * PatientIllnessInsight (NL-CM:18.5.3): [nl-core-IllnessPerception.PatientIllnessInsight](http://nictiz.nl/fhir/StructureDefinition/nl-core-IllnessPerception.PatientIllnessInsight)
    * CopingWithIllnessByPatient (NL-CM:18.5.4): [nl-core-IllnessPerception.CopingWithIllnessByPatient](http://nictiz.nl/fhir/StructureDefinition/nl-core-IllnessPerception.CopingWithIllnessByPatient)
    * CopingWithIllnessByPatient(NL-CM:18.5.5): [nl-core-IllnessPerception.CopingWithIllnessByFamily](http://nictiz.nl/fhir/StructureDefinition/nl-core-IllnessPerception.CopingWithIllnessByFamily)
    """
