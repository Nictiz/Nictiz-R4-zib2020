# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## BodyHeight
* baseDefinition changed from "http://nictiz.nl/fhir/StructureDefinition/bodyheight" to "http://hl7.org/fhir/StructureDefinition/Observation"
* `ValueQuantity` has his own type slice on `Observation.value[x]`
* `Observation.comment` has changed to `Observation.note`
* `EffectiveDateTime` has his own type slice on `Observation.effective[x]`
