# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## Problem
* `ProblemStatusCodeList` modulated on the slice `.clinicalStatus.coding:problemStatusCodelist` instead of an extension
* Added `clinicalStatus` valueSet binding on `.clinicalStatus.coding:clinicalStatus`
* `VerificationStatusCodelist` modulated on the slice `.verificationStatus.coding:verificationStatusCodelist` instead of an extension
* ProblemType mapping on the slice `.category:problemType`
* `Condition.code` kardinality change to 0 .. 1
* `Condition.bodySite` has a reference to http://nictiz.nl/fhir/StructureDefinition/zib-AnatomicalLocation profile
