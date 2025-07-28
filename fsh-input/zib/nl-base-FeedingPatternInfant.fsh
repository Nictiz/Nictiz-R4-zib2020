Profile: NlbaseFeedingPatternInfant
Parent: Observation
Id: nl-base-FeedingPatternInfant
Title: "nl base FeedingPatternInfant"
* insert ProfileMetadata(nl-base-FeedingPatternInfant)
* insert Purpose(FeedingPatternInfant, 1.1, Observation)

* basedOn only Reference(http://hl7.org/fhir/StructureDefinition/CarePlan or http://hl7.org/fhir/StructureDefinition/DeviceRequest or http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation or http://hl7.org/fhir/StructureDefinition/MedicationRequest or http://hl7.org/fhir/StructureDefinition/NutritionOrder or http://hl7.org/fhir/StructureDefinition/ServiceRequest or http://nictiz.nl/fhir/StructureDefinition/nl-base-NutritionAdvice)
* code = http://snomed.info/sct#289145007
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* component insert Discriminator(value, code)
* component contains
    feedingSupplement 0.. and
    feedingFrequency 0..1 and
    feedingType 0..
* component[feedingSupplement].code = http://snomed.info/sct#373453009
* component[feedingSupplement].value[x] only CodeableConcept
* component[feedingFrequency].code = http://snomed.info/sct#364653007
* component[feedingFrequency].value[x] only Quantity
* component.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-FeedingPatternInfant.FeedingMethod named feedingMethod 0..1
* component[feedingType].code = http://snomed.info/sct#109021000146107
* component[feedingType].value[x] only CodeableConcept
* component[feedingType].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.31.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "A healthy diet means that we do not consume too much or too little (energy intake balanced with energy use) and that the composition of food (mainly important nutrients) follows the recommendations from the Health Council. For an infant, this means that the child receives breastfeeding or formula milk or a combination thereof."
* .
  * ^short = "FeedingPatternInfant"
  * ^alias[+] = "VoedingspatroonZuigeling"
  * ^comment = """
    ## Deviation from zib FeedingPatternInfant
    
    During the formal review of this profile by HL7 Netherlands, it was determined that the zib approach of sending feeding supplement data only as a single string is too restrictive, as many real-word systems have this data available in coded form. For this reason, the \"feedingSupplement\" component supports the _CodeableConcept_ data type rather than the _string_ data type. See the documentation on `.component:feedingSupplement.valueCodeableConcept` for guidance.
    """
* basedOn
  * ^short = "NutritionAdvice"
  * ^alias[+] = "Voedingsadvies"
  * ^definition = "This is a reference to the rootconcept DietaryRecommendations of information model DietaryRecommendations."
* effectiveDateTime
  * ^short = "FeedingPatternInfantDateTime"
  * ^alias[+] = "VoedingspatroonZuigelingDatumTijd"
  * ^definition = "The date and time on which the characteristics of feeding of the infant are registered."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the feeding of the infant."
* component[feedingSupplement].value[x]
  * ^short = "FeedingSupplement"
  * ^alias[+] = "VoedingToevoeging"
  * ^definition = "It is possible to add supplements to breast and formula milk, such as locust bean gum to thicken milk in case of infant reflux."
  * ^comment = """
    In contrast to the zib model, this profile allows for communicating feeding supplements in two ways:
    
    1. As a single string. In this case, a single feedingSupplement component is expected with the data communicated using the `.text` element of this _CodeableConcept_ value.
    2. As one or more coded supplements. In this case, a feedingSupplement component is expected for each coded supplement.
    
    Receiving systems MUST be able to interpret feeding supplement data both types. To support receiving systems which don't support coded information about feeding supplements, sending systems MUST provide a valid `.display` when sending coded information.
    
    See the [Geboortezorg dataset](https://decor.nictiz.nl/pub/perinatologie/peri20-html-20220929T111810/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.302-2020-09-15T112808.html) for an example ValueSet of coded feeding supplements.
    
    See also the remark on the root of this profile for the background of this deviation.
    """
* component[feedingFrequency].value[x]
  * ^short = "FeedingFrequency"
  * ^alias[+] = "VoedingFrequentie"
  * ^definition = "The number of feeding gifts within 24 hours."
* component[feedingType]
  * ^definition = "Several combinations of FeedingType and FeedingMethod are possible: 1) FeedingType breast milk, FeedingMethod breastfed = to give breastfeeding naturally. 2) FeedingType breast milk, FeedingMethod bottle fed = to give expressed breast milk via bottle. 3) FeedingType formula milk, FeedingMethod bottle fed = to give formula milk via bottle."
  * ^comment = "Zib FeedingPatternInfant contains the container Feeding, which hosts two concepts: FeedingType and FeedingMethod. Because these concepts are inherently linked and meaning is derived from the combination of the values of these two concepts, they are modelled in one component. `.component:feedingType` contains the value of FeedingType in `.valueCodeableConcept` and the value of FeedingMethod in `.extension:feedingMethod.valueCodeableConcept`."
* component[feedingType].value[x]
  * ^short = "FeedingType"
  * ^alias[+] = "VoedingSoort"
  * ^definition = "The type of feeding (breast or formula milk) that is given to the infant."

Mapping: NlbaseFeedingPatternInfant-to-zib-feedingpatterninfant-v1.1-2020EN
Id: zib-feedingpatterninfant-v1.1-2020EN
Title: "zib FeedingPatternInfant-v1.1(2020EN)"
Source: NlbaseFeedingPatternInfant
Target: "https://zibs.nl/wiki/FeedingPatternInfant-v1.1(2020EN)"
*  -> "NL-CM:4.31.1" "FeedingPatternInfant"
* basedOn -> "NL-CM:4.31.9" "NutritionAdvice"
* effectiveDateTime -> "NL-CM:4.31.6" "FeedingPatternInfantDateTime"
* note.text -> "NL-CM:4.31.8" "Comment"
* component[feedingSupplement].value[x] -> "NL-CM:4.31.7" "FeedingSupplement"
* component[feedingFrequency].value[x] -> "NL-CM:4.31.5" "FeedingFrequency"
* component[feedingType].value[x] -> "NL-CM:4.31.3" "FeedingType"
