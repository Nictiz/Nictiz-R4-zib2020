Extension: ExtTimeIntervalDuration
Id: ext-TimeInterval.Duration
Title: "ext TimeInterval.Duration"
Context: Period
* insert ProfileMetadata(ext-TimeInterval.Duration)

* value[x] only Duration

// Short, alias, definition and comment texts
* ^description = "An extension to provide the Duration concept of zib TimeInterval."
* value[x]
  * ^short = "Duration"
  * ^alias[+] = "tijdsDuur"
  * ^definition = "The duration of the interval in appropriate units of time (e.g. days or hours, etc.)."

Mapping: ExtTimeIntervalDuration-to-zib-timeinterval-v1.0-2020EN
Id: zib-timeinterval-v1.0-2020EN
Title: "zib TimeInterval-v1.0(2020EN)"
Source: ExtTimeIntervalDuration
Target: "https://zibs.nl/wiki/TimeInterval-v1.0(2020EN)"
* value[x] -> "NL-CM:20.3.4" "Duration"
