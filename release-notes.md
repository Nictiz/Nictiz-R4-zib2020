# Nictiz-R4-Zib2020 Release Notes

This document contains release notes per zib, indicating differences with their [STU3 versions](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/), deviations from the [profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4) and other points of interest.

## zib-AbilityToDressOneself
* The ValueSet binding strength has changed from 'extensible' to 'required' on `Observation.component:bodyPartToBeDressed.value[x]`.

## zib-AbilityToWashOneself
* The ValueSet binding strength has changed from 'extensible' to 'required' on `Observation.component:bodyPartToBeBathed.value[x]`.

## zib-AbilityToDrink
* No specific changes have been made to this profile other than the generic changes for the Observation resource

## zib-AbilityToEat
* No specific changes have been made to this profile other than the generic changes for the Observation resource.

## zib-AbilityToGroom
* No specific changes have been made to this profile other than the generic changes for the Observation resource.

## zib-AbilityToPerformMouthcareActivities
* The reference between the Observation and the DeviceUseStatement profile has been moved from the `.reasonReference` extension in the DeviceUseStatement to the `workflow-supportingInfo` extension in the Observation profile.

## zib-AbilityToUseToilet
* No specific changes have been made to this profile other than the generic changes for the Observation resource.

## zib-AddressInformation
* Added extra comments on the history of the mapping in relation to v3.
* Removed mapping to BRP.
* Added guidance on adding a value to `Address.line` to duplicate the relevant information in case the extensions are not supported.
* Renamed `Address.line` extensions to their functional counterparts.
* Added a comment to `.line.extension:houseNumberLetter-houseNumberAddition` on the possibility of a leading space not being parsed.
* Added a constraint to `.line.extension:houseNumberIndication` to restrict it to the values 'by' or 'to'.
* Mapped AddressType to `extension:addressType` and added ConceptMaps to map AddressType to `.use` and `.type` to adhere to international use. However, `extension:official` was removed. AddressType code 'HP' is now mapped to `.use` 'home' and `.type` 'both'. This was done because of two reasons:
 * The notion to mark an address as 'official' seems to have its origin in the BRP, but is absent in the zib model.
 * The addition of `extension:official` seemed based on the rationale: "if implementers do not support the custom `extension:addressType`, you should be able to determine the AddressType by looking at `.use`, `.type` and custom `extension:official`". However, in this use case `extension:official` would probably also not be supported. By mapping 'HP' to `.type` 'both', all AddressType codes can be mapped to a combination of `.type` and `.use`.
 
## zib-AlcoholUse
* The code on `Observation.component:amount.code` has changed to 897148007.

## zib-Alert
* Renamed `extension:ConcernReference` to `extension:concern` to match its functional counterpart.
* Added EndDateTime and Comment concepts.
* Added constraints in the profile on the choice that the zib provides between Concern and AlertName. Added guidance on which code to add to `Flag.code` if a reference to Concern is added.

## zib-AdvanceDirective
* Moved TypeOfLivingWill from `Consent.category` to `Consent.provision.code`, renamed it to LivingWillType in accordance with the zib and made the element `0..1` rather than `1..1` to adhere to the conceptual cardinalities of the zib.
* Moved LivingWillDocument from `Consent.source[x]` to `Consent.source[x]:sourceAttachment.data`.
* Moved Representative from `Consent.consentingParty` to `Consent.provision.actor:representative.reference` because the element is removed in R4. Also `Consent.provision.actor:representative.role` has now a fixed value for this mapping.
* Replaced fixed zib code 11341000146107#http://snomed.info/sct on `Consent.category` with acd#http://terminology.hl7.org/CodeSystem/consentcategorycodes because this is an applicable code bound in the extensible ValueSet.
* Removed references that are not defined by the zib (e.g. `Consent.organization` and `Consent.actor`).
* Adjusted the `Consent.dateTime` cardinality from `1..1` to `0..1` to adhere to the conceptual cardinalities of the zib.
* Added guidance for mandatory elements `Consent.status`,`Consent.scope` and `Consent.policy` or `Consent.policyRule`.

