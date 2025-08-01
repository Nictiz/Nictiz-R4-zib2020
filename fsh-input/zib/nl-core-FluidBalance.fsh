Profile: NlcoreFluidBalance
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-FluidBalance
Id: nl-core-FluidBalance
Title: "nl core FluidBalance"
* insert ProfileMetadata(nl-core-FluidBalance)
* insert Purpose(FluidBalance, 1.0.1, Observation)

* insert NlCorePatientForObservation
* note ..1
* hasMember[fluidTotalIn] ..1
* hasMember[fluidTotalIn] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-FluidBalance.FluidTotalIn)
* hasMember[fluidTotalOut] ..1
* hasMember[fluidTotalOut] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-FluidBalance.FluidTotalOut)

// Short, alias, definition and comment texts
* ^description = "The total water intake and water excretion within a certain time period: a disbalance can lead to for example dehydration or overfilling."
* .
  * ^alias[+] = "nl-core-FluidBalance"
  * ^comment = """
    Several concepts of zib FluidBalance are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * FluidTotalIn (NL-CM:12.15.4): [nl-core-FluidBalance.FluidTotalIn](http://nictiz.nl/fhir/StructureDefinition/nl-core-FluidBalance.FluidTotalIn)
    * FluidTotalOut (NL-CM:12.15.5): [nl-core-FluidBalance.FluidTotalOut](http://nictiz.nl/fhir/StructureDefinition/nl-core-FluidBalance.FluidTotalOut)
    """
