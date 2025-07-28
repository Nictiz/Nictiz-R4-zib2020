Profile: NlbaseRefraction
Parent: Observation
Id: nl-base-Refraction
Title: "nl base Refraction"
* insert ProfileMetadata(nl-base-Refraction)
* insert Purpose(Refraction, 1.0, Observation)

* . obeys zib-Refraction-1 and zib-Refraction-2 and zib-Refraction-3 and zib-Refraction-4 and zib-Refraction-5
* code = http://snomed.info/sct#251718005
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* bodySite only CodeableConcept
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-base-AnatomicalLocation
* bodySite = http://snomed.info/sct#81745001
* bodySite.extension[laterality] 0..
* bodySite.extension[laterality].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.20.2--20200901000000 (preferred)
* method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.20.1--20200901000000 (preferred)
* component insert Discriminator(value, code)
* component contains
    cylindricalRefractionValue 0..1 and
    cylindricalRefractionAxis 0..1 and
    prismValue 0..1 and
    prismBase 0..1 and
    sphericalRefractionValue 0..1 and
    sphericalEquivalent 0..1 and
    readAddition 0..1
* component[cylindricalRefractionValue]
  * ^condition[+] = zib-Refraction-1
  * ^condition[+] = zib-Refraction-2
* component[cylindricalRefractionValue].code
  * ^condition[+] = zib-Refraction-1
  * ^condition[+] = zib-Refraction-2
* component[cylindricalRefractionValue].code = http://snomed.info/sct#251797004
* component[cylindricalRefractionValue].value[x]
  * ^condition[+] = zib-Refraction-1
  * ^condition[+] = zib-Refraction-2
* component[cylindricalRefractionValue].value[x] only Quantity
* component[cylindricalRefractionValue].value[x] = '[diop]'
* component[cylindricalRefractionAxis]
  * ^condition[+] = zib-Refraction-1
  * ^condition[+] = zib-Refraction-2
* component[cylindricalRefractionAxis].code
  * ^condition[+] = zib-Refraction-1
  * ^condition[+] = zib-Refraction-2
* component[cylindricalRefractionAxis].code = http://snomed.info/sct#251799001
* component[cylindricalRefractionAxis].value[x]
  * ^condition[+] = zib-Refraction-1
  * ^condition[+] = zib-Refraction-2
* component[cylindricalRefractionAxis].value[x] only Quantity
* component[cylindricalRefractionAxis].value[x] = 'deg'
* component[prismValue]
  * ^condition[+] = zib-Refraction-3
  * ^condition[+] = zib-Refraction-4
* component[prismValue].code
  * ^condition[+] = zib-Refraction-3
  * ^condition[+] = zib-Refraction-4
* component[prismValue].code = http://snomed.info/sct#251762001
* component[prismValue].value[x]
  * ^condition[+] = zib-Refraction-3
  * ^condition[+] = zib-Refraction-4
* component[prismValue].value[x] only Quantity
* component[prismValue].value[x] = '[p'diop]'
* component[prismBase]
  * ^condition[+] = zib-Refraction-3
  * ^condition[+] = zib-Refraction-4
* component[prismBase].code
  * ^condition[+] = zib-Refraction-3
  * ^condition[+] = zib-Refraction-4
* component[prismBase].code = http://snomed.info/sct#246223004
* component[prismBase].value[x]
  * ^condition[+] = zib-Refraction-3
  * ^condition[+] = zib-Refraction-4
* component[prismBase].value[x] only Quantity
* component[prismBase].value[x] = 'deg'
* component[sphericalRefractionValue] ^condition[+] = zib-Refraction-5
* component[sphericalRefractionValue].code ^condition[+] = zib-Refraction-5
* component[sphericalRefractionValue].code = http://snomed.info/sct#251795007
* component[sphericalRefractionValue].value[x] ^condition[+] = zib-Refraction-5
* component[sphericalRefractionValue].value[x] only Quantity
* component[sphericalRefractionValue].value[x] = '[diop]'
* component[sphericalEquivalent] ^condition[+] = zib-Refraction-5
* component[sphericalEquivalent].code ^condition[+] = zib-Refraction-5
* component[sphericalEquivalent].code = http://snomed.info/sct#112881000146107
* component[sphericalEquivalent].value[x] ^condition[+] = zib-Refraction-5
* component[sphericalEquivalent].value[x] only Quantity
* component[sphericalEquivalent].value[x] = '[diop]'
* component[readAddition].code = http://snomed.info/sct#251718005
* component[readAddition].value[x] only Quantity
* component[readAddition].value[x] = '[diop]'

// Short, alias, definition and comment texts
* ^description = "The refraction measurement is a measurement with which the refractive error of the eye is determined. During the refraction measurement, the necessary correction is established: the spherical power (in diopters), the cylindrical power (in diopters), the axis direction (in degrees) for any cylindrical correction, the prism (in prism diopters) and any additional power of the reading area (in diopters), the so-called reading addition."
* .
  * ^short = "Refraction"
  * ^alias[+] = "Refractie"
* effectiveDateTime
  * ^short = "RefractionDateTime"
  * ^alias[+] = "RefractieDatumTijd"
  * ^definition = "The date and time when the refraction measurement was carried out."
* bodySite
  * ^short = "AnatomicalLocation"
  * ^alias[+] = "AnatomischeLocatie"
  * ^definition = "The laterality of the eye of which the refraction has been measured."
  * ^comment = "The code on this element is added to make explicit what is implicit in the zib. See [ZIB-1442](https://bits.nictiz.nl/browse/ZIB-1442) for details."
* method
  * ^short = "RefractionMeasurementMethod"
  * ^alias[+] = "RefractieMeetMethode"
  * ^definition = "The method used to measure the refraction."
