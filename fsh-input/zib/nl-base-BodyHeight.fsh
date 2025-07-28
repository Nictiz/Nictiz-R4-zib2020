Profile: NlbaseBodyHeight
Parent: http://nictiz.nl/fhir/StructureDefinition/pattern-VitalSigns
Id: nl-base-BodyHeight
Title: "nl base BodyHeight"
* insert ProfileMetadata(nl-base-BodyHeight)
* insert Purpose(BodyHeight, 3.1.1, Observation)

* code = http://loinc.org#8302-2
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] only Quantity
* value[x] from http://hl7.org/fhir/ValueSet/ucum-bodylength (preferred)
* component insert Discriminator(value, code)
* component contains
    position 0..1
* component[position].code = http://snomed.info/sct#425260001
* component[position].value[x] only CodeableConcept
* component[position].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.2.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "A person’s body height."
* .
  * ^short = "BodyHeight"
  * ^alias[+] = "Lichaamslengte"
  * ^comment = """
    **HL7 Vital Signs compatibility**
    
    Although this profile represents a vital signs measurement, it is *not* directly based on the HL7 Vital Signs profile because of two issues in its current version that prevent it from being used for the exchange of zibs (see below). However, an effort has been made to make this profile functionally equivalent to (a profile derived from) the [HL7 Vital Signs BodyHeight profile](http://hl7.org/fhir/StructureDefinition/bodyheight). Instances for both profiles should be highly compatible.
    
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
  * ^short = "HeightDateTime"
  * ^alias[+] = "LengteDatumTijd"
  * ^definition = "Date and if possible time of body height measurement."
* value[x]
  * ^short = "HeightValue"
  * ^alias[+] = "LengteWaarde"
  * ^definition = "The element contains the value of the measured body height. Body height is the height of the human body from heel to scalp, generally measured when standing. Body height is measured in a stretched, horizontal position for very small children or patients that are unable to stand."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the body height measurement."
* component[position].value[x]
  * ^short = "Position"
  * ^alias[+] = "Positie"
  * ^definition = "The person's position during the measurement."
  * ^comment = "The HL7 Vital Signs IG specifies that the lying position during body height measurement may be communicated using an additional `Observation.code.coding` using LOINC code _8306-3_ (Body height - lying). Implementers may choose to include this coding as well when selecting SNOMED code _102538003_ here. However, if the body position during measurement is communicated using an instance of this profile, this `Observation.component` slice SHALL be populated as well."

Mapping: NlbaseBodyHeight-to-zib-bodyheight-v3.1.1-2020EN
Id: zib-bodyheight-v3.1.1-2020EN
Title: "zib BodyHeight-v3.1.1(2020EN)"
Source: NlbaseBodyHeight
Target: "https://zibs.nl/wiki/BodyHeight-v3.1.1(2020EN)"
*  -> "NL-CM:12.2.1" "BodyHeight"
* effectiveDateTime -> "NL-CM:12.2.4" "HeightDateTime"
* value[x] -> "NL-CM:12.2.2" "HeightValue"
* note.text -> "NL-CM:12.2.3" "Comment"
* component[position].value[x] -> "NL-CM:12.2.5" "Position"
