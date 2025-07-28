Profile: NlbaseO2Saturation
Parent: http://nictiz.nl/fhir/StructureDefinition/pattern-VitalSigns
Id: nl-base-O2Saturation
Title: "nl base O2Saturation"
* insert ProfileMetadata(nl-base-O2Saturation)
* insert Purpose(O2Saturation, 3.1, Observation)

* code = http://loinc.org#2708-6
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] only Quantity
* value[x] = http://unitsofmeasure.org#%
* component insert Discriminator(value, code)
* component contains
    extraOxygenAdministration 0..1
* component[extraOxygenAdministration].code = http://snomed.info/sct#266702001
* component[extraOxygenAdministration].value[x] only boolean

// Short, alias, definition and comment texts
* ^description = "Arterial oxygen saturation, also referred to as saturation, is an indicator for the amount of oxygen bound to the hemoglobin in the red blood cells of the arteries. The measurement is usually carried out as a transcutaneous measurement with a blood oxygen monitor or pulse oximeter. The saturation level is expressed as a percentage and should be over 95% in healthy people."
* .
  * ^short = "O2Saturation"
  * ^alias[+] = "O2Saturatie"
  * ^comment = """
    **HL7 Vital Signs compatibility**
    
    Although this profile represents a vital signs measurement, it is *not* directly based on the HL7 Vital Signs profile because of two issues in its current version that prevent it from being used for the exchange of zibs (see below). However, an effort has been made to make this profile functionally equivalent to (a profile derived from) the [HL7 Vital Signs OxygenSat profile](http://hl7.org/fhir/StructureDefinition/oxygensat). Instances for both profiles should be highly compatible.
    
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
  * ^short = "O2SaturationDateTime"
  * ^alias[+] = "O2SaturatieDatumTijd"
  * ^definition = "The moment (date and time) of the SpO2 measurement."
* value[x]
  * ^short = "SpO2Value"
  * ^alias[+] = "SpO2Waarde"
  * ^definition = "The element contains the value of the indirect, peripheral measured O2 saturation. The O2 saturation gives a percentage expressing the extent to which the blood’s hemoglobin is saturated with oxygen, the ratio of oxygen-saturated hemoglobin to hemoglobin. The measurement is done in places where sufficient light can get through the skin, such as a finger, toe or earlobe."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the saturation measurement."
* component[extraOxygenAdministration].code ^comment = "The code to identify this concept (SNOMED 266702001) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1476](https://bits.nictiz.nl/browse/ZIB-1476) for more information."
* component[extraOxygenAdministration].value[x]
  * ^short = "ExtraOxygenAdministration"
  * ^alias[+] = "ExtraZuurstofToediening"
  * ^definition = "Indication stating whether the measurement was done in a situation in which extra oxygen was administered."

Mapping: NlbaseO2Saturation-to-zib-o2saturation-v3.1-2020EN
Id: zib-o2saturation-v3.1-2020EN
Title: "zib O2Saturation-v3.1(2020EN)"
Source: NlbaseO2Saturation
Target: "https://zibs.nl/wiki/O2Saturation-v3.1(2020EN)"
*  -> "NL-CM:12.10.1" "O2Saturation"
* effectiveDateTime -> "NL-CM:12.10.3" "O2SaturationDateTime"
* value[x] -> "NL-CM:12.10.2" "SpO2Value"
* note.text -> "NL-CM:12.10.4" "Comment"
* component[extraOxygenAdministration].value[x] -> "NL-CM:12.10.5" "ExtraOxygenAdministration"
