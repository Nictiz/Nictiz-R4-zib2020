Profile: NlcoreParticipationInSociety
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety
Id: nl-core-ParticipationInSociety
Title: "nl core ParticipationInSociety"
* insert ProfileMetadata(nl-core-ParticipationInSociety)
* insert Purpose(ParticipationInSociety, 3.1, Observation)

* note ..1
* hasMember[socialNetwork] ..1
* hasMember[socialNetwork] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-ParticipationInSociety.SocialNetwork)
* hasMember[hobby] ..1
* hasMember[hobby] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-ParticipationInSociety.Hobby)
* hasMember[workSituation] ..1
* hasMember[workSituation] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-ParticipationInSociety.WorkSituation)

// Short, alias, definition and comment texts
* ^description = "Participation in society pertains to the patient’s initiative to participate in social activities in daily life, such as practicing a profession and hobbies. Participation in society also describes the patient’s social network."
* .
  * ^alias[+] = "nl-core-ParticipationInSociety"
  * ^comment = """
    Several concepts of zib ParticipationInSociety are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * SocialNetwork (NL-CM:18.6.2): [nl-core-ParticipationInSociety.SocialNetwork](http://nictiz.nl/fhir/StructureDefinition/nl-core-ParticipationInSociety.SocialNetwork)
    * Hobby (NL-CM:18.6.3): [nl-core-ParticipationInSociety.Hobby](http://nictiz.nl/fhir/StructureDefinition/nl-core-ParticipationInSociety.Hobby)
    * WorkSituation (NL-CM:18.6.5): [nl-core-ParticipationInSociety.WorkSituation](http://nictiz.nl/fhir/StructureDefinition/nl-core-ParticipationInSociety.WorkSituation)
    """
