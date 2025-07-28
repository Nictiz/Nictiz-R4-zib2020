Profile: NlbaseHeadCircumference
Parent: http://nictiz.nl/fhir/StructureDefinition/pattern-VitalSigns
Id: nl-base-HeadCircumference
Title: "nl base HeadCircumference"
* insert ProfileMetadata(nl-base-HeadCircumference)
* insert Purpose(HeadCircumference, 1.3, Observation)

* code = http://loinc.org#9843-4
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] only Quantity
* method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.14.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "The head circumference is the size of the head as measured around the head."
* .
  * ^short = "HeadCircumference"
  * ^alias[+] = "Schedelomvang"
  * ^comment = """
    **HL7 Vital Signs compatibility**
    
    Although this profile represents a vital signs measurement, it is *not* directly based on the HL7 Vital Signs profile because of two issues in its current version that prevent it from being used for the exchange of zibs (see below). However, an effort has been made to make this profile functionally equivalent to (a profile derived from) the [HL7 Vital Signs HeadCircum profile](http://hl7.org/fhir/StructureDefinition/headcircum). Instances for both profiles should be highly compatible.
    
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
  * ^short = "HeadCircumferenceDate"
  * ^alias[+] = "SchedelomvangDatumTijd"
  * ^definition = "The date on which the head circumference was measured."
* value[x]
  * ^short = "HeadCircumferenceMeasurement"
  * ^alias[+] = "SchedelomvangWaarde"
  * ^definition = "The value of the head circumference as measured in centimeters."
  * ^comment = "The zib states that both cm and mm can be used as unit. However, the HL7 Vital Signs profile restricts the metric units to just cm. A value in mm SHALL therefore be communicated as a fractional cm."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the head circumference."
* method
  * ^short = "HeadCircumferenceMeasuringMethod"
  * ^alias[+] = "SchedelomvangMeetmethode"
  * ^definition = "There are different methods to measure the head circumference: prenatal measurement using ultrasound or postnatal measurement using a measuring tape by measuring from the backside of the head (occiput) to above the eyes (supraorbital)."

Mapping: NlbaseHeadCircumference-to-zib-headcircumference-v1.3-2020EN
Id: zib-headcircumference-v1.3-2020EN
Title: "zib HeadCircumference-v1.3(2020EN)"
Source: NlbaseHeadCircumference
Target: "https://zibs.nl/wiki/HeadCircumference-v1.3(2020EN)"
*  -> "NL-CM:12.14.1" "HeadCircumference"
* effectiveDateTime -> "NL-CM:12.14.2" "HeadCircumferenceDate"
* value[x] -> "NL-CM:12.14.3" "HeadCircumferenceMeasurement"
* note.text -> "NL-CM:12.14.4" "Comment"
* method -> "NL-CM:12.14.5" "HeadCircumferenceMeasuringMethod"
