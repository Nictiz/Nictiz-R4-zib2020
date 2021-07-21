# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## zib-LivingSituation
* The comment element has been moved to `Observation.note.text`
* Added two new concepts and modulated them on `Observation.component:homeAdaption` and `Observation.component:livingCondition`
* Element 'HouseType' modulated on its own valueCodeableConcept slice 
* LivingSituationCode modulated on `Observation.code`