# zib-AllergyIntolerance
* Applied 'combined ValueSets' to `.code` and `.reaction.substance` instead of slicing per ValueSet.
* The code-specification extensions have been removed from `.clinicalStatus` and `.reaction.severity` because the zib concepts can be fully mapped to FHIR.
* Because AlleryStatus maps to both `.clinicalStatus` and `.verificationStatus`, but `.verificationStatus` now has cardinality `0..1` compared to `1..1` in STU3, guidance on how to interpret the mapping has been added to the root, but has been simplified.
* Changed cardinality of `.note` from `0..*` to `0..1` to align with the zib.

## zib-AnatomicalLocation
* New partial zib. The anatomical location in FHIR is usually mapped on `.bodySite` (CodeableConcept with example binding). This zib has therefore been mapped onto a data type profile that can be used for `.bodySite`.

## zib-ApgarScore
* ApgarScore is now divided into 3 profiles with their own time unit. Each profile also has its own terminology codes that correspond to the minutes.

## zib-BarthelADLIndex
* There was no profile in the STU3 version and therefore no diff.

## zib-BowelFunction
* The mapping of the Stoma concept has been moved from extension to profile level.
* MedicalDevice extension has been removed because the reference is reversed in FHIR. The MedicalDevice profile refers to this profile.

## zib-Burnwound
* BurnType is mapped to `Condition.code`.
* The concept of 'DateOfLastDressingChange' has been relocated to the Wound Characteristics profile. 
* The concept of 'Extent' has been relocated to the Wound Characteristics profile. 

## zib-CareTeam
* CareTeam is a newly added zib in the 2020 release. It has no previous profile and therefore no diff.

## zib-ChecklistPainBehavior
* The data type of `Observation.value[x]` (zib concept TotalScore) has been changed from Quantity to Integer, and minimum and maximum allowed values of 0 and 10 respectively are applied.
* The system value on the `Observation.component.code` slices has changed from 'urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0' to 'urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1'.
* The data type of the `Observation.component.value[x]` slices has changed from Quantity to Integer. 
* The code on `Observation.component:face.code` has changed from '12.17.3' to '12017003'.
* The code on `Observation.component:mouth.code` has changed from '12.17.4' to '12017004'.
* The code on `Observation.component:grimace.code` has changed from '12.17.5' to '12017005'.
* The code on `Observation.component:lookingSad.code` has changed from '12.17.6' to '12017006'.
* The code on `Observation.component:eyes.code` has changed from '12.17.7' to '12017007'.
* The code on `Observation.component:panic.code` has changed from '12.17.8' to '12017008'.
* The code on `Observation.component:moaning.code` has changed from '12.17.9' to '12017009'.
* The code on `Observation.component:cry.code` has changed from '12.17.10' to '12017010'.
* The code on `Observation.component:soundsOfRestlessness.code` has changed from '12.17.11' to '12017011'.
* The code on `Observation.component:tears.code` has changed from '12.17.12' to '12017012'.

## zib-ContactInformation
* The zib ContactInformation is mapped onto two profiles: one for the concept TelephoneNumbers and one for the concept EmailAddresses. Both are added to the hosting profile.
* Removed mapping guidance on the root comment of zib-ContactInformation-EmailAddresses, as this is now straightforward.
* Simplified mapping guidance on the root comment of zib-ContactInformation-TelephoneNumbers, as this is now straightforward.
* `ContactPoint.system` has a fixed value for zib-ContactInformation-EmailAddresses and a restricted ValueSet for zib-ContactInformation-TelephoneNumbers to implement only the relevant zib parts.
* `ContactPoint.use` has a restricted ValueSet in both profiles to implement only the relevant zib parts.
* The extension zib-ContactInformation-TelecomType, which replaced the generic code-specification extensions from release 2.x of the zib2017 package onwards, has been deprecated again in favor of code-specication, as the mapping is now much more straightforward.
* The element TelephoneNumbers/Comment was introduced. This is represented using the ext-Comment extension in the profile for TelephoneNumbers.

