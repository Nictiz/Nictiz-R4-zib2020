Profile: NlcoreEpisodeOfCare
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-EpisodeOfCare
Id: nl-core-EpisodeOfCare
Title: "nl core EpisodeOfCare"
* insert ProfileMetadata(nl-core-EpisodeOfCare)
* insert Purpose(EpisodeOfCare, 1.0, EpisodeOfCare)

* extension[comment] ..1
* diagnosis ..1

// Short, alias, definition and comment texts
* ^description = "The period in which a health problem, such as a complaint or illness, receives attention from a care provider. During this period the designation of this health problem can change due to evolving insight and/or the progress of the illness. An episode of care serves as a context for all data related to the health problem."
* . ^alias[+] = "nl-core-EpisodeOfCare"
