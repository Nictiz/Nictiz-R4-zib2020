Profile: PatternVitalSigns
Parent: Observation
Id: pattern-VitalSigns
Title: "pattern VitalSigns"
* insert ProfileMetadata(pattern-VitalSigns)
* ^purpose = "Regarding the HL7 Vital Signs profile, the spec for the Observation resource states:

> If implementations use this Resource when expressing the profile-specific concepts as structured data, they SHALL conform to the following profiles:

However, the HL7 Vital Signs profile imposes two issues that make it impossible to implement zib profiles for the relevant vital signs measurements directly onto it (see the comment on the profle root). To circumvent this problem, the zib profiles aim to be as compatible as possible without directly using the HL7 Vital Signs profile or one of its derivations. This pattern profile ensures this is done in a consistent way. It is not meant to be instantiated directly."

* . obeys vs-2
* category insert Discriminator(pattern, $this)
* category contains
    VSCat 0..1
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* subject only Reference(Patient)
* effective[x]
  * obeys vs-1
  * ^condition[+] = vs-1
* effective[x] only dateTime
* value[x] ^condition[+] = vs-2
* dataAbsentReason ^condition[+] = vs-2
* component obeys vs-3
* component.value[x] ^condition[+] = vs-3
* component.dataAbsentReason ^condition[+] = vs-3

// Short, alias, definition and comment texts
* ^description = "A pattern profile for creating (mostly) HL7 Vital Signs compatible zib profiles."
* . ^comment = """
    **HL7 Vital Signs compatibility**
    
    Although this profile represents a vital signs measurement, it is *not* directly based on the HL7 Vital Signs profile because of two issues in its current version that prevent it from being used for the exchange of zibs (see below). However, an effort has been made to make this profile functionally equivalent to (a profile derived from) the [HL7 Vital Signs [...] profile](http://hl7.org/fhir/StructureDefinition/[...]). Instances for both profiles should be highly compatible.
    
    This means that it should be possible to mostly validate an instance for this profile against the HL7 Vital Signs counterpart, _except_ for references on `Observation.hasMember` and `Observation.derivedFrom`. The base HL7 Vital Signs profile restricts the targets of these element to itself, which is a requirement that can never be satisfied for instances of profiles that are not directly derived from it.
    
    Please note that this profile implements the zib and can therefore be more restricted than its HL7 counterpart. It should be regarded as a derived profile rather than a direct recreation of the HL7 version.
    
    **Differences with the HL7 Vital Signs counterpart**
    
    * The _required_ terminology binding on `Observation.component` to the [Vital Signs Units](http://hl7.org/fhir/ValueSet/ucum-vitals-common) dataset makes it impossible to use `.component` for representing anything else than a Quantity (like a CodeableConcept or a boolean). This binding has therefore been omitted in the current profile.
    * The `mustSupport` = _true_ flag found on numerous elements isn't further specified in the HL7 Vital Signs IG, as is required by FHIR. This flag has therefore been omitted from the current profile.
    * The target restriction on `Observation.hasMember` and `Observation.derivedFrom` to the HL7 Vital Signs profile cannot be fulfilled. This restriction has therefore been omitted from the current profile.
    
    It might happen that for some concepts, the zib uses a different (but compatible) way than what is recommended by the [HL7 Vital Signs IG](http://hl7.org/fhir/r4/observation-vitalsigns.html). This is described in the comments for these concepts. There are also some differences in the profiling approach between the current and the HL7 profile, like the use of patterns rather than slices with fixed systems and codes to enforce the inclusion of some coding (for reasons of consistency with other zib profiles, the former approach has been chosen here). Apart from what is mentioned above, constraints, invariants and terminology bindings have been copied from the HL7 Vital Signs profile, but some textual descriptions have been omitted.
    
    Note: No equivalent for the HL7 Vital Signs base profile has been created to implement the zib profiles. The profile for this zib has been directly modelled onto its HL7 Vital Signs counterpart.
    """

Invariant: vs-2
Description: "If there is no component or hasMember element then either a value[x] or a data absent reason must be present."
Severity: #error
Expression: "(component.empty() and hasMember.empty()) implies (dataAbsentReason.exists() or value.exists())"

Invariant: vs-1
Description: "if Observation.effective[x] is dateTime and has a value then that value shall be precise to the day"
Severity: #error
Expression: "($this as dateTime).toString().length() >= 8"

Invariant: vs-3
Description: "If there is no a value a data absent reason must be present"
Severity: #error
Expression: "value.exists() or dataAbsentReason.exists()"
