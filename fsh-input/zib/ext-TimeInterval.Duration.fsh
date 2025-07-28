Extension: ExtTimeIntervalDuration
Id: ext-TimeInterval.Duration
Title: "ext TimeInterval.Duration"
Context: Period
* insert ProfileMetadata(ext-TimeInterval.Duration)

* . 0..1
* value[x] only Duration

// Short, alias, definition and comment texts
* ^description = "An extension to provide the Duration concept of zib TimeInterval."
* ^purpose = """
    This extension can be used to represent the Duration concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) TimeInterval v1.0 (2020)](https://zibs.nl/wiki/TimeInterval-v1.0(2020EN)).
    
    Please note: this extension should not be added to profiles in isolation, but via either the [zib-TimeInterval](http://nictiz.nl/fhir/StructureDefinition/zib-TimeInterval) profile or the [ext-TimeInterval.Period](http://nictiz.nl/fhir/StructureDefinition/ext-TimeInterval.Period) extension. See the documentation on these resources for more information.
    """
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
