# Maturity of these profiles
## Validation by HL7 Netherlands
Nictiz develops FHIR profiles (and related conformance resources) representing the zibs. These profiles undergo a validation process at HL7 Netherlands[^1], which checks them on aspects like alignment with international FHIR usage, re-usability, usage of terminology, etc. If one or more of these aspects are deemed incorrect, HL7 Netherlands asks Nictiz to adjust the profile accordingly. Only if all these aspects are deemed correct by HL7 Netherlands, the profile passes validation.

In terms of the NEN7522, HL7 Netherlands fulfills the roles of "expert" and "autorisator".

## Beta status
Profiles that have passed validation at HL7 Netherlands are published with a beta label to indicate that, although they have undergone thorough review, they have not been tested in production use. Users should be aware that production testing could introduce the need for adjustments and even breaking changes, although this is deemed unlikely.

## Validation status for each zib

### AbilityToDressOneself v3.1.1
* Profile: zib-AbilityToDressOneself
* Status: validated

### AbilityToDrink v3.1.1
* Profiles:
    * zib-AbilityToDrink
    * zib-AbilityToDrink.DrinkingLimitations
* Status: validated

### AbilityToEat v3.1.1
* Profiles:
    * zib-AbilityToEat
    * zib-AbilityToEat.EatingLimitations
* Status: validated

### AbilityToGroom v1.0.1
* Profile: zib-AbilityToGroom
* Status: validated

### AbilityToManageMedication v1.0.1
* Status: not submitted for validation
* Remark: A discussion is ongoing if the reference to zib NursingIntervention needs to modelled, as this is deemed unnecessary on the zib level.

### AbilityToPerformMouthcareActivities v3.1
* Status: not submitted for validation

### AbilityToPerformNursingActivities v1.0.1
* Status: not submitted for validation

### AbilityToUseToilet v3.1.1
* Profiles:
    * zib-AbilityToUseToilet
    * zib-AbilityToUseToilet.MenstrualCare
    * zib-AbilityToUseToilet.ToiletUse
* Status: validated

### AbilityToWashOneself v3.1.1
* Profile: zib-AbilityToWashOneself
* Status: validated

### AddressInformation v1.1
* Profile: zib-AddressInformation
* Status: validated

### AdministrationAgreement v1.0.3
* Status: not submitted for validation
* Remark: For the medication related zibs, there's an ongoing discussion if the profiles will be published as the zibs (and thus the profiles) are incompatible with the requirements of the MP9 program, which is the main use case for exchange of medication information in the Netherlands. Pending this discussion, these profiles are withheld from validation.

### AdvanceDirective v3.1.1
* Profile: zib-AdvanceDirective
* Status: in progress

### AlcoholUse v3.2
* Profile: zib-AlcoholUse
* Status: validated
* Remark: Since validation, a new issues has come up regarding the relation between the AlcoholUseStatus and the ObservationOfUse container. This could result in the withdrawal of this profile and subsequent re-profiling of this zib.

### Alert v4.1
* Profile: zib-Alert
* Status: in progress

### AllergyIntolerance v3.3
* Profile: zib-AllergyIntolerance
* Status: validated

### AnatomicalLocation v1.0
* Profile: zib-AnatomicalLocation
* Status: validated

### ApgarScore v1.0.1
* Profiles:
    * zib-ApgarScore-1Minute
    * zib-ApgarScore-5Minute
    * zib-ApgarScore-10Minute
* Status: validated

### BarthelADLIndex v3.1
* Profile: zib-BarthelADLIndex
* Status: in progress

### BladderFunction v3.2
* Profiles:
    * zib-BladderFunction
    * zib-Stoma
    * zib-MedicalDevice
    * zib-MedicalDevice.Product
* Status: not submitted for validation

### BloodPressure v3.2.1
* Profile: zib-BloodPressure
* Status: validated

### BodyHeight v3.1.1
* Profile: zib-BodyHeight
* Status: validated

