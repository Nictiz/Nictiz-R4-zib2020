# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## zib-PharmaceuticalProduct
* A combined valueset is now used for MedicationCode and IngredientCode instead of a slicing construct of `CodeableConceptcoding`.
* Removed references not accounted for by the zib.
* Placed SubstanceCode on a CodeableConcept type slice instead of the .item[x] element adhering to the open world modeling principle.
* Changed profile canoncial URL to align with the zib name.  