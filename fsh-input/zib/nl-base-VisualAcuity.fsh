Profile: NlbaseVisualAcuity
Parent: Observation
Id: nl-base-VisualAcuity
Title: "nl base VisualAcuity"
* insert ProfileMetadata(nl-base-VisualAcuity)
* insert Purpose(VisualAcuity, 1.0, Observation)

* code = http://snomed.info/sct#260246004
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueQuantity only Quantity
* valueQuantity = '1'
* bodySite only CodeableConcept
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AnatomicalLocation
* bodySite = http://snomed.info/sct#81745001
* bodySite.extension[laterality] 0..
* device only Reference(http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/DeviceMetric or http://nictiz.nl/fhir/StructureDefinition/nl-base-VisualAcuity.VisualAcuityMeasurementDevice)
* component insert Discriminator(value, code)
* component contains
    visualAcuityType 0..1 and
    visualAcuityMeasurementChart 0..1 and
    distanceFromChart 0..1
* component[visualAcuityType].code = http://snomed.info/sct#16830007
* component[visualAcuityType].value[x] only CodeableConcept
* component[visualAcuityType].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.19.2--20200901000000 (preferred)
* component[visualAcuityMeasurementChart].code = http://snomed.info/sct#363691001
* component[visualAcuityMeasurementChart].value[x] only CodeableConcept
* component[visualAcuityMeasurementChart].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.19.3--20200901000000 (preferred)
* component[distanceFromChart].code = http://snomed.info/sct#152731000146106
* component[distanceFromChart].value[x] only Quantity
* component[distanceFromChart].value[x] = 'm'

// Short, alias, definition and comment texts
* ^description = "Visual acuity is a measurement of sharpness of vision. It is a measure of the smallest details that someone can still distinguish."
* .
  * ^short = "VisualAcuity"
  * ^alias[+] = "Visus"
* effectiveDateTime
  * ^short = "VisualAcuityDateTime"
  * ^alias[+] = "VisusDatumTijd"
  * ^definition = "The date and time when the visual acuity was measured."
* valueQuantity
  * ^short = "DecimalVisualAqcuity"
  * ^alias[+] = "DecimaleVisusWaarde"
  * ^definition = "The measured decimal visual acuity."
  * ^comment = "Visual acuity is measured a dimensionless decimal. Therefore, a pattern with unit '1' is defined on `.valueQuantity`."
* bodySite
  * ^definition = "The laterality of the eye of which the visual acuity has been measured."
  * ^comment = "The code on this element is added to make explicit what is implicit in the zib. See [ZIB-1442](https://bits.nictiz.nl/browse/ZIB-1442) for details."
* bodySite.extension[laterality].value[x]
  * ^short = "AnatomicalLocation"
  * ^alias[+] = "AnatomischeLocatie"
  * ^definition = "The laterality of the eye of which the visual acuity has been measured."
* component[visualAcuityType].value[x]
  * ^short = "VisualAcuityType"
  * ^alias[+] = "VisusMetingType"
  * ^definition = "Type of visual acuity measurement."
* component[visualAcuityMeasurementChart].value[x]
  * ^short = "VisualAcuityMeasurementChart"
  * ^alias[+] = "VisusMetingKaart"
  * ^definition = "The type of chart used for the visual acuity measurement."
* component[distanceFromChart].code ^comment = "This code aligns with the future version of this zib. See [ZIB-1441](https://bits.nictiz.nl/browse/ZIB-1441)."
* component[distanceFromChart].value[x]
  * ^short = "DistanceFromChart"
  * ^alias[+] = "AfstandTotKaart"
  * ^definition = "Distance to the chart in meters"

Mapping: NlbaseVisualAcuity-to-zib-visualacuity-v1.0-2020EN
Id: zib-visualacuity-v1.0-2020EN
Title: "zib VisualAcuity-v1.0(2020EN)"
Source: NlbaseVisualAcuity
Target: "https://zibs.nl/wiki/VisualAcuity-v1.0(2020EN)"
*  -> "NL-CM:12.19.1" "VisualAcuity"
* effectiveDateTime -> "NL-CM:12.19.4" "VisualAcuityDateTime"
* valueQuantity -> "NL-CM:12.19.11" "VisualAcuity"
* bodySite.extension[laterality].value[x] -> "NL-CM:12.19.5" "AnatomicalLocation"
* component[visualAcuityType].value[x] -> "NL-CM:12.19.2" "VisualAcuityType"
* component[visualAcuityMeasurementChart].value[x] -> "NL-CM:12.19.7" "VisualAcuityMeasurementChart"
* component[distanceFromChart].value[x] -> "NL-CM:12.19.8" "DistanceFromChart"