### BodyTemperature v3.1.2
* Profile: zib-BodyTemperature
* Status: validated

### BodyWeight v3.2
* Profile: zib-BodyWeight
* Status: validated

### BowelFunction v3.1.1
* Profiles:
    * zib-BowelFunction
    * zib-BowelFunction.FecalContinence
    * zib-BowelFunction.Frequency
    * zib-BowelFunction.DefecationConsistency
    * zib-BowelFunction.DefecationColor
    * zib-MedicalDevice
* Status: in progress

### Burnwound v3.4
* Profiles:
    * zib-Burnwound
    * zib-Burnwound.Extent
    * zib-wounds.WoundCharacteristics
    * zib-wounds.DateOfLastDressingChange
    * zib-wounds.WoundImage
* Status: in progress

### CareAgreement v1.0
* Status: not submitted for validation

### CareTeam v1.0
* Profile: zib-CareTeam
* Status: validated

### ChecklistPainBehavior v1.1
* Profile: zib-ChecklistPainBehavior
* Status: in progress

### ComfortScale v1.1
* Profile: zib-ComfortScale
* Status: validated

### ContactInformation v1.2
* Profiles:
    * zib-ContactInformation-EmailAddresses
    * zib-ContactInformation-TelephoneNumbers
* Status: validated

### ContactPerson v3.4
* Profiles:
    * zib-ContactPerson
    * zib-Patient
* Status: validated

### DAS v1.0
* Status: not submitted for validation

### DispenseRequest v1.0.3
* Status: not submitted for validation
* Remark: For the medication related zibs, there's an ongoing discussion if the profiles will be published as the zibs (and thus the profiles) are incompatible with the requirements of the MP9 program, which is the main use case for exchange of medication information in the Netherlands. Pending this discussion, these profiles are withheld from validation.

### DevelopmentChild v1.2
* Profiles:
    * zib-DevelopmentChild
    * zib-DevelopmentChild.AgeFirstMenstruation
    * zib-DevelopmentChild.DevelopmentCognition
    * zib-DevelopmentChild.DevelopmentLinguistics
    * zib-DevelopmentChild.DevelopmentLocomotion
    * zib-DevelopmentChild.DevelopmentSocial
    * zib-DevelopmentChild.ToiletTrainednessFeces
    * zib-DevelopmentChild.ToiletTrainednessUrine