## zib-ComfortScale
* The data type of `Observation.value[x]` (zib concept TotalScore) has been changed from Quantity to Integer, and minimum and maximum allowed values of 0 and 35 respectively are applied.
* The code on `Observation.component:alertness.code` has changed from 12.12.3 to 12012003.
* The code on `Observation.component:calmnessAgitation.code` has changed from 12.12.4 to 12012004.
* The code on `Observation.component:respiratoryResponse.code` has changed from 12.12.5 to 12012005.
* The code on `Observation.component:crying.code` has changed from 12.12.6 to 12012006.
* The code on `Observation.component:bodyMovement.code` has changed from 12.12.8 to 12012008.
* The code on `Observation.component:facialTone.code` has changed from 12.12.9 to 12012009.
* The code on `Observation.component:bodyMuscleTone.code` has changed from 12.12.10 to 120120010.

## zib-ContactPerson
* Added textual guidance on the root to guide usage of RelatedPerson versus Patient.
* Removed the role extension (http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson-role) because `RelatedPerson.relationship` has changed from `0..1` to `0..*`. The zib concept role is now mapped to a slice on relationship.
* Updated to new zib-NameInformation, zib-AddressInformation and zib-ContactInformation profiles.

## zib-DevelopmentChild
* The binding strength of all ValueSets has changed from 'extensible' to 'required'.
* The data type for AgeFirstMenstruation has been changed from dateTime to Quantity, and the UCUM unit for 'year' (a) has been added.
* The code on `Observation.component:developmentCognition.code` has been changed from 364644000 to 311465003.

## zib-DrugUse
* The drugUseCode is mapped to `Observation.code` and is based on a pattern.
* The code on `Observation.component:drugOrMedicationType.code` has changed to 105590001.
* The code on `Observation.component:amount.code` has changed to 363908000.

## zib-DOSScore
* DOSScore is a newly added zib in the 2020 release. It has no previous profile and therefore no diff.

## zib-Encounter
* ContactWith is mapped on a slice of `Encounter.participant`.
* `Encounter.participant.type` now honors the maximum cardinality of HealthProfessionalRole.
* `Encounter.period.start` changed to cardinality `0..1` due to the zibs conceptual cardinalities concept.
* The mapping of concepts Problem, Procedure and DeviatingResult is moved to `Encounter.reasonReference`.
* The mapping of Location is moved to `Encounter.location.location`.
* References to other profiles not accounted for by the zib have been removed.

## zib-Education
* There is no previous profile for Education in STU3 and therefore no diff.

## zib-EpisodeOfCare
* New zib in 2020. However, in the zib2017 package the nl-core-episodeofcare profile exists, which is not based on a zib but included some use case concepts. This zib profile supersedes this profile.
* The extension EpisodOfCare-Title has been replaced by ext-EpisodeOfCare.EpisodeOfCareName because this zib concept is functionally equivalent.
* The extensions EpisodeOfCare-DateFirstEncounter and EpisodeOfCare-DateLastEncounter from the previous profile are not inherited because no functional backing exists.

## zib-FeedingPatternInfant
* No specific changes have been made to this profile other than the generic changes for the Observation resource.

## zib-FLACCpainScale
* The semantic codes on the `Observation.component.code` elements have changed from LOINC to codes from the ScoreObservaties code system (urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1).
* The system value on `Observation.code` has changed from http://loinc.org to http://snomed.info/sct and the code value has changed from 38213-5 to 108291000146105.

## zib-FluidBalance
* Changed `Observation.code` from 364396009 to 710853006#http://snomed.info/sct.

## zib-FreedomRistrictingIntervention
* This is a new zib loosely based on the previous zib FreedomRestrictingMeasures. Below the most relevant changes compared to the previous zib and the STU3 profile are described.
* Added guidance for mandatory element `Procedure.status`.
* The `Procedure.category` code has been changed to the definition code of the TypeOfIntervention concept.
* Added mapping on `Procedure.performedDateTime`.
* The zib-patient-legalstatus extension has been removed and is (more or less) replaced by references added on `Procedure.reasonReference` (in line with the 'replacement' of the LegalStatus concept by the LegalSituation concept).

## zib-FunctionalOrMentalStatus
* MedicalDevice extension has been removed because the reference is reversed in FHIR. The MedicalDevice profile refers to this profile.
* Moved the fixed functional status finding and mental status finding to slices on `Observation.category` instead of `.category.coding`, discriminated by a pattern, and strengthened by an invariant to check if one of the fixed terminology codes is present.
* The comment element is mapped on `Observation.note.text` instead of `Observation.comment`.

