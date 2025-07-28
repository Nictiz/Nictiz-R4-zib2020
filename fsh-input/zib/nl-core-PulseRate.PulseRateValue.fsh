Profile: NlcorePulseRatePulseRateValue
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-PulseRate.PulseRateValue
Id: nl-core-PulseRate.PulseRateValue
Title: "nl core PulseRate.PulseRateValue"
* insert ProfileMetadata(nl-core-PulseRate.PulseRateValue)
* ^purpose = "This Observation resource represents the PulseRateValue concept (NL-CM:12.7.5) of Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) PulseRate v3.3 (2020)](https://zibs.nl/wiki/PulseRate-v3.3(2020EN))."


// Short, alias, definition and comment texts
* ^description = "The value of the pulse rate measured. The pulse rate is expressed in the number of tangible pulsations of an artery per minute, usually the a. radialis, a. carotis or a. femoralis."
* .
  * ^alias[+] = "nl-core-PulseRate.PulseRateValue"
  * ^comment = """
    **HL7 Vital Signs compatibility**
    
    Although this profile represents a vital signs measurement, it is *not* directly based on a HL7 Vital Signs profile because there isn't a direct counterpart in HL7 Vital Signs. Moreover the HL7 Vital Signs profiles contain two issues in their current version that prevent them from being used for the exchange of zibs (see below). However, an effort has been made to make this profile consistent with the (other) [HL7 Vital Signs profiles](https://www.hl7.org/fhir/R4/observation-vitalsigns.html), since the zib PulseRate is considered to be a vital sign. Instances for both profiles should be highly compatible.
    
    This means that it should be possible to mostly validate an instance for this profile against the HL7 Vital Signs counterpart, _except_ for references on `Observation.hasMember` and `Observation.derivedFrom`. The base HL7 Vital Signs profile restricts the targets of these element to itself, which is a requirement that can never be satisfied for instances of profiles that are not directly derived from it.
    
    Please note that this profile implements the zib and can therefore be more restricted than its HL7 counterpart. It should be regarded as a derived profile rather than a direct recreation of the HL7 version.
    
    **Differences with the HL7 Vital Signs counterpart**
    
    * The _required_ terminology binding on `Observation.component` to the [Vital Signs Units](http://hl7.org/fhir/ValueSet/ucum-vitals-common) dataset makes it impossible to use `.component` for representing anything else than a Quantity (like a CodeableConcept or a boolean). This binding has therefore been omitted in the current profile.
    * The `mustSupport` = _true_ flag found on numerous elements isn't further specified in the HL7 Vital Signs IG, as is required by FHIR. This flag has therefore been omitted from the current profile.
    * The target restriction on `Observation.hasMember` and `Observation.derivedFrom` to the HL7 Vital Signs profile cannot be fulfilled. This restriction has therefore been omitted from the current profile.
    
    It might happen that for some concepts, the zib uses a different (but compatible) way than what is recommended by the [HL7 Vital Signs IG](http://hl7.org/fhir/r4/observation-vitalsigns.html). This is described in the comments for these concepts. There are also some differences in the profiling approach between the current and the HL7 profile, like the use of patterns rather than slices with fixed systems and codes to enforce the inclusion of some coding (for reasons of consistency with other zib profiles, the former approach has been chosen here). Apart from what is mentioned above, constraints, invariants and terminology bindings have been copied from the HL7 Vital Signs profile, but some textual descriptions have been omitted.
    
    Note: No equivalent for the HL7 Vital Signs base profile has been created to implement the zib profiles. The profile for this zib has been directly modelled onto its HL7 Vital Signs counterpart.
    
    **Multiple profiles to represent the zib**
    
    This Observation resource represents the PulseRateValue concept (NL-CM:12.7.2) of zib PulseRate. It can be used together with the [nl-core-PulseRate](http://nictiz.nl/fhir/StructureDefinition/nl-core-PulseRate) profile on the Observation resource, which groups references to the current and other resources on `Observation.hasMember`.
    """
