Profile: NlcoreFluidBalanceFluidTotalOut
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-FluidBalance.FluidTotalOut
Id: nl-core-FluidBalance.FluidTotalOut
Title: "nl core FluidBalance.FluidTotalOut"
* insert ProfileMetadata(nl-core-FluidBalance.FluidTotalOut)
* ^purpose = "This Observation resource represents the FluidTotalOut concept (NL-CM:12.15.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) FluidBalance v1.0.1 (2020)](https://zibs.nl/wiki/FluidBalance-v1.0.1(2020EN))."

* insert NlCorePatientForObservation

// Short, alias, definition and comment texts
* ^description = "The total of fluid intake (e.g. by mouth, drip or tube feeding) in mL."
* .
  * ^alias[+] = "nl-core-FluidBalance.FluidTotalOut"
  * ^comment = "This Observation resource represents the FluidTotalOut concept (NL-CM:12.15.5) of zib FluidBalance. It can be used together with the [nl-core-FluidBalance](http://nictiz.nl/fhir/StructureDefinition/nl-core-FluidBalance) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
