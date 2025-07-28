Profile: NlbaseBloodPressure
Parent: http://nictiz.nl/fhir/StructureDefinition/pattern-VitalSigns
Id: nl-base-BloodPressure
Title: "nl base BloodPressure"
* insert ProfileMetadata(nl-base-BloodPressure)
* insert Purpose(BloodPressure, 3.2.1, Observation)

* extension contains
    http://hl7.org/fhir/StructureDefinition/observation-bodyPosition named position 0..*
* extension[position].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.4.5--20200901000000 (preferred)
* code = http://loinc.org#85354-9
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* bodySite from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.4.4--20200901000000 (preferred)
* method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.4.1--20200901000000 (preferred)
* component insert Discriminator(value, code)
* component contains
    SystolicBP 0..1 and
    DiastolicBP 0..1 and
    diastolicEndpoint 0..1 and
    cuffType 0..1 and
    averageBloodPressure 0..1
* component[SystolicBP].code = http://loinc.org#8480-6
* component[SystolicBP].value[x] only Quantity
* component[SystolicBP].value[x] = http://unitsofmeasure.org#mm[Hg]
* component[DiastolicBP].code = http://loinc.org#8462-4
* component[DiastolicBP].value[x] only Quantity
* component[DiastolicBP].value[x] = http://unitsofmeasure.org#mm[Hg]
* component[diastolicEndpoint].code = http://snomed.info/sct#85549003
* component[diastolicEndpoint].value[x] only CodeableConcept
* component[diastolicEndpoint].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.4.2--20200901000000 (preferred)
* component[cuffType].code = http://snomed.info/sct#70665002
* component[cuffType].value[x] only CodeableConcept
* component[cuffType].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.4.3--20200901000000 (preferred)
* component[averageBloodPressure].code = http://snomed.info/sct#6797001
* component[averageBloodPressure].value[x] only Quantity
* component[averageBloodPressure].value[x] = http://unitsofmeasure.org#mm[Hg]

// Short, alias, definition and comment texts
* ^description = "The blood pressure is a parameter for determining the condition of the blood circulation and is expressed in systolic and diastolic pressure in mmHg."
* .
  * ^short = "BloodPressure"
  * ^alias[+] = "Bloeddruk"
  * ^comment = """
    **HL7 Vital Signs compatibility**
    
    Although this profile represents a vital signs measurement, it is *not* directly based on the HL7 Vital Signs profile because of two issues in its current version that prevent it from being used for the exchange of zibs (see below). However, an effort has been made to make this profile functionally equivalent to (a profile derived from) the [HL7 Vital Signs BP profile](http://hl7.org/fhir/StructureDefinition/bp). Instances for both profiles should be highly compatible.
    
    This means that it should be possible to mostly validate an instance for this profile against the HL7 Vital Signs counterpart, _except_ for references on `Observation.hasMember` and `Observation.derivedFrom`. The base HL7 Vital Signs profile restricts the targets of these element to itself, which is a requirement that can never be satisfied for instances of profiles that are not directly derived from it.
    
    Please note that this profile implements the zib and can therefore be more restricted than its HL7 counterpart. It should be regarded as a derived profile rather than a direct recreation of the HL7 version.
    
    **Differences with the HL7 Vital Signs counterpart**
    
    * The _required_ terminology binding on `Observation.component` to the [Vital Signs Units](http://hl7.org/fhir/ValueSet/ucum-vitals-common) dataset makes it impossible to use `.component` for representing anything else than a Quantity (like a CodeableConcept or a boolean). This binding has therefore been omitted in the current profile.
    * The `mustSupport` = _true_ flag found on numerous elements isn't further specified in the HL7 Vital Signs IG, as is required by FHIR. This flag has therefore been omitted from the current profile.
    * The target restriction on `Observation.hasMember` and `Observation.derivedFrom` to the HL7 Vital Signs profile cannot be fulfilled. This restriction has therefore been omitted from the current profile.
    
    It might happen that for some concepts, the zib uses a different (but compatible) way than what is recommended by the [HL7 Vital Signs IG](http://hl7.org/fhir/r4/observation-vitalsigns.html). This is described in the comments for these concepts. There are also some differences in the profiling approach between the current and the HL7 profile, like the use of patterns rather than slices with fixed systems and codes to enforce the inclusion of some coding (for reasons of consistency with other zib profiles, the former approach has been chosen here). Apart from what is mentioned above, constraints, invariants and terminology bindings have been copied from the HL7 Vital Signs profile, but some textual descriptions have been omitted.
    
    Note: No equivalent for the HL7 Vital Signs base profile has been created to implement the zib profiles. The profile for this zib has been directly modelled onto its HL7 Vital Signs counterpart.
    """
