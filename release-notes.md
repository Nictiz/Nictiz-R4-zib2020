# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## zib-AddressInformation
* Added extra comments on the history of the mapping in relation to v3.
* Removed mapping to BRP.
* Added guidance on adding a value to `Address.line` to duplicate the relevant information in case the extensions are not supported.
* Renamed `Address.line` extensions to their functional counterparts.
* Added a comment to `line.extension:houseNumberLetter-houseNumberAddition` on the possibility of a leading space not being parsed.
* Added a constraint to `line.extension:houseNumberIndication` to restrict it to the values 'by' or 'to'.
* Mapped AddressType to `extension:addressType` and added ConceptMaps to map AddressType to `.use` and `.type` to adhere to international use. However, `extension:official` was removed. AddressType code 'HP' is now mapped to `.use` 'home' and `.type` 'both'. This was done because of two reasons:
 * The notion to mark an address as 'official' seems to have its origin in the BRP, but is absent in the zib model.
 * The addition of `extension:official` seemed based on the rationale: "if implementers do not support the custom `extension:addressType`, you should be able to determine the AddressType by looking at `.use`, `.type` and custom `extension:official`". However, in this use case extension:official would probably also be not supported. By mapping 'HP' to .type 'both', all AddressType codes can be mapped to a combination of .type and .use.

## zib-AdministrationAgreement
* Placed mapping of MedicineForAdministrationAgreement on a type slice of `MedicationDispense.medicationReference` allowing the use of a CodeableConcept and thereby adhering to the open world modeling principle.
* Moved AdministrationAgreementAdditionalInformation to its own extension.
* PeriodOfUse has been remodeld using two renamed extensions based on the zib TimerInterval. This should make the mapping more clear. 
* Added an extension in the nl-core profile that mimics `MedicationDispense.category` so the category can be used as intented by the FHIR core definition.
* Aligned cardinality of `MedicationDispense.note` with the zib Comment cardinality (0..1).
* Ranamed MedicationTreatment extension to PharmaceuticalTreatment.Identifier and moved to the nl-core-profile. The extension is now also better documented.
* `MedicationDispense.status` has become mandatory in R4, therefore, guidance is added on how to populate this field.

## zib-AnatomicalLocation
* New partial zib. The anatomical location in FHIR is usually mapped on `.bodySite` (CodeableConcept with example binding). This zib has therefore been mapped onto a data type profile that can be used for `.bodySite`.

## zib-ContactInformation
* zib ContactInformation is mapped onto two profiles: one for the concept TelephoneNumbers and one for the concept E-mailAddresses. Both are added to the hosting profile.
* Removed mapping guidance on the root comment of zib-ContactInformation-E-mailAddresses, as this is now straightforward.
* Simplified mapping guidance on the root comment of zib-ContactInformation-TelephoneNumbers, as this is now straightforward.
* `ContactPoint.system` has a fixed value for zib-ContactInformation-E-mailAddresses and a restricted ValueSet for zib-ContactInformation-TelephoneNumbers to implement only the relevant zib parts.
* `ContactPoint.use` has a restricted ValueSet in both profiles to implement only the relevant zib parts.
* The extension zib-ContactInformation-TelecomType, which replaced the generic code-specification extensions from release 2.x of the zib2017 package onwards, has been deprecated again in favor of code-specication, as the mapping is now much more straightforward.
* The element TelephoneNumbers/Comment was introduced. This is represented using the ext-Comment extension in the profile for TelephoneNumbers.

## zib-ContactPerson
* Added textual guidance on the root to guide usage of RelatedPerson versus Patient.
* Removed the role extension (http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson-role) because `RelatedPerson.relationship` has changed from 0..1 to 0..*. The zib concept role is now mapped to a slice on relationship.
* Updated to new zib-NameInformation, zib-AddressInformation and zib-ContactInformation profiles.

## zib-DispenseRequest
* Moved the fixed zib definitioncode on slice of `MedicationDispense.category`, allowing reuse of `category`.
* Placed mapping of DispensedMedicine on a type slice of `MedicationDispense.medication[x]` allowing the use of a CodeableConcept and thereby adhering to the open world modeling principle.
* Moved AdditionalWishes to its own extension.
* Added iso21090-PQ-translation extension to `MedicationDispense.dispenseRequest.quantity` to allow adding quantity translations using other code systems (e.g. G-Standard and NHG).
* Added mapping of new CanceledIndicator concept to `MedicationDispense.status`
* Ranamed MedicationTreatment extension to PharmaceuticalTreatment.Identifier and moved to the nl-core-profile. The extension is now also better documented.
* Aligned cardinality of `MedicationRequest.note` with the zib Comment cardinality (0..1).
* Removed reference on `MedicationRequest.recorder` because this is not accounted for by the zib or a use case.
* PeriodOfUse has been remodeld using new extensions based on the zib TimerInterval. This should make the mapping more clear.
* Moved mapping of PeriodOfUse Duration from `MedicationRequest.dispenseRequest.expectedSupplyDuration` to `MedicationRequest.dispenseRequest.extension:periodOfUse-Duration` because of semantic diferences in concept definitions.
* Replaced fixed _order_ code on `MedicationRequest.intent` with guidance and documentation on which code to use to adhere to open world modeling principle. 

