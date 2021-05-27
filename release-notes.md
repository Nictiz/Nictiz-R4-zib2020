# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.


## zib-Problem
* ProbleemType has been added on a slice of `Condition.category` allowing the category element to be used for other purpose too.
* The new concept FurtherSpecificationProblemName has been added in an extension within `Condition.code`.
* `Condition.bodySite` is now based on the zib AnatomicalLocation profile.
* The ProblemStartDate and ProblemEndDate are placed on a DateTime type slice of `Condition.onset[x]` and `Condition.abatement[x]` allowing the option to use other types.
* The `Condition.note`now honours the max cardinality of zib Comment.

## Encounter
* HealthProfessional has his own profile slice on `Encounter.participant`
* `Period.start` change to cardinality 0 .. 1 
* Mapping `.reason.text` moved to `.reasonCode.text`
* New concept `reasonReference` added in the encounter resource 

