# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## zib-Patient
* Includes Nationality, MaritalStatus, LanguageProficiency
* Cardinality of `Patient.extension:nationality` left at 0..* due to the nature of the nationality core extension (which allows for a period to be placed next to the nationality and thus allows for different nationalities over time)
* Cardinality of `Patient.name` left at 0..* to allow including several name elements with a different name.use each.
* Cardinality of `Patient.telecom` left at 0..* to allow including several contact elements, because the zib ContactInformation includes a container that FHIR does not dot.
* Added a comment to `deceased[x]`: When exporting the data, if `deceasedDateTim` (DateOfDeath) is present and has a value, DeathIndicator may be set to 'true', since DeathIndicator and DateOfDeath cannot both be represented at the same time.