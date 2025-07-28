Profile: NlbaseParticipationInSociety
Parent: Observation
Id: nl-base-ParticipationInSociety
Title: "nl base ParticipationInSociety"
* insert ProfileMetadata(nl-base-ParticipationInSociety)
* insert Purpose(ParticipationInSociety, 3.1, Observation)

* code = http://snomed.info/sct#314845004
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    socialNetwork 0..1 and
    hobby 0..1 and
    workSituation 0..1
* hasMember[socialNetwork] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety.SocialNetwork)
* hasMember[hobby] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety.Hobby)
* hasMember[workSituation] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety.WorkSituation)

// Short, alias, definition and comment texts
* ^description = "Participation in society pertains to the patient’s initiative to participate in social activities in daily life, such as practicing a profession and hobbies. Participation in society also describes the patient’s social network."
* .
  * ^short = "ParticipationInSociety"
  * ^alias[+] = "ParticipatieInMaatschappij"
  * ^comment = """
    Several concepts of zib ParticipationInSociety are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * SocialNetwork (NL-CM:18.6.2): [nl-base-ParticipationInSociety.SocialNetwork](http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety.SocialNetwork)
    * Hobby (NL-CM:18.6.3): [nl-base-ParticipationInSociety.Hobby](http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety.Hobby)
    * WorkSituation (NL-CM:18.6.5): [nl-base-ParticipationInSociety.WorkSituation](http://nictiz.nl/fhir/StructureDefinition/nl-base-ParticipationInSociety.WorkSituation)
    """
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the participation in society."
* hasMember[socialNetwork] ^definition = "The SocialNetwork concept (NL-CM:18.6.2) of zib ParticipationInSociety, represented as a distinct Observation resource."
* hasMember[hobby] ^definition = "The Hobby concept (NL-CM:18.6.3) of zib ParticipationInSociety, represented as a distinct Observation resource."
* hasMember[workSituation] ^definition = "The WorkSituation concept (NL-CM:18.6.4) of zib ParticipationInSociety, represented as a distinct Observation resource."

Mapping: NlbaseParticipationInSociety-to-zib-participationinsociety-v3.1-2020EN
Id: zib-participationinsociety-v3.1-2020EN
Title: "zib ParticipationInSociety-v3.1(2020EN)"
Source: NlbaseParticipationInSociety
Target: "https://zibs.nl/wiki/ParticipationInSociety-v3.1(2020EN)"
*  -> "NL-CM:18.6.1" "ParticipationInSociety"
* note.text -> "NL-CM:18.6.5" "Comment"