## zib-HealthcareProvider
* `Organization.identifier` is now sliced based on a pattern.
* `Organization.type[DepartmentSpecialty]` and `Organization.type[OrganizationType]` from 0..* to 0..1.
* For `Organization.type` the slicing discriminator is changed from fixed system values to valueset binding.
* Removed comments on `Organization.alias` because it has no basis in the zib.
* Added comments on the root to point out to the usage of Location resource and the `Organization.partOf`.
* Major change: use of Location resource.

## zib-HealthProfessional
* `Practitioner.identifier` slices changed cardinality from 0..1 to 0..*.
* Added HealthProfessionalIdentificationNumber mapping on `PracititionerRole.identifier`.
* Added new mapping of Gender in Practitioner.
* Added textual guidance on the root to clarify the use of Practitioner and PractitionerRole.
* Added textual guidance on the root of the concept of HealthProfessionalRole.
* `PractitionerRole.specialty` is not sliced anymore but has a combined ValueSet.
* Explained cardinality mismatch of Practitioner.name on that element.

## zib-InstructionsForUse
* Removed required GstdTabel902 bindings on Quantity datatypes for Dose and MaximumDose. Added pattern-GstdQuantity profile in nl-core profile that contains a PQ-translation extension that can hold the GstdTabel902 binding.
* Moved mapping of Description from `Dosage.text` to an extension that is placed in the host resource. This was already fixed with MP9.1, however, it was forgotten in the zib2017 stable2.x branch.
* Moved DoseDuration to a slice of `Timing.repeat.bounds[x]`of type Duration.
* Moved Condition to a slice of `asNeeded[x]`, of type CodeableConcept, which is made polymorphic in R4.
* The zib Range has been mapped inline for AdministeringSpeed and Dose in `.doseAndRate.rate[x]` and `doseAndRate.dose[x]`. Also, in R4, these elements have been moved under the `.doseAndRate` element.
* Added ext-RenderedDosageInstruction extension, that mimics the R5 `.renderdDosageInstruction` element in the medication resources, that captures the full instruction for use description.
* Renamed profile name to zib-InstructionsForUse.DosageInstructions to indicate that the profile conceptually better represents the DosageInstructions container than the whole zib.
* Removed AdministeringSchedule profile on Timing and placed the constraints inline in the zib-InstructionsForUse.DosageInstructions profile because the AdministeringSchedule profile was not reused in other places.

## zib-MedicationAdministration2
* Added an extension in the nl-core profile that mimics `MedicationAdministration.category` so the category can be used as intented by the FHIR core definition.
* Ranamed MedicationTreatment extension to PharmaceuticalTreatment.Identifier and moved to the nl-core-profile. The extension is now also better documented.
* Aligned cardinality of `MedicationAdministration.note` with the zib Comment cardinality (0..1).
* Moved mapping of AdministrationProduct on a Reference type slice of `MedicationAdministration.medication[x]` element adhering to the open world modeling principle.
* Moved the mapping of AdministrationDateTime to a type slice on `MedicationStatement.effective[x]` so the `MedicationStatement.effectivePeriod` can be used too.
* Extended `MedicationAdministration.rate[x]` with a Range datatype to allow the population of minimumValue and maximumValue of the AdministreringSpeed. 

## zib-MedicationAgreement
* Removed references not accounted for by the zib.
* Moved fixed MedicationAgreementCode on a `MedicationRequest.category`, allowing reuse of `category`.
* Moved mapping of AgreedMedicine on a Reference type slice of `MedicationRequest.medication[x]` element adhering to the open world modeling principle.
* The AdditionalInformation to its own extension.
* Ranamed MedicationTreatment extension to PharmaceuticalTreatment.Identifier and moved to the nl-core-profile. The extension is now also better documented.
* Added MP CopyIndicator extension to nl-core profile.
* Mapped MP concept RelatieMedicatieafspraak  to `periorPrescription` instead of an extension in the nl-core profile. 
* Instead of one extension, the concepts MP RelatieToedieningsafspraak and RelatieMedicatiegebruik are placed in specific extensions in the nl-core profile.
* Aligned cardinality of `MedicationRequest.note` with the zib Comment cardinality (0..1).
* Replaced fixed _order_ code on `MedicationRequest.intent` with guidance and documentation on which code to use to adhere to open world modeling principle. 

