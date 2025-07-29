Profile: NlbaseAllergyIntolerance
Parent: AllergyIntolerance
Id: nl-base-AllergyIntolerance
Title: "nl base AllergyIntolerance"
* insert ProfileMetadata(nl-base-AllergyIntolerance)
* insert Purpose(AllergyIntolerance, 3.3, AllergyIntolerance)

* clinicalStatus insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/AllergieStatusCodelijst-to-AllergyIntoleranceClinicalStatusCodes, AllergieStatusCodelijst_to_AllergyIntoleranceClinicalStatusCodes, AllergyIntoleranceClinicalStatusCodes)
* verificationStatus insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/AllergieStatusCodelijst-to-AllergyIntoleranceVerificationStatus, AllergieStatusCodelijst_to_AllergyIntoleranceVerificationStatus, AllergyIntoleranceVerificationStatusCodes)
* category insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/AllergieCategorieCodelijst-to-AllergyIntoleranceCategory, AllergieCategorieCodelijst_to_AllergyIntoleranceCategory, AllergyIntoleranceCategory)
* category.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification named allergyCategoryCodelist 0..1
* category.extension[allergyCategoryCodelist].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.2.2--20200901000000 (preferred)
* criticality insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/MateVanKritiekZijnCodelijst-to-AllergyIntoleranceCriticality, MateVanKritiekZijnCodelijst_to_AllergyIntoleranceCriticality, AllergyIntoleranceCriticality)
* criticality.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification named criticalExtentCodelist 0..1
* criticality.extension[criticalExtentCodelist].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.2.4--20200901000000 (preferred)
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.2--20200901000000 (preferred)
* onset[x] insert Discriminator(type, $this)
* onsetDateTime only dateTime
* reaction.substance from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.1--20200901000000 (preferred)
* reaction.manifestation from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.2.5--20200901000000 (preferred)
* reaction.severity from http://hl7.org/fhir/ValueSet/reaction-event-severity|4.0.1 (required)
* reaction.severity insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/ErnstCodelijst-to-AllergyIntoleranceSeverity, ErnstCodelijst_to_AllergyIntoleranceSeverity, AllergyIntoleranceSeverity)
* reaction.exposureRoute from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.2.12--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    An allergy or intolerance describes a patient’s tendency towards hypersensitivity to a certain substance, so that an unwanted physiological reaction is expected after exposure to the substance, while most people would not exhibit such a reaction to that amount. The observed physiological changes are usually the result of an immunological reaction.
    The substances can be categorized as follows:
    * Medicine
    * Medicine category
    * Ingredient/addition
    * Nutrition
    * Environmental factor
    * Animal
    * Plants
    * Chemicals
    * Inhaled allergenic
    """
* .
  * ^short = "AllergyIntolerance"
  * ^alias[+] = "AllergieIntolerantie"
  * ^comment = """
    The zib defines certain allergy statuses in the AllergieStatusCodelijst (NL-CM:8.2.5 AllergyStatus). These statuses are represented using both the FHIR elements `AllergyIntolerance.clinicalStatus` and `AllergyIntolerance.verificationStatus`; most of the zib codes map to a `.clinicalStatus` code, but the zib code _nullified_ can only be represented by `.verificationStatus` = _entered-in-error_.
    
    For both these FHIR elements, a separate ConceptMap is defined. Although both ConceptMaps include _unmatched_ concepts, together they provide an _equal_ mapping of each AllergieStatusCodelijst concept. Therefore, there's no need to include the zib code using the ext-CodeSpecification extension, as would normally be expected in these situations.
    """
* clinicalStatus
  * ^short = "AllergyStatus"
  * ^alias[+] = "AllergieStatus"
  * ^definition = "Statement on the status of the patient’s hypersensitivity."
  * ^comment = "See the comment on the root element for guidance on mapping zib AllergyStatus to FHIR."
* verificationStatus
  * ^short = "AllergyStatus"
  * ^alias[+] = "AllergieStatus"
  * ^definition = "Statement on the status of the patient’s hypersensitivity."
  * ^comment = "See the comment on the root element for guidance on mapping zib AllergyStatus to FHIR."
* category
  * ^short = "AllergyCategory"
  * ^alias[+] = "AllergieCategorie"
  * ^definition = "Identifies the allergy category such as medication, food or environment."
* category.extension[allergyCategoryCodelist].value[x]
  * ^short = "AllergyCategory"
  * ^alias[+] = "AllergieCategorie"
  * ^definition = "Identifies the allergy category such as medication, food or environment."
* criticality
  * ^short = "Criticality"
  * ^alias[+] = "MateVanKritiekZijn"
  * ^definition = "Critical extent is defined as “the potential severity of future reactions.” This represents a clinical evaluation of the worst case scenario for a future reaction. It can be based on the severity of past reactions, the dose and manner of exposure which caused reactions in the past, and the life-threatening potential of the type of reaction. Critical extent is a property of the allergy, and not of the reaction itself."
* criticality.extension[criticalExtentCodelist].value[x]
  * ^short = "Criticality"
  * ^alias[+] = "MateVanKritiekZijn"
  * ^definition = "Critical extent is defined as “the potential severity of future reactions.” This represents a clinical evaluation of the worst case scenario for a future reaction. It can be based on the severity of past reactions, the dose and manner of exposure which caused reactions in the past, and the life-threatening potential of the type of reaction. Critical extent is a property of the allergy, and not of the reaction itself."
* code
  * ^short = "CausativeAgent"
  * ^alias[+] = "VeroorzakendeStof"
  * ^definition = "Substance, group of substances or environmental factor to which the patient is allergic or hypersensitive."
* onsetDateTime
  * ^short = "StartDateTime"
  * ^alias[+] = "BeginDatumTijd"
  * ^definition = "The date and time at which the allergy or undesired reaction was determined. This can be an exact date and time, or a rough indication of the date (such as only the year, or the month and the year)."
* lastOccurrence
  * ^short = "LastReactionDateTime"
  * ^alias[+] = "LaatsteReactieDatumTijd"
  * ^definition = "Entry of the last time a hypersensitive reaction took place."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Textual explanation of the hypersensitivity which cannot be entered in any of the other fields."
* reaction
  * ^short = "Reaction"
  * ^alias[+] = "Reactie"
* reaction.substance
  * ^short = "SpecificSubstance"
  * ^alias[+] = "SpecifiekeStof"
  * ^definition = "More specific indication of the substance that caused the reaction. This can be a specific substance from a group of substances to which the patient is allergic or hypersensitive."
* reaction.manifestation
  * ^short = "Symptom"
  * ^alias[+] = "Symptoom"
  * ^definition = "The content specifications of the reaction that takes place when the patient is exposed to the causative substance."
* reaction.description
  * ^short = "ReactionDescription"
  * ^alias[+] = "ReactieBeschrijving"
  * ^definition = "Textual description of the reaction as a whole."
* reaction.onset
  * ^short = "ReactionTime"
  * ^alias[+] = "ReactieTijdstip"
  * ^definition = "Date and time at which the reaction took place. This may also be just the date or a partial date, in the event that the exact date is unknown."
* reaction.severity
  * ^short = "Severity"
  * ^alias[+] = "Ernst"
  * ^definition = "The severity of the reaction as a result of exposure to the causative substance."
* reaction.exposureRoute
  * ^short = "RouteOfExposure"
  * ^alias[+] = "WijzeVanBlootstelling"
  * ^definition = "Way in which the patient came into contact with the causative agent or the way in which the agent was administered."

Mapping: NlbaseAllergyIntolerance-to-zib-allergyintolerance-v3.3-2020EN
Id: zib-allergyintolerance-v3.3-2020EN
Title: "zib AllergyIntolerance-v3.3(2020EN)"
Source: NlbaseAllergyIntolerance
Target: "https://zibs.nl/wiki/AllergyIntolerance-v3.3(2020EN)"
*  -> "NL-CM:8.2.1" "AllergyIntolerance"
* clinicalStatus -> "NL-CM:8.2.5" "AllergyStatus"
* verificationStatus -> "NL-CM:8.2.5" "AllergyStatus"
* category -> "NL-CM:8.2.4" "AllergyCategory"
* category.extension[allergyCategoryCodelist].value[x] -> "NL-CM:8.2.4" "AllergyCategory"
* criticality -> "NL-CM:8.2.7" "Criticality"
* criticality.extension[criticalExtentCodelist].value[x] -> "NL-CM:8.2.7" "Criticality"
* code -> "NL-CM:8.2.2" "CausativeAgent"
* onsetDateTime -> "NL-CM:8.2.6" "StartDateTime"
* lastOccurrence -> "NL-CM:8.2.8" "LastReactionDateTime"
* note.text -> "NL-CM:8.2.9" "Comment"
* reaction -> "NL-CM:8.2.10" "Reaction"
* reaction.substance -> "NL-CM:8.2.12" "SpecificSubstance"
* reaction.manifestation -> "NL-CM:8.2.11" "Symptom"
* reaction.description -> "NL-CM:8.2.13" "ReactionDescription"
* reaction.onset -> "NL-CM:8.2.17" "ReactionTime"
* reaction.severity -> "NL-CM:8.2.14" "Severity"
* reaction.exposureRoute -> "NL-CM:8.2.15" "RouteOfExposure"
