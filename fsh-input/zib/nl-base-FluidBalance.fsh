Profile: NlbaseFluidBalance
Parent: Observation
Id: nl-base-FluidBalance
Title: "nl base FluidBalance"
* insert ProfileMetadata(nl-base-FluidBalance)
* insert Purpose(FluidBalance, 1.0.1, Observation)

* code = http://snomed.info/sct#710853006
* effective[x] insert Discriminator(type, $this)
* effectivePeriod only Period
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    fluidTotalIn 0..1 and
    fluidTotalOut 0..1
* hasMember[fluidTotalIn] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-FluidBalance.FluidTotalIn)
* hasMember[fluidTotalOut] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-FluidBalance.FluidTotalOut)

// Short, alias, definition and comment texts
* ^description = "The total water intake and water excretion within a certain time period: a disbalance can lead to for example dehydration or overfilling."
* .
  * ^short = "FluidBalance"
  * ^alias[+] = "Vochtbalans"
  * ^comment = """
    Several concepts of zib FluidBalance are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * FluidTotalIn (NL-CM:12.15.4): [nl-base-FluidBalance.FluidTotalIn](http://nictiz.nl/fhir/StructureDefinition/nl-base-FluidBalance.FluidTotalIn)
    * FluidTotalOut (NL-CM:12.15.5): [nl-base-FluidBalance.FluidTotalOut](http://nictiz.nl/fhir/StructureDefinition/nl-base-FluidBalance.FluidTotalOut)
    """
* effectivePeriod.start
  * ^short = "FluidBalanceStartTime"
  * ^alias[+] = "VochtbalansStarttijd"
  * ^definition = "The time at which the measurement of the fluid balance was started."
* effectivePeriod.end
  * ^short = "FluidBalanceStopTime"
  * ^alias[+] = "VochtbalansStoptijd"
  * ^definition = "The time at which the measurement of the fluid balance was stopped."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the fluid balance."
* hasMember[fluidTotalIn] ^definition = "The FluidTotalIn concept (NL-CM:12.15.4) of zib FluidBalance, represented as a distinct Observation resource."
* hasMember[fluidTotalOut] ^definition = "The FluidTotalOut concept (NL-CM:12.15.5) of zib FluidBalance, represented as a distinct Observation resource."

Mapping: NlbaseFluidBalance-to-zib-fluidbalance-v1.0.1-2020EN
Id: zib-fluidbalance-v1.0.1-2020EN
Title: "zib FluidBalance-v1.0.1(2020EN)"
Source: NlbaseFluidBalance
Target: "https://zibs.nl/wiki/FluidBalance-v1.0.1(2020EN)"
*  -> "NL-CM:12.15.1" "FluidBalance"
* effectivePeriod.start -> "NL-CM:12.15.2" "FluidBalanceStartTime"
* effectivePeriod.end -> "NL-CM:12.15.3" "FluidBalanceStopTime"
* note.text -> "NL-CM:12.15.6" "Comment"
