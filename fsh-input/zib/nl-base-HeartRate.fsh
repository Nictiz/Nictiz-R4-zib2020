Profile: NlbaseHeartRate
Parent: http://nictiz.nl/fhir/StructureDefinition/pattern-VitalSigns
Id: nl-base-HeartRate
Title: "nl base HeartRate"
* insert ProfileMetadata(nl-base-HeartRate)
* insert Purpose(HeartRate, 3.4, Observation)

* code = http://loinc.org#8867-4
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] only Quantity
* value[x] = http://unitsofmeasure.org#/min
* interpretation insert Discriminator(value, $this)
* interpretation contains
    interpretationHeartRate 0..1
* interpretation[interpretationHeartRate] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.3.3--20200901000000 (extensible)
* method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.3.2--20200901000000 (preferred)
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    heartbeatRegularity 0..1
* hasMember[heartbeatRegularity] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-HeartRate.HeartbeatRegularity)

// Short, alias, definition and comment texts
* ^description = "The heart rate is the number of heartbeats per minute."
* .
  * ^short = "HeartRate"
  * ^alias[+] = "Hartfrequentie"
  * ^comment = """
    **HL7 Vital Signs compatibility**
    
    Although this profile represents a vital signs measurement, it is *not* directly based on the HL7 Vital Signs profile because of two issues in its current version that prevent it from being used for the exchange of zibs (see below). However, an effort has been made to make this profile functionally equivalent to (a profile derived from) the [HL7 Vital Signs HeartRate profile](http://hl7.org/fhir/StructureDefinition/heartrate). Instances for both profiles should be highly compatible.
    
    This means that it should be possible to mostly validate an instance for this profile against the HL7 Vital Signs counterpart, _except_ for references on `Observation.hasMember` and `Observation.derivedFrom`. The base HL7 Vital Signs profile restricts the targets of these element to itself, which is a requirement that can never be satisfied for instances of profiles that are not directly derived from it.
    
    Please note that this profile implements the zib and can therefore be more restricted than its HL7 counterpart. It should be regarded as a derived profile rather than a direct recreation of the HL7 version.
    
    **Differences with the HL7 Vital Signs counterpart**
    
    * The _required_ terminology binding on `Observation.component` to the [Vital Signs Units](http://hl7.org/fhir/ValueSet/ucum-vitals-common) dataset makes it impossible to use `.component` for representing anything else than a Quantity (like a CodeableConcept or a boolean). This binding has therefore been omitted in the current profile.
    * The `mustSupport` = _true_ flag found on numerous elements isn't further specified in the HL7 Vital Signs IG, as is required by FHIR. This flag has therefore been omitted from the current profile.
    * The target restriction on `Observation.hasMember` and `Observation.derivedFrom` to the HL7 Vital Signs profile cannot be fulfilled. This restriction has therefore been omitted from the current profile.
    
    It might happen that for some concepts, the zib uses a different (but compatible) way than what is recommended by the [HL7 Vital Signs IG](http://hl7.org/fhir/r4/observation-vitalsigns.html). This is described in the comments for these concepts. There are also some differences in the profiling approach between the current and the HL7 profile, like the use of patterns rather than slices with fixed systems and codes to enforce the inclusion of some coding (for reasons of consistency with other zib profiles, the former approach has been chosen here). Apart from what is mentioned above, constraints, invariants and terminology bindings have been copied from the HL7 Vital Signs profile, but some textual descriptions have been omitted.
    
    Note: No equivalent for the HL7 Vital Signs base profile has been created to implement the zib profiles. The profile for this zib has been directly modelled onto its HL7 Vital Signs counterpart.
    
    Several concepts of zib HeartRate are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    **Multiple profiles to represent the zib**
    The HeartbeatRegularity concept (NL-CM:12.3.5) is represented using distinct Observation resources, using profile [nl-base-HeartRate.HeartbeatRegularity](http://nictiz.nl/fhir/StructureDefinition/nl-base-HeartRate.HeartbeatRegularity). It is referenced from this resource using `Observation.hasMember`.
    """
* effectiveDateTime
  * ^short = "HeartRateDateTime"
  * ^alias[+] = "HartfrequentieDatumTijd"
  * ^definition = "Date and time of the heart rate measurement."
* value[x]
  * ^short = "HeartRateValue"
  * ^alias[+] = "HartfrequentieWaarde"
  * ^definition = "The heart rate measured as the number of heartbeats per minute."
* interpretation[interpretationHeartRate]
  * ^short = "InterpretationHeartRate"
  * ^alias[+] = "InterpretatieFrequentie"
  * ^definition = "Interpretation heart rate"
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on any problems or factors that may influence the measurement."
* method
  * ^short = "HeartRateMeasurementMethod"
  * ^alias[+] = "HartslagMeetMethode"
  * ^definition = "The method used to count and observe the heart rate."
* hasMember[heartbeatRegularity] ^definition = "The HeartbeatRegularity concept (NL-CM:12.3.5) of zib HeartRate, represented as a distinct Observation resource."

Mapping: NlbaseHeartRate-to-zib-heartrate-v3.4-2020EN
Id: zib-heartrate-v3.4-2020EN
Title: "zib HeartRate-v3.4(2020EN)"
Source: NlbaseHeartRate
Target: "https://zibs.nl/wiki/HeartRate-v3.4(2020EN)"
*  -> "NL-CM:12.3.1" "HeartRate"
* effectiveDateTime -> "NL-CM:12.3.4" "HeartRateDateTime"
* value[x] -> "NL-CM:12.3.2" "HeartRateValue"
* interpretation[interpretationHeartRate] -> "NL-CM:12.3.7" "InterpretationHeartRate"
* note.text -> "NL-CM:12.3.3" "Comment"
* method -> "NL-CM:12.3.6" "HeartRateMeasurementMethod"
