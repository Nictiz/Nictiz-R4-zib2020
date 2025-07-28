Profile: NlbaseVisualAcuityVisualAcuityMeasurementDevice
Parent: Device
Id: nl-base-VisualAcuity.VisualAcuityMeasurementDevice
Title: "nl base VisualAcuity.VisualAcuityMeasurementDevice"
* insert ProfileMetadata(nl-base-VisualAcuity.VisualAcuityMeasurementDevice)
* ^purpose = "This Device resource represents the VisualAcuityMeasurementDevice concept (NL-CM:12.19.6) of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) VisualAcuity v1.0 (2020)](https://zibs.nl/wiki/VisualAcuity-v1.0(2020EN))."

* type from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.19.4--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "The device used measuring the visual acuity."
* type
  * ^short = "VisualAcuityMeasurementDevice"
  * ^alias[+] = "VisusMeetHulpmiddel"
  * ^definition = "The device used measuring the visual acuity."

Mapping: NlbaseVisualAcuityVisualAcuityMeasurementDevice-to-zib-visualacuity-v1.0-2020EN
Id: zib-visualacuity-v1.0-2020EN
Title: "zib VisualAcuity-v1.0(2020EN)"
Source: NlbaseVisualAcuityVisualAcuityMeasurementDevice
Target: "https://zibs.nl/wiki/VisualAcuity-v1.0(2020EN)"
* type -> "NL-CM:12.19.6" "VisualAcuityMeasurementDevice"
