Extension: ExtTimeIntervalPeriod
Id: ext-TimeInterval.Period
Title: "ext TimeInterval.Period"
Context: MedicationRequest
* insert ProfileMetadata(ext-TimeInterval.Period)

* value[x] only Period
* value[x] ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-TimeInterval

// Short, alias, definition and comment texts
* ^description = "An extension to provide all concepts of zib TimeInterval, to be used in resources where none of these concepts are natively supported."
* ^purpose = """
    This extension is one of the three StructureDefinitions that can be used to represent the Dutch (partial) [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) TimeInterval v1.0 (2020)](https://zibs.nl/wiki/TimeInterval-v1.0(2020EN)). 
    
    This zib is represented in FHIR by a combination of two datatypes: _Period_ and _Duration_. To support this zib across different FHIR resource types, three related StructureDefinitions are provided:
    
    * [ext-TimeInterval.Duration](http://nictiz.nl/fhir/StructureDefinition/ext-TimeInterval.Duration): extension to provide the _Duration_ datatype to resource types where no element with this datatype isn't normally available. This extension should not be used in isolation, but only via one of the two resources described below!
    * [zib-TimeInterval](http://nictiz.nl/fhir/StructureDefinition/zib-TimeInterval): profile on the _Period_ datatype that defines mappings to zib TimeInterval and brings in the ext-TimeInterval.Duration extension mentioned above. For resource types that natively support an element of the _Period_ datatype but not of the _Duration_ datatype, this profile should be used.
    * [ext-TimeInterval.Period](http://nictiz.nl/fhir/StructureDefinition/ext-TimeInterval.Period) (this extension): extension to provide the _Period_ datatype plus the _Duration_ extension mentioned above, with mappings to zib TimeInterval. For resource types that support neither elements of datatype _Period_ nor _Duration_, this extension should be used. *Note*: In hindsight the name of this extension is confusing, 'ext-TimeInterval' would have been better suited.
    * *Note*: when the resource type natively supports elements of datatype _Period_ and _Duration_, the zib should be mapped onto these elements directly.
    """