* Status: not submitted for validation
* Remarks:
    * Originally, this zib was profiled using a single Observation resource, but the Validatieraad rejected this approach and asked to use multiple Observation resources. Since then, an issue with the underlying zib has come up which prevents the completion of the profiles according to this new approach.
    * See [ZIB-2262](https://nictiz.atlassian.net/browse/ZIB-2262) for details.

### DOSScore v1.0
* Profile: zib-DOSScore
* Status: validated

### DrugUse v3.3
* Profile: zib-DrugUse
* Status: validated
* Remark: Since validation, a new issues has come up regarding the relation between the DrugUseStatus and the ObservationOfUse container. This could result in the withdrawal of this profile and subsequent re-profiling of this zib.

### Education v3.2
* Profile: zib-Education
* Status: validated

### Encounter v4.0.1
* Profile: zib-Encounter
* Status: in progress
* Remark: the profile had passed validation before, but afterwards the guidance is adjusted regarding start and stop dates

### EpisodeOfCare v1.0
* Profile: zib-EpisodeOfCare
* Status: validated

### FamilyHistory v3.1
* Status: not submitted for validation
* Remark: There is a question regarding the intention of zib concept AgeAtDeath which prevents the creation of a profile for this zib. See [ZIB-2262](https://nictiz.atlassian.net/browse/ZIB-2262) for more information.

### FamilySituation v3.2
* Status: not submitted for validation

### FamilySituationChild v1.2
* Status: not submitted for validation

### FeedingPatternInfant v1.1
* Profile: zib-FeedingPatternInfant
* Status: rejected

### FeedingTubeSystem v3.3
* Status: not submitted for validation
* Remark: This zib has a dependency on zib MedicationAdministration2. For the medication related zibs, there's an ongoing discussion if the profiles will be published as the zibs (and thus the profiles) are incompatible with the requirements of the MP9 program, which is the main use case for exchange of medication information in the Netherlands. Pending this discussion, the profile is withheld from validation.

### FLACCpainScale v1.1
* Profile: zib-FLACCpainScale
* Status: validated

### FluidBalance v1.0.1
* Profiles:
    * zib-FluidBalance
    * zib-FluidBalance.FluidTotalIn
    * zib-FluidBalance.FluidTotalOut
* Status: validated

### FreedomRestrictingIntervention v1.0
* Profile: zib-FreedomRestrictingIntervention
* Status: in progress

### FunctionalOrMentalStatus v3.2
* Profiles:
    * zib-FunctionalOrMentalStatus
    * zib-MedicalDevice
* Status: not submitted for validation

### GlasgowComaScale v3.2
* Profile: zib-GlasgowComaScale
* Status: in progress

### HeadCircumference v1.3
* Profile: zib-HeadCircumference
* Status: validated

### HealthcareProvider v3.4
* Profiles:
    * zib-HealthcareProvider
    * zib-HealthcareProvider-Organization
* Status: validated

### HealthProfessional v3.5
* Profiles:
    * zib-HealthProfessional-Practitioner
    * zib-HealthProfessional-PractitionerRole
    * zib-CareTeam
    * zib-Encounter
* Status: rejected
* Remark: The concept HealthProfessionalRole defined by this zib is in FHIR not part of a Practitioner or PractitionerRole resource, but rather part of the resource referencing these resources. Pending development of all profiles, this concept has not been properly mapped to each situation. See [this Github issue](https://github.com/Nictiz/Nictiz-R4-zib2020/issues/44) for more information.

### HearingFunction v3.2
* Profiles:
    * zib-HearingFunction
    * zib-HearingFunction.HearingAid
    * zib-HearingFunction.HearingAid.Product
* Status: not submitted for validation

### HeartRate v3.4
* Profiles:
    * zib-HeartRate
    * zib-HeartRate.HeartbeatRegularity
    * zib-HeartRate.InterpretationHeartRate
* Status: rejected
* Remark: A discussion is ongoing if the InterpretationHeartRate concept should be regarded a distinct Observation of its own or an interpretation of the heart rate. See [ZIB-2570](https://nictiz.atlassian.net/browse/ZIB-2570) for details.

### HelpFromOthers v3.01
* Status: not submitted for validation

### IllnessPerception v3.1
* Profiles:
    * zib-IllnessPerception
    * zib-IllnessPerception.CopingWithIllnessByFamily
    * zib-IllnessPerception.CopingWithIllnessByPatient
    * zib-IllnessPerception.PatientIllnessInsight
* Status: validated

### Infusion v3.3
* Status: not submitted for validation
* Remark: This zib has a dependency on zib MedicationAdministration2. For the medication related zibs, there's an ongoing discussion if the profiles will be published as the zibs (and thus the profiles) are incompatible with the requirements of the MP9 program, which is the main use case for exchange of medication information in the Netherlands. Pending this discussion, the profile is withheld from validation.

### InstructionsForUse v1.2.1
* Status: not submitted for validation
* Remark: For the medication related zibs, there's an ongoing discussion if the profiles will be published as the zibs (and thus the profiles) are incompatible with the requirements of the MP9 program, which is the main use case for exchange of medication information in the Netherlands. Pending this discussion, these profiles are withheld from validation.

### LaboratoryTestResult v4.6
* Profiles:
    * zib-LaboratoryTestResult
    * zib-LaboratoryTestResult.Specimen
    * zib-LaboratoryTestResult.SpecimenSource
* Status: not submitted for validation

### LanguageProficiency v3.2
* Profiles: zib-Patient
* Status: validated
* Remark: This zib is modelled inline in the zib-Patient profile.

### LegalSituation v2.0
* Profiles:
    * zib-LegalSituation-LegalStatus
    * zib-LegalSituation-Representation
* Status: validated

### LifeStance v3.2
* Profile: zib-LifeStance
* Status: validated

### MaritalStatus v3.1
* Profile: zib-Patient
* Status: validated
* Remark: This zib is modelled inline in the zib-Patient profile.

### MedicalDevice v3.3.1
* Profiles:
    * zib-MedicalDevice
    * zib-MedicalDevice.Product
    * zib-Procedure-event
* Status: in progress

### MedicationAdministration2 v1.1.1
* Status: not submitted for validation
* Remark: For the medication related zibs, there's an ongoing discussion if the profiles will be published as the zibs (and thus the profiles) are incompatible with the requirements of the MP9 program, which is the main use case for exchange of medication information in the Netherlands. Pending this discussion, these profiles are withheld from validation.

### MedicationAgreement v1.2
* Status: not submitted for validation
* Remark: For the medication related zibs, there's an ongoing discussion if the profiles will be published as the zibs (and thus the profiles) are incompatible with the requirements of the MP9 program, which is the main use case for exchange of medication information in the Netherlands. Pending this discussion, these profiles are withheld from validation.

### MedicationContraIndication v1.0
* Profile: zib-MedicationContraIndication
* Status: in progress

### MedicationDispense v2.0.2
* Status: not submitted for validation
* Remark: For the medication related zibs, there's an ongoing discussion if the profiles will be published as the zibs (and thus the profiles) are incompatible with the requirements of the MP9 program, which is the main use case for exchange of medication information in the Netherlands. Pending this discussion, these profiles are withheld from validation.

### MedicationUse2 v1.1.1
* Status: not submitted for validation
* Remark: For the medication related zibs, there's an ongoing discussion if the profiles will be published as the zibs (and thus the profiles) are incompatible with the requirements of the MP9 program, which is the main use case for exchange of medication information in the Netherlands. Pending this discussion, these profiles are withheld from validation.

### Mobility v3.3
* Profiles:
    * zib-Mobility
    * zib-Mobility.ChangingPosition
    * zib-Mobility.ClimbingStairs
    * zib-Mobility.MaintainingPosition
    * zib-Mobility.Transfer
    * zib-Mobility.Walking
* Status: validated

### MultidisciplinaryTeamMeeting v1.0
* Status: not submitted for validation

### MUSTScore v3.1
* Profile: zib-MUSTScore
* Status: validated

### NameInformation v1.1
* Profiles:
    * zib-NameInformation
    * zib-NameInformation.GivenName
* Status: in progress

### Nationality v3.0
* Profiles: zib-Patient
* Status: validated
* Remark: This zib is modelled inline in the zib-Patient profile.

### NursingIntervention v3.2
* Status: not submitted for validation

### NutritionAdvice v3.2
* Profile: zib-NutritionAdvice
* Status: rejected

### O2Saturation v3.1
* Profile: zib-O2Saturation
* Status: in progress

### OutcomeOfCare v3.2
* Status: not submitted for validation

### PainCharacteristics v1.0
* Status: not submitted for validation

### PainScore v4.0
* Profile: zib-PainScore
* Status: in progress

### ParticipationInSociety v3.1
* Profiles:
    * zib-ParticipationInSociety
    * zib-ParticipationInSociety.Hobby
    * zib-ParticipationInSociety.SocialNetwork
    * zib-ParticipationInSociety.WorkSituation
* Status: validated

### Patient v3.2
* Profile: zib-Patient
* Status: validated

### Payer v3.1.1
* Profiles:
    * zib-Payer.PayerPerson
    * zib-Payer.InsuranceCompany
    * zib-Payer-Organization
    * zib-ContactPerson
    * zib-Patient
* Status: validated

### PharmaceuticalProduct v2.1.2
* Profile: zib-PharmaceuticalProduct
* Status: in progress

### Pregnancy-v4.0
* Profiles:
    * zib-Pregnancy
    * zib-Pregnancy.DateLastMenstruation
    * zib-Pregnancy.EstimatedDateOfDelivery
    * zib-Pregnancy.Gravidity
    * zib-Pregnancy.Parity
    * zib-Pregnancy.PregnancyDuration
* Status: validated

### PressureUlcer v3.4
* Profiles:
    * zib-PressureUlcer
    * zib-wounds.WoundCharacteristics
    * zib-wounds.DateOfLastDressingChange
    * zib-wounds.WoundDepth
    * zib-wounds.WoundImage
    * zib-wounds.WoundLength
    * zib-wounds.WoundWidth
* Status: in progress

### Procedure v5.2 (past use)
* Profiles:
    * zib-Procedure-event
    * zib-MedicalDevice
    * zib-HearingFunction.HearingAid
    * zib-HealthProfessional-PractitionerRole
* Status: validated

### Procedure v5.2 (future use)
* Profiles:
    * zib-Procedure-request
* Status: validated

### Problem v4.4
* Profile: zib-Problem
* Status: in progress

### PulseRate v3.3
* Profiles:
    * zib-PulseRate
    * zib-PulseRate.PulseRegularity
* Status: rejected

### Range v1.0.1
* Status: validated
* Remark: No explicit profile of this partial zib is created, as this model is part of the resources which use this partial zib.

### Refraction v1.0
* Profile: zib-Refraction
* Status: in progress

### Respiration v3.2
* Status: not submitted for validation

### SkinDisorder v3.3
* Profile: zib-SkinDisorder
* Status: validated

### SNAQ65+Score v1.2
* Profile: zib-SNAQ65plusScore
* Status: in progress

### SNAQrcScore v1.1
* Profile: zib-SNAQrcScore
* Status: in progress

### SNAQScore v3.2
* Profile: zib-SNAQScore
* Status: in progress

### SOAPReport v1.0
* Profiles:
    * zib-SOAPReport
    * zib-SOAPReport.SOAPLine
* Status: in progress

### Stoma v3.3
* Profiles:
    * zib-Stoma
    * zib-MedicalDevice
* Status: validated

### StrongKidsScore v1.1
* Profile: zib-StrongKidsScore
* Status: in progress

### TextResult v4.4
* Profiles:
    * zib-TextResult
    * zib-TextResult.VisualResult
    * zib-Procedure-event
* Status: in progress

### TimeInterval v1.0
* Profiles:
    * zib-TimeInterval
    * ext-TimeInterval.Duration
* Status: validated

### TreatmentDirective2 v1.0
* Profile: zib-TreatmentDirective2
* Status: in progress

### TreatmentObjective v3.2
* Status: not submitted for validation

### NMTumorClassification v1.0
* Status: not submitted for validation

### TobaccoUse v3.2
* Profile: zib-TobaccoUse
* Status: validated
* Remark: Since validation, a new issues has come up regarding the relation between the TobaccoUseStatus and the ObservationOfUse container. This could result in the withdrawal of this profile and subsequent re-profiling of this zib.

### Vaccination v4.0 (past use)
* Profile: zib-Vaccination-event
* Status: validated

### Vaccination v4.0 (future use)
* Profile: zib-Vaccination-request
* Status: rejected
* Remark: On the zib level, it is not entirely clear if future use means a concrete order, a clinical reminder, or both. Pending this discussion, further profiling efforts are withheld.

### VisualAcuity v1.0
* Status: not submitted for validation

### VisualFunction v3.1
* Profiles:
    * zib-VisualFunction
    * zib-VisualFunction.VisualAid
* Status: not submitted for validation
