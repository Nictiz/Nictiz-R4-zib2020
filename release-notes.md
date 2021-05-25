# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## Procedure
* ProcedureStartDate and ProcedureEndDate have been mapped to `Procedure.performed[x]` instead of `Procedure.performedPeriod` to account for the use of `Procedure.performedDateTime` when the zib Procedure concerns a instantaneous procedure.
* Aligned cardinality of ProcedureMethod by setting the 'procedure-method' to 0..* instead of 0..0.
* The ProcedureAnatomicalLocation is used on `Procedure.bodySite`and the cadinality has been set to 0..1 instead of 0..*.
* The resource ProcedureRequest has been renamed to ServiceRequest and now includes a mapping for all the possible concepts of zib Procedure. Compared to STU3 a mapping has been added for ProcedureMethod, ProcedureAnatomicalLocation, MedicalDevice, ProcedureStartDate and ProcedureEndDate.
* `Procedure.location` and `ServiceRequest.locationReference` instead of `Procedure.performer` and `ProcedureRequest.performer` are used to reference the zib HealthcareProvider to indicate where the Procedure takes place.
* The `Procedure.performer`only references the zib Healthprofessional represented in a PractitionerRole resourse. Other references not dictaded by the zib are removed.
* `ServiceRequest.performer` contains a refernce to the zib CareTeam because the FHIR definition deviates from the zib Performer concept when multiple references are provided. This is described in the element's comment.