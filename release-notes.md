# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## zib-NameInformation
Style - profiling guidelines
* Moved information and mappings from the extension level to the `value[x]` level. Note that the zib compliance test is complaining now about cardinality differences.
* `HumanName.family.extensions` now have the zib conceptnames as slicenames instead of the exention names.
* Usage of correct zib alias values
* Removed copied FHIR definitions and comments as this orginated  from DSTU2 and is given in the base datatype. Moreover, this increases the focus on our added comments. 
* Removed BRP mappings
-----
* Sliced HumanName.given for every zib concept that is mapped to this element. Slices are differentiated by a mandatory qualifier extension that contains a pattern. This makes the profile more explicit.
* Added mappings for the newly added zib concept 'titels' on `prefix` and `suffix`. Added documentation/implementation guidance on prefix and the root.
* Added a notion that `HumanName.use` is discouraged on the root and in the use element.
* Added a notion on the root that explains that if HumanName.use is used, the full name will likely break up in multiple instances of the HumanName. Systems should expect this.
* Added invariant to test for when `HumanName.use` is official that the name is truly official.
* Removed use in the inline examples
* Added a notion on the root that `HumanName.text` is encouraged to be given too.
* Added a notion on the root that we have not profiled the zib constraint to mandate a LastName.