## zib-GlasgowComaScale
* There was no profile in the zib2017/STU3 implementation and therefore no diff.

## zib-HealthcareProvider
* `Organization.identifier` is now sliced based on a pattern.
* Changed cardinality of `Organization.type[DepartmentSpecialty]` and `Organization.type[OrganizationType]` from `0..*` to `0..1`.
* For `Organization.type` the slicing discriminator is changed from fixed system values to a ValueSet binding.
* Removed comments on `Organization.alias` because it has no basis in the zib.
* Added comments on the root to point out the usage of the Location resource and the `Organization.partOf`.
* Major change: use of Location resource.

## zib-HealthProfessional
* `Practitioner.identifier` slices changed cardinality from `0..1` to `0..*`.
* Added HealthProfessionalIdentificationNumber mapping on `PractitionerRole.identifier`.
* Added new mapping of Gender in Practitioner.
* Added textual guidance on the root to clarify the use of Practitioner and PractitionerRole.
* Added textual guidance on the root of the concept of HealthProfessionalRole.
* `PractitionerRole.specialty` is not sliced anymore but has a combined ValueSet.
* Explained cardinality mismatch of `Practitioner.name` on that element.

## zib-HearingFunction
* Changed fixed slice on `.code.coding` to a pattern on `.code`.
* Relaxed cardinality of `.value[x]` to `0..1` of the conceptual cardinalities of the zib.

## zib-HelpFromOthers
* The mappings on `CarePlan.identifier`, `CarePlan.subject`, `CarePlan.author` and `CarePlan.careTeam` have been removed.
* The mapping on `CarePlan.activity.detail.category` has been moved to `CarePlan.activity.detail.code`.
* The mapping on `CarePlan.activity.detail.code` has been moved to `CarePlan.activity.detail.description`.
* The mapping on `CarePlan.activity.detail.description` has been moved to `CarePlan.note.text`.

## zib-LaboratoryTestResult
* In the 2017 implementation, five different profiles were used. This has been reduced to two profiles in the current implementation:
  * The profile HCIM LaboratoryTestResult DiagnosticReport was designed to capture conclusions from zib LaboratoryTestResult, but this has never been used and is not explicitly defined by the zib.
  * The profile HCIM LaboratoryTestResult Specimen Isolate was used to represent the Specimen container which instantiates a microorganism from a specimen (that is, the Microorganism concept is used). However, it has been found that a single Specimen profile is sufficient to represent both the specimen itself and any isolate from it. To represent both a specimen and the material from which it came, two instances of this profile are needed.
  * The profile HCIM LaboratoryTestResult Substance was used to represent the Microorganism concept as well.
* The concept Performer was added, mapped onto `Observation.performer`.

## zib-LegalSituation
* New zib in 2020. However, in the zib2017 package the zib-patient-legalstatus extension exists, which corresponds to the LegalStatus concept of the zib FreedomRestrictingMeasures (withdrawn in the 2020 release). This new zib profile expands on that LegalStatus concept.

## zib-LifeStance
* This zib was previously represented as an extension in the Patient profile, but this has been changed to a profile on Observation in order to prevent custom extensions.
  
## zib-LivingSituation
* Added two new concepts and modelled them on `Observation.component:homeAdaption` and `Observation.component:livingCondition`.
* Concept 'HouseType' has been moved to its own `.valueCodeableConcept` slice.
* The comment element has been moved to `Observation.note.text`.

## zib-MedicalDevice
* Indication no longer requires a custom extension because the concept can be mapped to a native FHIR element, namely `.reasonReference`. 
* Provided more documentation on how to exchange ProductID in FHIR.
* Removed references on `.source` because those are not accounted for by the zib.
* Provided documentation on how to populate mandatory `.status` element.

## zib-MedicationContraIndication
* MedicationContraIndication is a newly added zib in the 2020 release. It has no corresponding profile in the previous version.

## zib-Mobility
* The comment element is mapped on `Observation.note.text` instead of `Observation.comment`.