## zib-MedicationDispense
* Added an extension in the nl-core profile that mimics `MedicationDispense.category` so the category can be used as intented by the FHIR core definition.
* Placed the mapping DispensedMedicine Reference type slice on `MedicationDispense.medication[x]` allowing the use of a CodeableConcept.
* Removed references in `MedicationDispense.context`, `MedicationDispense.partOf` and `MedicationDispense.receiver` not accounted for by zibs.
* Moved AdditionalInformation to its own extension to align more with the profiling guidelines.
* Relaxed cardinality of additionalInformation extension to 0..* to align with the zib.
* Added iso21090-PQ-translation extension to MedicationDispense.dispenseRequest.quantity to allow adding quantity translations using with code systems (e.g. G-Standard and NHG).
* Ranamed MedicationTreatment extension to PharmaceuticalTreatment.Identifier and moved to the nl-core-profile. The extension is now also better documented.
* Aligned cardinality of `MedicationDispense.note` with the zib Comment cardinality (0..1).
* `MedicationDispense.status` has become mandatory in R4, therefore, guidance is added on how to populate this field.

## zib-MedicationUse2
* Changed fixed category code from 6#urn:oid:2.16.840.1.113883.2.4.3.11.60.20.77.5.3 to 422979000#http://snomed.info/sct.
* Aligned cardinality of `MedicationStatement.note` with the zib Comment cardinality (0..1).
* Moved the mapping of ProductUsed on type slice on `MedicationStatement.medication[x]` allowing the use of a CodeableConcept.
* Moved the mapping of ReasonForUse to a slice on `MedicationStatement.reasoncode` so the element can be reused for other purposes too.
* Moved the mapping of PeriodOfUse to a type slice on `MedicationStatement.effective[x]` so the `MedicationStatement.effectiveDateTime` can be used too.
* PeriodOfUse has been remodeld using new extensions and a profile on Period based on the zib TimerInterval. This should make the mapping more clear.
* Moved mapping of UseIndicator from an extension to `MedicationStatement.status`.
* Moved mapping of MedicationUseStopType from `MedicationStatement.status` to modifier extension StopType because this was actually incorrectly mapped in STU3 and this aligns with AdministrationAgreement and MedicationAgreement. 

## zib-NameInformation
Style - profiling guidelines
* Moved information and mappings from the extension level to the `value[x]` level. Note that the zib compliance test is complaining now about cardinality differences.
* `HumanName.family.extensions` now have the zib concept names as slice names instead of the extension names.
* Usage of correct zib alias values.
* Removed copied FHIR definitions and comments as this originated from DSTU2 and is given in the base data type. Moreover, this increases the focus on our added comments. 
* Removed BRP mappings.
-----
* Sliced HumanName.given for every zib concept that is mapped to this element. Slices are differentiated by a mandatory qualifier extension that contains a pattern. This makes the profile more explicit.
* Added mappings for the newly added zib concept 'titels' on `prefix` and `suffix`. Added documentation/implementation guidance on `prefix` and the root.
* Added a notion that `HumanName.use` is discouraged on the root and in the `use` element.
* Added a notion on the root that explains that if `HumanName.use` is used, the full name will likely break up in multiple instances of the HumanName. Systems should expect this.
* Added invariant to test for when `HumanName.use` is official that the name is truly official.
* Removed `use` in the inline examples.
* Added a notion on the root that `HumanName.text` is encouraged to be given too.
* Added a notion on the root that we have not profiled the zib constraint to mandate a LastName.

## zib-NursingIntervention
* The resource to represent this zib has been changed from Procedure to CarePlan. This aligns better with the meaning of the zib: a statement of a plan (which may or not may have been completed) rather than the record of a procedure that has been carried out. The profile for the current version is created from scratch.
* Because there's a better match with CarePlan, the five custom extensions are removed. One custom extension is added to mark a `CarePlan.contributor` as the zib Requester, and another one to define the materials used.
* Note: although the zib has changed quite dramatically since release 2017, the previous version of the profile was based on a pre-adopt of zib pre-release 2018, which is the same as release 2020.

## zib-Patient
* Includes Nationality, MaritalStatus, LanguageProficiency.
* Cardinality of `Patient.extension:nationality` left at 0..* due to the nature of the nationality core extension (which allows for a period to be placed next to the nationality and thus allows for different nationalities over time).
* Cardinality of `Patient.name` left at 0..* to allow including several name elements with a different `name.use` each.
* Cardinality of `Patient.telecom` left at 0..* to allow including several contact elements, because the zib ContactInformation includes a container that FHIR does not.
* Added a comment to `deceased[x]`: When exporting the data, if `deceasedDateTime` (DateOfDeath) is present and has a value, DeathIndicator may be set to 'true', since DeathIndicator and DateOfDeath cannot both be represented at the same time.

## zib-Range
* There is no profile for this partial zib because the relevant parts can be modelled directly in the profiles where this zib is used.

## zib-TimeInterval
* In the previous release, the concepts of this partial zib were mapped directly in the profiles where they are used. In this release the usage of this partial zib has been expanded and profiles have been created to aid the usage in profiles in the various situations that might occur. 
