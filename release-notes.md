# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

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
* Removed the role extension (http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson-role) because RelatedPerson.relationship has changed from 0..1 to 0..1. The zib concept role is now mapped to a slice on relationship.
* Updated to new zib-NameInformation and zib-AddressInformation and zib-ContactInformation profiles.

## zib-HealthcareProvider
* `Organization.identifier` is now sliced based on a pattern.
* `Organization.type[DepartmentSpecialty]` and `Organization.type[OrganizationType]` from 0..* to 0..1
* For `Organization.type` the slicing discriminator is changed from fixed system values to valueset binding.
* Removed comments on `Organization.alias` because it has no basis in the zib
* Added comments on the root to point out to the usage of Location resource and the `Organization.partOf`.
* Major change: use of Location resource

## zib-HealthProfessional
* `Practitioner.identifier` slices changed cardinality from 0..1 to 0..*.
* Added HealthProfessionalIdentificationNumber mapping on `PracititionerRole.identifier`.
* Added new mapping of Gender in Practitioner.
* Added textual guidance on the root to clarify the use of Practitioner and PractitionerRole.
* Added textual guidance on the root of the concept of HealthProfessionalRole.
* `PracitionRole.speciality` is not sliced anymore but has a combined ValueSet.
* Explained cardinality mismatch of Practitioner.name on that element.

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

## zib-Patient
* Includes Nationality, MaritalStatus, LanguageProficiency
* Cardinality of `Patient.extension:nationality` left at 0..* due to the nature of the nationality core extension (which allows for a period to be placed next to the nationality and thus allows for different nationalities over time)
* Cardinality of `Patient.name` left at 0..* to allow including several name elements with a different name.use each.
* Cardinality of `Patient.telecom` left at 0..* to allow including several contact elements, because the zib ContactInformation includes a container that FHIR does not dot.
* Added a comment to `deceased[x]`: When exporting the data, if `deceasedDateTim` (DateOfDeath) is present and has a value, DeathIndicator may be set to 'true', since DeathIndicator and DateOfDeath cannot both be represented at the same time.

## zib-TreatmentObjective
* Removed identifier mapping on `Goal.identifier`
* DesiredHealthcareResult element moved to `Goal.description.text`
* The patient reference has been moved to the nl-core layer
* Removed the mapping on `Goal.expressedBy` and the reference to practitionerRole
* The reference FunctionalOrMentalStatus is mapped inline on the goal resource elements (see comment on the root element for the explanation)
* Added nl-core-Problem reference in the nl-core layer and this is mapped on `Goal.addresses
* The medicalDevice extension is mapped on `.target` element

