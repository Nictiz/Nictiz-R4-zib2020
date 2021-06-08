# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## zib-MedicationAgreement
* Removed references not accounted for by the zib.
* Placed fixed MedicationAgreementCode on a `MedicationRequest.category` slice so `category` can be used for other purposes too.
* Placed AgreedMedicine on a Reference type slice instead of the fixed `MedicationRequest.medicationReference` element adhering to the open world modeling principle.
* The generic AdditionalInformation extension, that was reused over multiple profiles and specified in the profile, has been replaced by specific extensions that are profiled in the extension.