## zib-MUSTScore
* The data type of `Observation.value[x]` (zib concept TotalScore) has been changed from Quantity to Integer, and minimum and maximum allowed values of 0 and 6 respectively are applied.
* The code on `Observation.component:bmiScore.code` has changed to 4005003 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.
* The code on `Observation.component:weightLossScore.code` has changed to 4005004 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.
* The code on `Observation.component:illnessScore.code` has changed to 4005005 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.

## zib-IllnessPerception
* The concept PatientIllnessInsight with ID NL-CM:18.5.3 has been moved to `Observation.value[x]:valueString`

## zib-NameInformation
* A split has been made between the zib and the nl-core profile. Whereas the zib doesn't recognize an unstructured last name and an unstructured full name, the nl-core profile explicitly does. It also adds the requirement to provide these unstructured names if parts of the structured names are present to align with international usage of the HumanName data type.
* The profile has been renamed from 'nl-core-humanname' to 'zib-NameInformation' and 'nl-core-NameInformation'.
* The way this partial zib has been modelled on the HumanName data type has been overhauled to properly accommodate the way first names are handled. In the STU3 version, official first names, initials of this first name, and the given name (nickname, roepnaam) were all added to a `.given` element in the same HumanName instance, with an annotation of the type using an extension. This turned out to be the wrong approach, as all `.given` names are to be concatenated to the complete list of first names. So instead, there are now different instances of HumanName used to communicate the official names and the given name, indicated by `.use` -- resulting in two profiles. Communicating initials is now only done for names where the full name is not known (this deviates from the zib model).   
* `.use` has been made mandatory (instead of discouraged).
* Moved information and mappings from the extension level to the `.value[x]` level.
* `.family.extension`'s now have the zib concept names as slice names instead of the extension names.
* The `.given.extension` slice name has been changed to indicate that it is only about full name or initial. 
* Added mappings for the newly added zib concept 'titels' on `.prefix` and `.suffix`. Added documentation/implementation guidance on `.prefix` and the root.
* Removed copied FHIR definitions and comments as these originated from DSTU2 and are given in the base data type. Moreover, this increases the focus on our added comments. 
* Removed explanation of splitting up family names, as this is already given by the zib.
* Aliases have been aligned with the zib.
* Removed BRP mappings.

## zib-NursingIntervention
* The resource to represent this zib has been changed from Procedure to CarePlan. This aligns better with the meaning of the zib: a statement of a plan (which may or may not have been completed) rather than the record of a procedure that has been carried out. The profile for the current version is created from scratch.
* Because there's a better match with CarePlan, the five custom extensions are removed. One custom extension is added to mark a `CarePlan.contributor` as the zib Requester, and another one to define the materials used.
* Note: although the zib has changed quite dramatically since release 2017, the previous version of the profile was based on a pre-adopt of zib pre-release 2018, which is the same as release 2020.

## zib-NutritionAdvice
* References not accounted for by the zib have been removed on `NutritionOrder.allergyIntolerance`, `NutritionOrder.encounter` and `NutritionOrder.orderer`.
* The incorrect mapping of Consistency to `NutritionOrder.oralDiet.texture.foodType.text` has been removed. This concept is not used to provide information on the consistency of nutrition.
* New concept Indication mapped on the extension `NutritionOrder.extension:indication`.
* The comment extension has been replaced by a mapping to `NutritionOrder.note.text`.

## zib-PainScore
* Removed mapping on `Observation.bodySite` because the AnatomicalLocation concept has been removed from the zib.
* Removed laterality extension because the Laterality concept has been removed from the zib.
* Cardinality of `Observation.method` has changed from `1..1` to `0..1`. 
* The data type of `Observation.value[x]` (zib concept PainScoreValue) has been changed from Quantity to Integer.

## zib-ParticipationInSociety
* No specific changes have been made to this profile other than the generic changes for the Observation resource

## zib-Patient
* Includes Nationality, MaritalStatus, LanguageProficiency.
* Cardinality of `Patient.extension:nationality` left at `0..*` due to the nature of the nationality core extension (which allows for a period to be placed next to the nationality and thus allows for different nationalities over time).
* Cardinality of `Patient.name` left at `0..*` to allow including several name elements with a different `name.use` each.
* Cardinality of `Patient.telecom` left at `0..*` to allow including several contact elements, because the zib ContactInformation includes a container that FHIR does not.
* Added a comment to `deceased[x]`: When exporting the data, if `.deceasedDateTime` (DateOfDeath) is present and has a value, DeathIndicator may be set to 'true', since DeathIndicator and DateOfDeath cannot both be represented at the same time.

