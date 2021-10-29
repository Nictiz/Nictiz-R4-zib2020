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

## zib-Alert
* Renamed `extension:ConcernReference` to `extension:concern` to match its functional counterpart.
* Added EndDateTime and Comment concepts
* Added constraints in the profile on the choice that the zib provides between Concern and AlertName. Add guidance on which code to add to Flag.code if a reference to Concern is added.

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
* Explained cardinality mismatch of `Practitioner.name` on that element.

## zib-LivingSituation
* Added two new concepts and modelled them on `Observation.component:homeAdaption` and `Observation.component:livingCondition`.
* Concept 'HouseType' has been moved to its own valueCodeableConcept slice.
* The comment element has been moved to `Observation.note.text`.

## zib-NameInformation
* The way this partial zib has been modelled on the HumanName datatype has been overhauled to properly accommodate the way first names are handled. In the STU3 version, official first names, initials of this first name, and the given name (nickname, roepnaam) were all added to a `.given` element in the same HumanName instance, with a annotation of the type using an extension. This turned out to be the wrong approach, as all `.given` names are to be concatenated to the complete list of first names. So instead, there are now different instances of HumanName used to communicate the official names and the given name, indicated by `.use` -- resulting in two profiles. Communicating initials is now only done for names where the full name is not known (this deviates from the zib model).   
* `.use` has been made mandatory (instead of discouraged).
* Moved information and mappings from the extension level to the `value[x]` level.
* `.family.extension`'s now have the zib concept names as slice names instead of the extension names.
* The `.given.extension` slice name has been changed to indicate that it is only about full name or initial. 
* Added mappings for the newly added zib concept 'titels' on `prefix` and `suffix`. Added documentation/implementation guidance on `prefix` and the root.
* Removed copied FHIR definitions and comments as these originated from DSTU2 and are given in the base data type. Moreover, this increases the focus on our added comments. 
* Removed explanation of splitting up family names, as this is already given by the zib.
* Aliases has been aligned with the zib.
* Removed BRP mappings.
* Added the notion on the root that populating `HumanName.text` is encouraged.

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

## zib-TextResult
* New concept VisualResult mapped in additional profile zib-TextResult.VisualResult on `Media.content`. `DiagnosticReport.image.link` references this profile.
