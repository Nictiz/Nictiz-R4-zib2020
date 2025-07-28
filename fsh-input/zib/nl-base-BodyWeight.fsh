Profile: NlbaseBodyWeight
Parent: http://nictiz.nl/fhir/StructureDefinition/pattern-VitalSigns
Id: nl-base-BodyWeight
Title: "nl base BodyWeight"
* insert ProfileMetadata(nl-base-BodyWeight)
* insert Purpose(BodyWeight, 3.2, Observation)

* code = http://loinc.org#29463-7
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] only Quantity
* value[x] from http://nictiz.nl/fhir/ValueSet/zib-BodyWeight-units (preferred)
* component insert Discriminator(value, code)
* component contains
    clothing 0..1
* component[clothing].code = http://snomed.info/sct#248159006
* component[clothing].value[x] only CodeableConcept
* component[clothing].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.1.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Body weight is the common name for (human) body mass."
* .
  * ^short = "BodyWeight"
  * ^alias[+] = "Lichaamsgewicht"
  * ^comment = """
    **HL7 Vital Signs compatibility**
    
    Although this profile represents a vital signs measurement, it is *not* directly based on the HL7 Vital Signs profile because of two issues in its current version that prevent it from being used for the exchange of zibs (see below). However, an effort has been made to make this profile functionally equivalent to (a profile derived from) the [HL7 Vital Signs BodyWeight profile](http://hl7.org/fhir/StructureDefinition/bodyweight). Instances for both profiles should be highly compatible.
    
    This means that it should be possible to mostly validate an instance for this profile against the HL7 Vital Signs counterpart, _except_ for references on `Observation.hasMember` and `Observation.derivedFrom`. The base HL7 Vital Signs profile restricts the targets of these element to itself, which is a requirement that can never be satisfied for instances of profiles that are not directly derived from it.
    
    Please note that this profile implements the zib and can therefore be more restricted than its HL7 counterpart. It should be regarded as a derived profile rather than a direct recreation of the HL7 version.
    
    **Differences with the HL7 Vital Signs counterpart**
    
    * The _required_ terminology binding on `Observation.component` to the [Vital Signs Units](http://hl7.org/fhir/ValueSet/ucum-vitals-common) dataset makes it impossible to use `.component` for representing anything else than a Quantity (like a CodeableConcept or a boolean). This binding has therefore been omitted in the current profile.
    * The `mustSupport` = _true_ flag found on numerous elements isn't further specified in the HL7 Vital Signs IG, as is required by FHIR. This flag has therefore been omitted from the current profile.
    * The target restriction on `Observation.hasMember` and `Observation.derivedFrom` to the HL7 Vital Signs profile cannot be fulfilled. This restriction has therefore been omitted from the current profile.
    
    It might happen that for some concepts, the zib uses a different (but compatible) way than what is recommended by the [HL7 Vital Signs IG](http://hl7.org/fhir/r4/observation-vitalsigns.html). This is described in the comments for these concepts. There are also some differences in the profiling approach between the current and the HL7 profile, like the use of patterns rather than slices with fixed systems and codes to enforce the inclusion of some coding (for reasons of consistency with other zib profiles, the former approach has been chosen here). Apart from what is mentioned above, constraints, invariants and terminology bindings have been copied from the HL7 Vital Signs profile, but some textual descriptions have been omitted.
    
    Note: No equivalent for the HL7 Vital Signs base profile has been created to implement the zib profiles. The profile for this zib has been directly modelled onto its HL7 Vital Signs counterpart.
    """
* effectiveDateTime
  * ^short = "WeightDateTime"
  * ^alias[+] = "GewichtDatumTijd"
  * ^definition = "Date and (if possible) time that the weight was measured or estimated."
* value[x]
  * ^short = "WeightValue"
  * ^alias[+] = "GewichtWaarde"
  * ^definition = """
    The patient’s body weight. Body weight is expressed in kilograms (kg). For infants under 3kg, body weight is often expressed in grams.
    
    This concept can also be used to determine an estimated body weight in the event that measuring the exact body weight is not possible - such as for example weighing a resistant child, or in the case of having to estimate the weight of an unborn child.
    """
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the weight measurement, such as any problems or factors that may influence body weight at that time, such as timing within the menstrual cycle, timing of recent bowel movement or a note on any amputations."
* component[clothing].code ^comment = "LOINC code _8352-7_ (Clothing worn during measure) may be used here as well, as suggested by the HL7 Vital Signs IG."
* component[clothing].value[x]
  * ^short = "Clothing"
  * ^alias[+] = "Kleding"
  * ^definition = "The clothes the patient was wearing at the time of the measurement."

Mapping: NlbaseBodyWeight-to-zib-bodyweight-v3.2-2020EN
Id: zib-bodyweight-v3.2-2020EN
Title: "zib BodyWeight-v3.2(2020EN)"
Source: NlbaseBodyWeight
Target: "https://zibs.nl/wiki/BodyWeight-v3.2(2020EN)"
*  -> "NL-CM:12.1.1" "BodyWeight"
* effectiveDateTime -> "NL-CM:12.1.4" "WeightDateTime"
* value[x] -> "NL-CM:12.1.2" "WeightValue"
* note.text -> "NL-CM:12.1.3" "Comment"
* component[clothing].value[x] -> "NL-CM:12.1.5" "Clothing"
