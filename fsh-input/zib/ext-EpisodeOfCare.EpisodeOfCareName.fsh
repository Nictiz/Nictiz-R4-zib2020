Extension: ExtEpisodeOfCareEpisodeOfCareName
Id: ext-EpisodeOfCare.EpisodeOfCareName
Title: "ext EpisodeOfCare.EpisodeOfCareName"
Context: EpisodeOfCare
* insert ProfileMetadata(ext-EpisodeOfCare.EpisodeOfCareName)

* value[x] only string

// Short, alias, definition and comment texts
* ^description = "An extension to provide a name that characterizes the episode of care for the care provider."
* value[x]
  * ^short = "EpisodeOfCareName"
  * ^alias[+] = "ZorgEpisodeNaam"
  * ^definition = "A name that characterizes the episode of care for the care provider."

Mapping: ExtEpisodeOfCareEpisodeOfCareName-to-zib-episodeofcare-v1.0-2020EN
Id: zib-episodeofcare-v1.0-2020EN
Title: "zib EpisodeOfCare-v1.0(2020EN)"
Source: ExtEpisodeOfCareEpisodeOfCareName
Target: "https://zibs.nl/wiki/EpisodeOfCare-v1.0(2020EN)"
* value[x] -> "NL-CM:16.6.5" "EpisodeOfCareName"
