Profile: NlbaseEpisodeOfCare
Parent: EpisodeOfCare
Id: nl-base-EpisodeOfCare
Title: "nl base EpisodeOfCare"
* insert ProfileMetadata(nl-base-EpisodeOfCare)
* insert Purpose(EpisodeOfCare, 1.0, EpisodeOfCare)

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-Comment named comment 0..1 and
    http://nictiz.nl/fhir/StructureDefinition/ext-EpisodeOfCare.EpisodeOfCareName named episodeOfCareName 0..*
* diagnosis.condition only Reference(http://hl7.org/fhir/StructureDefinition/Condition or http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)

// Short, alias, definition and comment texts
* ^description = "The period in which a health problem, such as a complaint or illness, receives attention from a care provider. During this period the designation of this health problem can change due to evolving insight and/or the progress of the illness. An episode of care serves as a context for all data related to the health problem."
* .
  * ^short = "EpisodeOfCare"
  * ^alias[+] = "ZorgEpisode"
* extension[comment].value[x]
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Additional information about the episode of care that the care provider wishes to see at first glance."
* status ^definition = """
    Sending systems that don't record an explicit status can use the following guidance to infer a value from the zib:
    
    * No dates known:
        * default value: _active_
    
    * StartDate present:
        * and StartDate in the future: _planned_ 
        * and StartDate in the past:
          * EndDate in the future or absent: _active_
          * EndDate in the past: _finished_
    
    * StartDate absent:
      * and EndDate in the future: _active_
      * and EnDate in the past: _finished_
    """
* diagnosis.condition
  * ^short = "FocusEpisodeOfCare"
  * ^alias[+] = "FocusZorgEpisode"
  * ^definition = "The health problem on which the episode of care focuses."
* period.start
  * ^short = "StartDate"
  * ^alias[+] = "BeginDatum"
  * ^definition = "The date that marks the beginning of the episode of care. Usually this is the date of the first contact of the patient with the care provider in the context of the health problem."
* period.end
  * ^short = "EndDate"
  * ^alias[+] = "EindDatum"
  * ^definition = "The date that marks the end of the episode of care. This can be the date of the last contact of the patient with the care provider in the context of the health problem, but also thereafter on the basis of hindsight"

Mapping: NlbaseEpisodeOfCare-to-zib-episodeofcare-v1.0-2020EN
Id: zib-episodeofcare-v1.0-2020EN
Title: "zib EpisodeOfCare-v1.0(2020EN)"
Source: NlbaseEpisodeOfCare
Target: "https://zibs.nl/wiki/EpisodeOfCare-v1.0(2020EN)"
*  -> "NL-CM:16.6.1" "EpisodeOfCare"
* extension[comment].value[x] -> "NL-CM:16.6.6" "Comment"
* status -> "NL-CM:16.6.2" "StartDate (implicit, main mapping is on EpisodeOfCare.period.start)"
* status -> "NL-CM:16.6.3" "EndDate (implicit, main mapping is on EpisodeOfCare.period.end)"
* diagnosis.condition -> "NL-CM:16.6.4" "FocusEpisodeOfCare"
* period.start -> "NL-CM:16.6.2" "StartDate"
* period.end -> "NL-CM:16.6.3" "EndDate"
