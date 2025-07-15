# FunctionalOrMentalStatus
## Distinction between functional and mental status observations
Zib FunctionalOrMentalStatus provides a common model for both functional status and mental status observations. According to the zib, a functional or mental status can be either just a coded limitation (only zib concept StatusName) or a combination of the observed characteristic and the impact on the patient (StatusName in conjunction with StatusValue).

In FHIR, instances of this zib are mapped onto the Observation resource, with StatusName mapped onto `Observation.code` and StatusValue onto `Observation.valueCodeableConcept`. As `Observation.code` contains details about the functional or mental limitation or about the characteristic being observed, `Observation.category` is used to indicate that the observation is about a functional or mental status in general (i.e. an instance of the zib).

However, functional statuses and mental statuses are unrelated concepts in SNOMED. Therefore, no common category code exists to indicate a "functional or mental status". As a result, functional status Observations should be categorized differently than mental status Observations (using SNOMED 118228005 versus SNOMED 384821006). It is up to the sending system to determine the proper category and assign one of these codes to Observation. In the profile, this is indicated using the slices `.category:functionalStatusFinding` and `.category:mentalStatusFinding`. 

Likewise, a query on all instances of the zib would be on both category codes:
  
    GET [base]/Observation?category=http://snomed.info/sct|118228005,http://snomed.info.sct|384821006

More information can be found in [zib ticket ZIB-1549](https://nictiz.atlassian.net/browse/ZIB-1549).