* component[cylindricalRefractionValue].value[x]
  * ^short = "CylindricalRefractionValue"
  * ^alias[+] = "CilindrischeRefractieWaarde"
  * ^definition = "The power of the cylinder needed to correct the cylindrical error (astigmatism), expressed in diopters. When a cylindrical refraction is registered, the axis of the cylinder must also be specified."
* component[cylindricalRefractionAxis].value[x]
  * ^short = "CylindricalRefractionAxis"
  * ^alias[+] = "CilindrischeRefractieAs"
  * ^definition = "The axis direction of the cylindrical refraction value expressed in degrees."
* component[prismValue].value[x]
  * ^short = "PrismValue"
  * ^alias[+] = "PrismaWaarde"
  * ^definition = "The power of the prism, expressed in prism diopters."
  * ^comment = "The unit (prism diopter) aligns with the future version of this zib. See [ZIB-1449](https://bits.nictiz.nl/browse/ZIB-1449) for details."
* component[prismBase].value[x]
  * ^short = "PrismBase"
  * ^alias[+] = "PrismaBasis"
  * ^definition = "The base of the prism, expressed in degrees."
* component[sphericalRefractionValue].value[x]
  * ^short = "SphericalRefractionValue"
  * ^alias[+] = "SferischeRefractieWaarde"
  * ^definition = "The spherical spectacle strength power needed to correct nearsightedness (myopia) or farsightedness (hyperopia), expressed in diopters, ascending by 0.25D."
* component[sphericalEquivalent].code ^comment = "The code to identify this concept (SNOMED 112881000146107) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1420](https://bits.nictiz.nl/browse/ZIB-1420) for more information."
* component[sphericalEquivalent].value[x]
  * ^short = "SphericalEquivalent"
  * ^alias[+] = "SferischEquivalent"
  * ^definition = "The spherical power added to half of the cylindrical power. Expressed in diopters, ascending by 0.1D. Some equipment automatically calculates the spherical equivalent."
* component[readAddition].code ^comment = "The DefintionCodes for the concepts Refraction and ReadAddition are identical in the zib Refraction. This is recognized and fixed in future publications in [ZIB-1443](https://bits.nictiz.nl/browse/ZIB-1443). In this profile, the codes are as defined in the 2020 publication."
* component[readAddition].value[x]
  * ^short = "ReadAddition"
  * ^alias[+] = "LeesAdditie"
  * ^definition = "A supplement that is added to the refraction value to determine the strength of the reading glasses, expressed in diopters."

Invariant: zib-Refraction-1
Description: "When component:cylindricalRefractionValue is present, component:cylindricalRefractionAxis should also be present."
Severity: #error
Expression: "component.code.coding.where(system = 'http://snomed.info/sct' and code = '251797004').exists() implies component.code.coding.where(system = 'http://snomed.info/sct' and code = '251799001').exists()"

Invariant: zib-Refraction-2
Description: "When component:cylindricalRefractionAxis is present, component:cylindricalRefractionValue should also be present."
Severity: #error
Expression: "component.code.coding.where(system = 'http://snomed.info/sct' and code = '251799001').exists() implies component.code.coding.where(system = 'http://snomed.info/sct' and code = '251797004').exists()"

Invariant: zib-Refraction-3
Description: "When component:prismValue is present, component:prismBase should also be present."
Severity: #error
Expression: "component.code.coding.where(system = 'http://snomed.info/sct' and code = '251762001').exists() implies component.code.coding.where(system = 'http://snomed.info/sct' and code = '246223004').exists()"

Invariant: zib-Refraction-4
Description: "When component:prismBase is present, component:prismValue should also be present."
Severity: #error
Expression: "component.code.coding.where(system = 'http://snomed.info/sct' and code = '246223004').exists() implies component.code.coding.where(system = 'http://snomed.info/sct' and code = '251762001').exists()"

Invariant: zib-Refraction-5
Description: "When component:sphericalEquivalent is present, component:sphericalRefractionValue should also be present."
Severity: #error
Expression: "component.code.coding.where(system = 'http://snomed.info/sct' and code = '112881000146107').exists() implies component.code.coding.where(system = 'http://snomed.info/sct' and code = '251795007').exists()"

Mapping: NlbaseRefraction-to-zib-refraction-v1.0-2020EN
Id: zib-refraction-v1.0-2020EN
Title: "zib Refraction-v1.0(2020EN)"
Source: NlbaseRefraction
Target: "https://zibs.nl/wiki/Refraction-v1.0(2020EN)"
*  -> "NL-CM:12.20.1" "Refraction"
* effectiveDateTime -> "NL-CM:12.20.3" "RefractionDateTime"
* bodySite -> "NL-CM:12.20.2" "AnatomicalLocation"
* bodySite.extension[laterality].value[x] -> "NL-CM:12.20.15" "Laterality"
* method -> "NL-CM:12.20.4" "RefractionMeasurementMethod"
* component[cylindricalRefractionValue].value[x] -> "NL-CM:12.20.11" "CylindricalRefractionValue"
* component[cylindricalRefractionAxis].value[x] -> "NL-CM:12.20.13" "CylindricalRefractionAxis"
* component[prismValue].value[x] -> "NL-CM:12.20.6" "PrismValue"
* component[prismBase].value[x] -> "NL-CM:12.20.7" "PrismBase"
* component[sphericalRefractionValue].value[x] -> "NL-CM:12.20.9" "SphericalRefractionValue"
* component[sphericalEquivalent].value[x] -> "NL-CM:12.20.10" "SphericalEquivalent"
* component[readAddition].value[x] -> "NL-CM:12.20.8" "ReadAddition"
