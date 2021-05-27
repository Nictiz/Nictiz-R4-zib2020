# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## zib-SOAPReport
This is a newly added zib but had profiles that preceded the zib, namely gp-EncounterReport and gp-JournalEntry.
* Removed constraints not accounted for by the zib.
* Placed SOAPLine on a slice of `Composition.section` with a max cardinality of 4 conform the zib.
* Removed min cardinality of `Composition.section.text`.
* Removed min cardinality of `Observation.valueString` and moved mapping to a string type slice.
* Removed fixed value of `Observation.status`
* In the SOAPLineCode extension the fixed value on `.valueCodeableConcept.coding.system` has been removed because it is now covered by a required binding.
* Moved mapping of SOAPLineCode from `Observation.component`s to a custom extension because of lacking terminology codes to provide definiton ot the component.