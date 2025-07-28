Profile: NlbaseTextResultVisualResult
Parent: Media
Id: nl-base-TextResult.VisualResult
Title: "nl base TextResult.VisualResult"
* insert ProfileMetadata(nl-base-TextResult.VisualResult)
* ^purpose = "This Media resource represents the VisualResult concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) TextResult v4.4 (2020)](https://zibs.nl/wiki/TextResult-v4.4(2020EN))."


// Short, alias, definition and comment texts
* ^description = "Visual examination results that are the starting point and reason for the textual report as represented by the zib TextResult. These results include visual material - e.g. radiological images, scopy images, medical photos and videos - as well as graphic recordings - e.g. ECGs, EEGs etc."
* content
  * ^short = "VisualResult"
  * ^alias[+] = "VisueelResultaat"
  * ^definition = "Visual examination results that are the starting point and reason for the textual report. These results include visual material - e.g. radiological images, scopy images, medical photos and videos - as well as graphic recordings - e.g. ECGs, EEGs etc."

Mapping: NlbaseTextResultVisualResult-to-zib-textresult-v4.4-2020EN
Id: zib-textresult-v4.4-2020EN
Title: "zib TextResult-v4.4(2020EN)"
Source: NlbaseTextResultVisualResult
Target: "https://zibs.nl/wiki/TextResult-v4.4(2020EN)"
* content -> "NL-CM:13.2.7" "VisualResult"
