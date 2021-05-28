# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

<<<<<<< HEAD
## zib-Problem
* ProbleemType has been added on a slice of `Condition.category` allowing the category element to be used for other purpose too.
* FurtherSpecificationProblemName has been added with an extension on `Condition.code`.
* `Condition.bodySite` is now based on the zib AnatomicalLocation profile.
* ProblemStartDate and ProblemEndDate are placed on a DateTime type slice of `Condition.onset[x]` and `Condition.abatement[x]` allowing the option to use other types.
* `Condition.note`now honours the max cardinality of zib Comment.
* `Condition.verificationStatus` contains a mandatory `.coding` element to capture the zib terminology because of the required binding on the CodeableConcept level and the zib and FHIR valueset do not completely map.

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

## zib-HealthProfessional
* `Practitioner.identifier` slices changed cardinality from 0..1 to 0..*.
* Added HealthProfessionalIdentificationNumber mapping on `PracititionerRole.identifier`.
* Added new mapping of Gender in Practitioner.
* Added textual guidance on the root to clarify the use of Practitioner and PractitionerRole.
* Added textual guidance on the root of the concept of HealthProfessionalRole.
* `PracitionRole.speciality` is not sliced anymore but has a combined ValueSet.
* Explained cardinality mismatch of Practitioner.name on that element.

## zib-HealthcareProvider
* `Organization.identifier` is now sliced based on a pattern.
* `Organization.type[DepartmentSpecialty]` and `Organization.type[OrganizationType]` from 0..* to 0..1
* For `Organization.type` the slicing discriminator is changed from fixed system values to valueset binding.
* Removed comments on `Organization.alias` because it has no basis in the zib
* Added comments on the root to point out to the usage of Location resource and the `Organization.partOf`.
* Major change: use of Location resource
=======
## zib-AddressInformation
* Added extra comments on the history of the mapping in relation to v3
* Removed mapping to BRP
* Added guidance on adding a value to `Address.line` to duplicate the relevant information in case the extensions are not supported
* Renamed `Address.line` extensions to their functional counterparts
* Added a comment to `line.extension:houseNumberLetter-houseNumberAddition` on the possibility of a leading space not being parsed
* Added a constraint to `line.extension:houseNumberIndication` to restrict it to the values 'by' or 'to'
* Mapped AddressType to `extension:addressType` and added ConceptMaps to map AddressType to `.use` and `.type` to adhere to international use. However, `extension:official` was removed. AddressType code 'HP' is now mapped to `.use` 'home' and `.type` 'both'. This was done because of two reasons:
 * The notion to mark an address as 'official' seems to have its origin in the BRP, but is absent in the zib model.
 * The addition of `extension:official` seemed based on the rationale: "if implementers do not support the custom `extension:addressType`, you should be able to determine the AddressType by looking at `.use`, `.type` and custom `extension:official`". However, in this use case extension:official would probably also be not supported. By mapping 'HP' to .type 'both', all AddressType codes can be mapped to a combination of .type and .use.
>>>>>>> zib-AddressInformation