## zib-Payer
* The STU3 version of the profile mapped part of the InsuranceCompany concept in the nl-core-organization profile, while these types of organizations do not necessarily have anything in common with HealthcareProviders, and it also did not allow for the situation where PayerPerson is an organization. To fix this, two separate profiles have been created for the situations where the Payer is a PayerPerson or an InsuranceCompany. These profiles could not be combined because slicing on .type with a maximum cardinality of 1 is not allowed.
* Both InsuranceCompany and 'PayerPerson as Organization' have been mapped in the profile Payer-Organization.

## zib-Pregnancy
* The mapping of zib Pregnancy is now mapped onto an Observation resource rather than a Condition resource, aligning with the meaning of the zib.

## zib-Pregnancy.DateLastMenstruation
* The zib-Pregnancy extension has moved from `Observation.extension` to `Observation.focus`.

## zib-Pregnancy.EstimatedDateOfDelivery
* The profile name has changed from zib-Pregnancy-TermDate to zib-Pregnancy.EstimatedDateOfDelivery.
* The value of `Condition.code` has changed from 11778-8 (LOINC) to 161714006 (SNOMED CT).
* The system of `Condition.code` has changed from http://loinc.org to http://snomed.info/sct.
* The zib-Pregnancy extension has moved from `Observation.extension` to `Observation.focus`.

## zib-Pregnancy.Gravidity
* The value of `Condition.code` has changed from 11996-6 (LOINC) to 161732006 (SNOMED CT).
* The system of `Condition.code` has changed from http://loinc.org to http://snomed.info/sct.
* The data type on `Observation.value` has changed from Quantity to integer.
* The zib-Pregnancy extension has moved from `Observation.extension` to `Observation.focus`.

## zib-Pregnancy.Parity
* The value of `Condition.code` has changed from 11977-6 (LOINC) to 364325004 (SNOMED CT).
* The system of `Condition.code` has changed from http://loinc.org to http://snomed.info/sct.
* The data type on `Observation.value` has changed from Quantity to integer.
* The zib-Pregnancy extension has moved from `Observation.extension` to `Observation.focus`.

## zib-Pregnancy.PregnancyDuration
* The zib-Pregnancy extension has moved from `Observation.extension` to `Observation.focus`.

## zib-PressureUlcer
* The concept of 'DateOfLastDressingChange' has been relocated to the Wound Characteristics profile.

## zib-Problem
* ProblemType has been added on a slice of `Condition.category` allowing the category element to be used for other purposes too.
* FurtherSpecificationProblemName has been added with an extension on `Condition.code`.
* `Condition.bodySite` is now based on the zib AnatomicalLocation profile.
* ProblemStartDate and ProblemEndDate are placed on a DateTime type slice of `Condition.onset[x]` and `Condition.abatement[x]` allowing the option to use other types.
* `Condition.note` now honors the max cardinality of zib Comment.
* `Condition.verificationStatus` contains a mandatory `.coding` element to capture the zib terminology because of the required binding on the CodeableConcept level and the zib and FHIR ValueSet do not completely map.

## Procedure
* Renamed profiles from zib-Procedure and zib-ProcedureRequest to zib-Procedure-event and zib-Procedure-request conform profiling guidelines.
* ProcedureStartDate and ProcedureEndDate have been mapped to `Procedure.performed[x]` instead of `Procedure.performedPeriod` to account for the use of `Procedure.performedDateTime` when the zib Procedure concerns an instantaneous procedure.
* Changed cardinality of the ProcedureMethod concept to `0..*` instead of `0..1`.
* The ProcedureAnatomicalLocation is mapped on `Procedure.bodySite` and the cardinality has been set to `0..1` instead of `0..*`.
* The resource ProcedureRequest has been renamed to ServiceRequest and now includes a mapping for all the possible concepts of zib Procedure. Compared to STU3 a mapping has been added for ProcedureMethod, ProcedureAnatomicalLocation, MedicalDevice, ProcedureStartDate and ProcedureEndDate.
* `Procedure.location` and `ServiceRequest.locationReference` are used to reference the zib HealthcareProvider instead of `Procedure.performer` and `ProcedureRequest.performer` to indicate where the Procedure takes place.
* The `Procedure.performer` only references the zib HealthProfessional represented in a PractitionerRole resource. Other references not dictated by the zib are removed.
* `ServiceRequest.performer` contains a reference to the zib CareTeam because the FHIR definition deviates from the zib Performer concept when multiple references are provided. This is described in the element's comment.

