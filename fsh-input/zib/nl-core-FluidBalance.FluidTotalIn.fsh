Profile: NlcoreFluidBalanceFluidTotalIn
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-FluidBalance.FluidTotalIn
Id: nl-core-FluidBalance.FluidTotalIn
Title: "nl core FluidBalance.FluidTotalIn"
* insert ProfileMetadata(nl-core-FluidBalance.FluidTotalIn)
* ^purpose = "This Observation resource represents the FluidTotalIn concept (NL-CM:12.15.4) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) FluidBalance v1.0.1 (2020)](https://zibs.nl/wiki/FluidBalance-v1.0.1(2020EN))."


// Short, alias, definition and comment texts
* ^description = "The total of fluid intake (e.g. by mouth, drip or tube feeding) in mL."
* .
  * ^alias[+] = "nl-core-FluidBalance.FluidTotalIn"
  * ^comment = "This Observation resource represents the FluidTotalIn concept (NL-CM:12.15.4) of zib FluidBalance. It can be used together with the [nl-core-FluidBalance](http://nictiz.nl/fhir/StructureDefinition/nl-core-FluidBalance) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
