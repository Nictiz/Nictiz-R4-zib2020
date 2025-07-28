Profile: NlbaseTimeInterval
Parent: Period
Id: nl-base-TimeInterval
Title: "nl base TimeInterval"
* insert ProfileMetadata(nl-base-TimeInterval)
* ^purpose = "This Period datatype profile is one of the three StructureDefinitions that can be used to represent the Dutch (partial) [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) TimeInterval v1.0 (2020)](https://zibs.nl/wiki/TimeInterval-v1.0(2020EN)). 

This zib is represented in FHIR by a combination of two datatypes: _Period_ and _Duration_. To support this zib across different FHIR resource types, three related StructureDefinitions are provided:

* [ext-TimeInterval.Duration](http://nictiz.nl/fhir/StructureDefinition/ext-TimeInterval.Duration): extension to provide the _Duration_ datatype to resource types where no element with this datatype is normally available. This exentions should not be used in isolation, but only via one of the two resources described below!
* [zib-TimeInterval](http://nictiz.nl/fhir/StructureDefinition/zib-TimeInterval) (this profile): profile on the _Period_ datatype that defines mappings to zib TimeInterval and brings in the ext-TimeInterval.Duration extension mentioned above. For resource types that natively support an element of the _Period_ datatype but not of the _Duration_ datatype, this profile should be used.
* [ext-TimeInterval.Period](http://nictiz.nl/fhir/StructureDefinition/ext-TimeInterval.Period): extension to provide the _Period_ datatype plus the _Duration_ extension mentioned above, with mappings to zib TimeInterval. For resource types that support neither elements of datatype _Period_ or _Duration_, this extension should be used. *Note*: In hindsight the name of this extension is confusing, 'ext-TimeInterval' would have been better suited.
* *Note*: when the resource type natively supports elements of datatype _Period_ and _Duration_, the zib should be mapped onto these elements directly."

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-TimeInterval.Duration named duration 0..*

// Short, alias, definition and comment texts
* ^description = "A time interval indicates the time between two moments in time. Interval can be defined by a start time and end time, start time and duration or duration and end time."
* .
  * ^short = "TimeInterval"
  * ^alias[+] = "TijdsInterval"
* start
  * ^short = "startDateTime"
  * ^alias[+] = "startDatumTijd"
  * ^definition = "The start date and time of the interval."
* end
  * ^short = "endDateTime"
  * ^alias[+] = "eindDatumTijd"
  * ^definition = "The end date and time of the interval."

Mapping: NlbaseTimeInterval-to-zib-timeinterval-v1.0-2020EN
Id: zib-timeinterval-v1.0-2020EN
Title: "zib TimeInterval-v1.0(2020EN)"
Source: NlbaseTimeInterval
Target: "https://zibs.nl/wiki/TimeInterval-v1.0(2020EN)"
*  -> "NL-CM:20.3.1" "TimeInterval"
* start -> "NL-CM:20.3.2" "startDateTime"
* end -> "NL-CM:20.3.3" "endDateTime"