* extension[position].value[x]
  * ^short = "Position"
  * ^alias[+] = "Houding"
  * ^definition = "The position of the patient when the blood pressure was measured."
* effectiveDateTime
  * ^short = "BloodPressureDateTime"
  * ^alias[+] = "BloeddrukDatumTijd"
  * ^definition = "The date and time at which these blood pressure values were measured."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comments on the measured blood pressure. Here, an explanation could be given, for example, of circumstances that may have influenced the patient’s blood pressure, such as pain, stress, exertion and sleep/wake cycles."
* bodySite
  * ^short = "MeasuringLocation"
  * ^alias[+] = "MeetLocatie"
  * ^definition = "Anatomical location where the blood pressure was measured."
  * ^comment = "The HL7 Vital Signs IG suggests to use an additional observation coded with LOINC _41904-4_ (Blood pressure site) for this information. However, `Observation.bodySite` is deemed a more appropriate approach in this profile."
* method
  * ^short = "MeasuringMethod"
  * ^alias[+] = "Meetmethode"
  * ^definition = "The type of method used to measure blood pressure."
  * ^comment = "The HL7 Vital Signs IG suggests to use an additional observation coded with LOINC _8357-6_ (Blood pressure method) for this information. However, `Observation.method` is deemed a more appropriate approach in this profile."
* component[SystolicBP].value[x]
  * ^short = "SystolicBloodPressure"
  * ^alias[+] = "SystolischeBloeddruk"
  * ^definition = "The highest (peak) systematic arterial blood pressure - measured in the contraction stage or systole of the cardiac cycle."
* component[DiastolicBP].value[x]
  * ^short = "DiastolicBloodPressure"
  * ^alias[+] = "DiastolischeBloeddruk"
  * ^definition = "The lowest systematic arterial blood pressure - measured in the relaxation stage or diastole of the cardiac cycle."
* component[diastolicEndpoint].value[x]
  * ^short = "DiastolicEndpoint"
  * ^alias[+] = "DiastolischEindpunt"
  * ^definition = "Registration of the Korotkoff sound used to measure diastolic pressure with the auscultatory method."
* component[cuffType].code ^comment = "LOINC code _8358-4_ (Blood pressure device cuff size), which is the suggested code by the HL7 Vital Signs IG for this concept, may be used here in addition to SNOMED code _70665002_."
* component[cuffType].value[x]
  * ^short = "CuffType"
  * ^alias[+] = "ManchetType"
  * ^definition = "The size of the cuff used in the measurement."
* component[averageBloodPressure].code ^comment = "LOINC code _8478-0_ (Mean blood pressure) may be used here as well, as suggested by the HL7 Vital Signs IG."
* component[averageBloodPressure].value[x]
  * ^short = "AverageBloodPressure"
  * ^alias[+] = "GemiddeldeBloeddruk"
  * ^definition = """
    Average blood pressure during one cycle of the heart contracting and relaxing.
    
    Estimated based on systolic and diastolic blood pressure. This estimate is unreliable in cases of circulatory disorders. This value can only be reliably determined when invasive blood pressure is measured.
    """

Mapping: NlbaseBloodPressure-to-zib-bloodpressure-v3.2.1-2020EN
Id: zib-bloodpressure-v3.2.1-2020EN
Title: "zib BloodPressure-v3.2.1(2020EN)"
Source: NlbaseBloodPressure
Target: "https://zibs.nl/wiki/BloodPressure-v3.2.1(2020EN)"
*  -> "NL-CM:12.4.1" "BloodPressure"
* extension[position].value[x] -> "NL-CM:12.4.11" "Position"
* effectiveDateTime -> "NL-CM:12.4.5" "BloodPressureDateTime"
* note.text -> "NL-CM:12.4.6" "Comment"
* bodySite -> "NL-CM:12.4.10" "MeasuringLocation"
* method -> "NL-CM:12.4.7" "MeasuringMethod"
* component[SystolicBP].value[x] -> "NL-CM:12.4.2" "SystolicBloodPressure"
* component[DiastolicBP].value[x] -> "NL-CM:12.4.3" "DiastolicBloodPressure"
* component[diastolicEndpoint].value[x] -> "NL-CM:12.4.8" "DiastolicEndpoint"
* component[cuffType].value[x] -> "NL-CM:12.4.9" "CuffType"
* component[averageBloodPressure].value[x] -> "NL-CM:12.4.4" "AverageBloodPressure"