## zib-PulseRate
* The binding strength of the PulseRegularityCodelist has been changed from 'extensible' to 'required'.

## zib-Range
* There is no profile for this partial zib because the relevant parts can be modelled directly in the profiles where this zib is used.

## zib-Refraction
* Refraction is a newly added zib in the 2020 release. It has no previous profile and therefore no diff.

## zib-SNAQScore
* The datatype of `Observation.value[x]` (zib concept TotalScore) element has been changed from Quantity to Integer, and minimum and maximum allowed values of 0 and 5 respectively are applied.
* The code on `Observation.component:weightLossScore.code` has changed to 4006003 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.
* The code on `Observation.component:appetiteScore.code` has changed to 4006004 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.
* The code on `Observation.component:nutritionScore.code` has changed to 4006005 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.

## zib-SNAQrcScore
* The datatype of `Observation.value[x]` (zib concept TotalScore) element has been changed from Quantity to Integer, and minimum and maximum allowed values of 0 and 5 respectively are applied.
* The code on `Observation.component:weightLossScore.code` has changed to 4029003 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.
* The code on `Observation.component:appetiteScore.code` has changed to 4029004 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.
* The code on `Observation.component:bmiScore.code` has changed to 4029005 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.
* The code on `Observation.component:assistedEating.code` has changed to 4029008 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.

## zib-SNAQ65plusScore
* The datatype of `Observation.value[x]` (zib concept TotalScore) element has been changed from Quantity to Integer, and minimum and maximum allowed values of 0 and 5 respectively are applied.
* The code on `Observation.component:weightLossScore.code` has changed to 4030003 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.
* The code on `Observation.component:upperArmCircumference.code` has changed to 4030008 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.
* The code on `Observation.component:appetiteScore.code` has changed to 4030004 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.
* The code on `Observation.component:excerciseScore.code` has changed to 4030005 and the system value to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.

## zib-SOAPReport
* This is a newly added zib but had profiles that preceded the zib, namely gp-EncounterReport and gp-JournalEntry.
* Removed constraints not accounted for by the zib.
* Placed SOAPLine on a slice of `Composition.section` with a max cardinality of 4 conform the zib.
* Removed min cardinality of `Composition.section.text`.
* Removed min cardinality of `Observation.valueString` and moved mapping to a string type slice.
* Removed fixed value of `Observation.status`.
* In the SOAPLineCode extension the fixed value on `.valueCodeableConcept.coding.system` has been removed because it is now covered by a required binding.
* Moved mapping of SOAPLineCode from `Observation.component`s to a custom extension because of lacking terminology codes to provide definiton ot the component.

## zib-SkinDisorder
* Renamed `extension:dueTo` to `extension:cause` to match its functional counterpart.
* Changed fixed slice on `.category.coding` to a pattern on `.category`.
* `Condition.bodySite` is now based on the zib AnatomicalLocation profile.
* `Condition.note` now honours the max cardinality of zib Comment.

## zib-Stoma
* The resource to represent this zib has been changed from Observation to Condition. This aligns better with the meaning of the zib, as a stoma requires long term management. 
* The general code of a Stoma has been added as a pattern to `Condition.category` allowing the category element to be used for other purposes too.
* `Condition.bodySite` is now based on the zib AnatomicalLocation profile.
* `Condition.note` now honours the max cardinality of zib Comment.

## zib-StrongKidsScore
* The data type of Observation.value[x] (zib concept TotalScore) element has been changed from Quantity to Integer, and minimum and maximum allowed values of 0 and 5 respectively are applied.
* The system value of the Observation.component.code elements is changed to urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1.

