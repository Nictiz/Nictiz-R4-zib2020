Profile: NlbaseBodyTemperature
Parent: http://nictiz.nl/fhir/StructureDefinition/pattern-VitalSigns
Id: nl-base-BodyTemperature
Title: "nl base BodyTemperature"
* insert ProfileMetadata(nl-base-BodyTemperature)
* insert Purpose(BodyTemperature, 3.1.2, Observation)

* code.coding insert Discriminator(value, $this)
* code.coding contains
    BodyTempCode 0..1 and
    temperatureType 0..1
* code.coding[temperatureType] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.6.1--20200901000000 (preferred)
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] only Quantity
* value[x] = http://unitsofmeasure.org#Cel

// Short, alias, definition and comment texts
* ^description = "Measuring and documenting the body temperature of a person as a surrogate for a person’s central body temperature (the highest temperature at the centre of the torso)"
* .
  * ^short = "BodyTemperature"
  * ^alias[+] = "Lichaamstemperatuur"
  * ^comment = """
    **HL7 Vital Signs compatibility**
    
    Although this profile represents a vital signs measurement, it is *not* directly based on the HL7 Vital Signs profile because of two issues in its current version that prevent it from being used for the exchange of zibs (see below). However, an effort has been made to make this profile functionally equivalent to (a profile derived from) the [HL7 Vital Signs BodyTemp profile](http://hl7.org/fhir/StructureDefinition/bodytemp). Instances for both profiles should be highly compatible.
    
    This means that it should be possible to mostly validate an instance for this profile against the HL7 Vital Signs counterpart, _except_ for references on `Observation.hasMember` and `Observation.derivedFrom`. The base HL7 Vital Signs profile restricts the targets of these element to itself, which is a requirement that can never be satisfied for instances of profiles that are not directly derived from it.
    
    Please note that this profile implements the zib and can therefore be more restricted than its HL7 counterpart. It should be regarded as a derived profile rather than a direct recreation of the HL7 version.
    
    **Differences with the HL7 Vital Signs counterpart**
    
    * The _required_ terminology binding on `Observation.component` to the [Vital Signs Units](http://hl7.org/fhir/ValueSet/ucum-vitals-common) dataset makes it impossible to use `.component` for representing anything else than a Quantity (like a CodeableConcept or a boolean). This binding has therefore been omitted in the current profile.
    * The `mustSupport` = _true_ flag found on numerous elements isn't further specified in the HL7 Vital Signs IG, as is required by FHIR. This flag has therefore been omitted from the current profile.
    * The target restriction on `Observation.hasMember` and `Observation.derivedFrom` to the HL7 Vital Signs profile cannot be fulfilled. This restriction has therefore been omitted from the current profile.
    
    It might happen that for some concepts, the zib uses a different (but compatible) way than what is recommended by the [HL7 Vital Signs IG](http://hl7.org/fhir/r4/observation-vitalsigns.html). This is described in the comments for these concepts. There are also some differences in the profiling approach between the current and the HL7 profile, like the use of patterns rather than slices with fixed systems and codes to enforce the inclusion of some coding (for reasons of consistency with other zib profiles, the former approach has been chosen here). Apart from what is mentioned above, constraints, invariants and terminology bindings have been copied from the HL7 Vital Signs profile, but some textual descriptions have been omitted.
    
    Note: No equivalent for the HL7 Vital Signs base profile has been created to implement the zib profiles. The profile for this zib has been directly modelled onto its HL7 Vital Signs counterpart.
    """
* code.coding[temperatureType]
  * ^short = "TemperatureType"
  * ^alias[+] = "TemperatuurType"
  * ^definition = "The TemperatureType indicates the way and place the measurement (temperature) has been performed."
  * ^comment = "The use of an additional Observation coding to further specify the body temperature measurement type differs from the recommendation by the HL7 Vital Signs IG to communicate this kind of information. The HL7 Vital Signs IG suggests that additional observations may be used for explicitly defining the temperature measurement site and the type of temperature device. Implementers can still use this mechanism if needed; however the HL7 Vital Signs IG doesn't specify ValueSets for these concepts so no mapping to the zib concept can be made."
* effectiveDateTime
  * ^short = "TemperatureDateTime"
  * ^alias[+] = "TemperatuurDatumTijd"
  * ^definition = "Date and time of measurement."
* value[x]
  * ^short = "TemperatureValue"
  * ^alias[+] = "TemperatuurWaarde"
  * ^definition = "Body temperature is the temperature inside the body, measured in °C (degrees Celsius). The measurement method must be specified for a correct interpretation of the measurement value."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comments or details that may be of importance in interpreting the measurement value."

Mapping: NlbaseBodyTemperature-to-zib-bodytemperature-v3.1.2-2020EN
Id: zib-bodytemperature-v3.1.2-2020EN
Title: "zib BodyTemperature-v3.1.2(2020EN)"
Source: NlbaseBodyTemperature
Target: "https://zibs.nl/wiki/BodyTemperature-v3.1.2(2020EN)"
*  -> "NL-CM:12.6.1" "BodyTemperature"
* code.coding[temperatureType] -> "NL-CM:12.6.5" "TemperatureType"
* effectiveDateTime -> "NL-CM:12.6.4" "TemperatureDateTime"
* value[x] -> "NL-CM:12.6.2" "TemperatureValue"
* note.text -> "NL-CM:12.6.3" "Comment"
