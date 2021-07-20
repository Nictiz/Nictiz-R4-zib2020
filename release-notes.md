# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## zib-MedicationAgreement
* Removed references not accounted for by the zib.
* Placed fixed MedicationAgreementCode on a `MedicationRequest.category` slice so `category` can be used for other purposes too.
* Placed AgreedMedicine on a Reference type slice instead of the fixed `MedicationRequest.medicationReference` element adhering to the open world modeling principle.
* The generic AdditionalInformation extension, that was reused over multiple profiles and specified in the profile, has been replaced by specific extensions that are profiled in the extension.
* MedicationTreatment extension has a new canonical URL and is moved to the nl-core-profile as this is not part of the zib. The extension is better documented and contains a mapping to the MP dataset.
* Added MP CopyIndicator extension to nl-core profile.
* Mapped MP concept RelatieMedicatieafspraak  to `periorPrescription` instead of an extension in the nl-core profile. 
* Instead of one extension, the concepts MP RelatieToedieningsafspraak and RelatieMedicatiegebruik are placed in specific extensions in the nl-core profile.