## zib-TimeInterval
* In the previous release, the concepts of this partial zib were mapped directly in the profiles where they are used. In this release the usage of this partial zib has been expanded and profiles have been created to aid the usage in profiles in the various situations that might occur.

## zib-TextResult
* New concept VisualResult mapped in additional profile zib-TextResult.VisualResult on `Media.content`. `DiagnosticReport.image.link` references this profile.

# zib-TobaccoUse
* StartDate and EndDate are placed on a type slice of `Observation.effective[x]` adhering to the open world modelling principle.
* TobaccoUseStatus is placed on a type slice of `Observation.value[x]` adhering to the open world modelling principle.
* The comment element is moved to `Observation.note.text` instead of `Observation.comment`.
* The data type for PackYears has been changed from Quantity to integer to align with the functional definition and the Quantity data type does not bring additional benefits to justify not aligning with the zib.

## zib-TreatmentDirective2
* This is a new zib loosely based on the previous zib TreatmentDirective. Below the most relevant changes compared to the previous zib and the STU3 profile are described.
* Removed the modifierExtension `treatmentPermitted`, which is now mapped to `Consent.provision.type`.
* Added a modifierExtension to capture zib concept SpecificationOther.
* Removed `treatment` extension, which is now mapped to `Consent.provision.code`.
* Removed `verification` extension because the related functional concept has been removed in the zib.
* Added guidance for mandatory elements `Consent.status`, `Consent.scope` and `Consent.policy` or `Consent.policyRule`.
* Moved AdvanceDirective from `Consent.source[x]` to `Consent.source[x]:sourceReference` to be more specific.
* Removed references that are not defined by the zib (e.g. `Consent.organization` and `Consent.actor`).

## zib-TreatmentObjective
* DesiredHealthcareResult element moved to `Goal.description.text`.
* Removed the mapping on `Goal.expressedBy` and the reference to PractitionerRole.
* The reference TreatmentObjective -> FunctionalOrMentalStatus -> MedicalDevice is mapped in reverse onto the resource-pertainsToGoal extension in zib-MedicalDevice.

## zib-Vaccination
* Renamed profile names: zib-Vaccination to zib-Vaccination-event and zib-VaccinationRecommendation to zib-Vaccination-request conform new profiling guidelines.
* Removed references not accounted for by the zib (e.g. `Immunization.location`, `Immunization.manufacturer` and `ImmunizationRecommendation.recommendation.supportingImmunization`).
* Aligned cardinality of `Immunization.note` with the zib by making it `0..1`.
* Moved VaccinationDate on a type slice on `Immunization.occurrence[x]:occurrenceDateTime`. This element has been renamed from `date` to `occurrence[x]` in R4.
* Moved Administrator to a slice on `Immunization.performer` with a mandatory fixed pattern in `Immunization.performer.function`.
* Added a pattern on `Immunization.doseQuantity` to mandate the use of mL by UCUM because the definition of Dose states to use milliliters. 
* Removed orderStatus extension because PlannedCareActivityForTransfer zib does not exist anymore.
* Aligned cardinalities of ImmunizationRecommendation with the zib by constraining them and documented this on the root element.
* Removed mapping of DesiredDateForRevaccination because it has been removed by the zib as well. The DesiredDateForRevaccination concept has been replaced by mapping to VaccinationDate which is placed on `ImmunizationRecommendation.recommendation.dateCriterion.value`. The mapping to PlannedCareActivityForTransfer start and end dates have been removed from this element.

## zib-VisualFunction
* Changed fixed slice on `.code.coding` to a pattern on `.code`.
* Relaxed cardinality of `value[x]` to `0..1` of the conceptual cardinalities of the zib.

## zib-Wound
* The concept of 'DateOfLastDressingChange' has been relocated to the Wound Characteristics profile. 

## zib-wounds.WoundCharacteristics
* The different components have been split out to distinct Observation profiles.
* The profile's name has been changed from "WoundCharacteristics" to "zib-wounds.WoundCharacteristics".
* The concept of "WoundImage" is a separate profile (zib-wounds.WoundImage) instead of a component.

## zib-wounds.WoundImage
* There was no profile in the STU3 version and therefore no diff.
