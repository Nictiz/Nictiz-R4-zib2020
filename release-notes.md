# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## zib-Encounter
* ContactWith is mapped on a slice of `Encounter.participant`.
* `Encounter.participant.type` now honours the maximum cardinality of HealthProfessionalRole. 
* `Encounter.period.start` changed to cardinality 0 .. 1 due to the zibs conceptual cardinalities concept.
* The mapping of concepts Problem, Procedure and DeviatingResult is moved to `Encounter.reasonReference`.
* The mapping of Location is moved to `Encounter.location.location`.
* Reference to other profiles not accounted for by the zib have been removed.
