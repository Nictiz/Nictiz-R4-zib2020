Profile: NlbaseFluidBalanceFluidTotalIn
Parent: Observation
Id: nl-base-FluidBalance.FluidTotalIn
Title: "nl base FluidBalance.FluidTotalIn"
* insert ProfileMetadata(nl-base-FluidBalance.FluidTotalIn)
* ^purpose = "This Observation resource represents the FluidTotalIn concept (NL-CM:12.15.4) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) FluidBalance v1.0.1 (2020)](https://zibs.nl/wiki/FluidBalance-v1.0.1(2020EN))."

* code = http://snomed.info/sct#251852001
* effective[x] insert Discriminator(type, $this)
* effectivePeriod only Period
* value[x] only Quantity

// Short, alias, definition and comment texts
* ^description = "The total of fluid intake (e.g. by mouth, drip or tube feeding) in mL."
* . ^comment = "This Observation resource represents the FluidTotalIn concept (NL-CM:12.15.4) of zib FluidBalance. It can be used together with the [nl-base-FluidBalance](http://nictiz.nl/fhir/StructureDefinition/nl-base-FluidBalance) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`."
* effectivePeriod.start
  * ^short = "FluidBalanceStartTime"
  * ^alias[+] = "VochtbalansStarttijd"
  * ^definition = "The time at which the measurement of the fluid balance was started."
* effectivePeriod.end
  * ^short = "FluidBalanceStopTime"
  * ^alias[+] = "VochtbalansStoptijd"
  * ^definition = "The time at which the measurement of the fluid balance was stopped."
* value[x]
  * ^short = "FluidTotalIn"
  * ^alias[+] = "VochtTotaalIn"
  * ^definition = "The total of fluid intake (e.g. by mouth, drip or tube feeding) in mL."

Mapping: NlbaseFluidBalanceFluidTotalIn-to-zib-fluidbalance-v1.0.1-2020EN
Id: zib-fluidbalance-v1.0.1-2020EN
Title: "zib FluidBalance-v1.0.1(2020EN)"
Source: NlbaseFluidBalanceFluidTotalIn
Target: "https://zibs.nl/wiki/FluidBalance-v1.0.1(2020EN)"
* effectivePeriod.start -> "NL-CM:12.15.2" "FluidBalanceStartTime"
* effectivePeriod.end -> "NL-CM:12.15.3" "FluidBalanceStopTime"
* value[x] -> "NL-CM:12.15.4" "FluidTotalIn"
