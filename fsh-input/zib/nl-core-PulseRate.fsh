Profile: NlcorePulseRate
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-PulseRate
Id: nl-core-PulseRate
Title: "nl core PulseRate"
* insert ProfileMetadata(nl-core-PulseRate)
* insert Purpose(PulseRate, 3.3, Observation)

* note ..1
* hasMember[pulseRateValue] ..1
* hasMember[pulseRegularity] ..1

// Short, alias, definition and comment texts
* ^description = "The element contains the value of the pulse rate measured. The pulse rate is expressed in the number of tangible pulsations of an artery per minute, usually the a. radialis, a. carotis or a. femoralis."
* .
  * ^alias[+] = "nl-core-PulseRate"
  * ^comment = """
    **HL7 Vital Signs compatibility**
    
    Although this profile represents a vital signs measurement, it is *not* directly based on a HL7 Vital Signs profile because there isn't a direct counterpart in HL7 Vital Signs. Moreover the HL7 Vital Signs profiles contain two issues in their current version that prevent them from being used for the exchange of zibs (see below). However, an effort has been made to make this profile consistent with the (other) [HL7 Vital Signs profiles](https://www.hl7.org/fhir/R4/observation-vitalsigns.html), since the zib PulseRate is considered to be a vital sign. In particular it is closely related to the zib HeartRate, the profile of which is derived from its HL7 Vital Signs counterpart.
    
    **Differences with the HL7 Vital Signs profiles**
    
    * The _required_ terminology binding on `Observation.component` to the [Vital Signs Units](http://hl7.org/fhir/ValueSet/ucum-vitals-common) dataset makes it impossible to use `.component` for representing anything else than a Quantity (like a CodeableConcept or a boolean). This binding has therefore been omitted in the current profile.
    * The `mustSupport` = _true_ flag found on numerous elements isn't further specified in the HL7 Vital Signs IG, as is required by FHIR. This flag has therefore been omitted from the current profile.
    * The target restriction on `Observation.hasMember` and `Observation.derivedFrom` to a HL7 Vital Signs profile cannot be fulfilled. This restriction has therefore been omitted from the current profile.
    
    It might happen that for some concepts, the zib uses a different (but compatible) way than what is recommended by the [HL7 Vital Signs IG](http://hl7.org/fhir/r4/observation-vitalsigns.html). This is described in the comments for these concepts. There are also some differences in the profiling approach between the current profile and the HL7 profiles, like the use of patterns rather than slices with fixed systems and codes to enforce the inclusion of some coding (for reasons of consistency with other zib profiles, the former approach has been chosen here). Apart from what is mentioned above, constraints, invariants and terminology bindings have been copied from the HL7 Vital Signs profiles, but some textual descriptions have been omitted.
    
    Note: No equivalent for the HL7 Vital Signs base profile has been created to implement the zib profiles. The profile for this zib has been modelled taking the other HL7 Vital Signs profiles into consideration.
    
    **Multiple profiles to represent the zib**
    
    Several concepts of zib PulseRate are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember`:
    
    * PulseRateValue (NL-CM:12.7.2): [nl-core-PulseRate.PulseRateValue](http://nictiz.nl/fhir/StructureDefinition/nl-core-PulseRate.PulseRateValue)
    * PulseRegularity (NL-CM:12.7.5): [nl-core-PulseRate.PulseRegularity](http://nictiz.nl/fhir/StructureDefinition/nl-core-PulseRate.PulseRegularity)
    """
