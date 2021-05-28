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

## zib-Refraction
* New zib, no STU3 version

## zib-VisualAcuity
* New zib

## zib-TextResult
* New concept VisualResult mapped in additional profile zib-TextResult-MediaMedia on Media.content. DiagnosticReport.image.link references this profile.

## Procedure
* ProcedureStartDate and ProcedureEndDate have been mapped to `Procedure.performed[x]` instead of `Procedure.performedPeriod` to account for the use of `Procedure.performedDateTime` when the zib Procedure concerns a instantaneous procedure.
* Aligned cardinality of ProcedureMethod by setting the 'procedure-method' to 0..* instead of 0..0.
* The ProcedureAnatomicalLocation is mapped on `Procedure.bodySite` and the cadinality has been set to 0..1 instead of 0..*.
* The resource ProcedureRequest has been renamed to ServiceRequest and now includes a mapping for all the possible concepts of zib Procedure. Compared to STU3 a mapping has been added for ProcedureMethod, ProcedureAnatomicalLocation, MedicalDevice, ProcedureStartDate and ProcedureEndDate.
* `Procedure.location` and `ServiceRequest.locationReference` are used to reference the zib HealthcareProvider instead of `Procedure.performer` and `ProcedureRequest.performer` to indicate where the Procedure takes place.
* The `Procedure.performer` only references the zib HealthProfessional represented in a PractitionerRole resource. Other references not dictated by the zib are removed.
* `ServiceRequest.performer` contains a reference to the zib CareTeam because the FHIR definition deviates from the zib Performer concept when multiple references are provided. This is described in the element's comment.

## zib-FreedomRistrictingIntervention
* This concerns a newly added zib.

## zib-SOAPReport
This is a newly added zib but had profiles that preceded the zib, namely gp-EncounterReport and gp-JournalEntry.
* Removed constraints not accounted for by the zib.
* Placed SOAPLine on a slice of `Composition.section` with a max cardinality of 4 conform the zib.
* Removed min cardinality of `Composition.section.text`.
* Removed min cardinality of `Observation.valueString` and moved mapping to a string type slice.
* Removed fixed value of `Observation.status`
* In the SOAPLineCode extension the fixed value on `.valueCodeableConcept.coding.system` has been removed because it is now covered by a required binding.
* Moved mapping of SOAPLineCode from `Observation.component`s to a custom extension because of lacking terminology codes to provide definiton ot the component.

## zib-Encounter
* ContactWith is mapped on a slice of `Encounter.participant`.
* `Encounter.participant.type` now honours the maximum cardinality of HealthProfessionalRole. 
* `Encounter.period.start` changed to cardinality 0 .. 1 due to the zibs conceptual cardinalities concept.
* The mapping of concepts Problem, Procedure and DeviatingResult is moved to `Encounter.reasonReference`.
* The mapping of Location is moved to `Encounter.location.location`.
* Reference to other profiles not accounted for by the zib have been removed.

