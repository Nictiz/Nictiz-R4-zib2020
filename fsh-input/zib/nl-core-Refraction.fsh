Profile: NlcoreRefraction
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Refraction
Id: nl-core-Refraction
Title: "nl core Refraction"
* insert ProfileMetadata(nl-core-Refraction)
* insert Purpose(Refraction, 1.0, Observation)

* . obeys zib-Refraction-1 and zib-Refraction-2 and zib-Refraction-3 and zib-Refraction-4 and zib-Refraction-5
* insert NlCorePatientForObservation
* bodySite ^type.profile = http://nictiz.nl/fhir/StructureDefinition/nl-core-AnatomicalLocation
* bodySite.extension[laterality].value[x] ^binding.strength = #required
* method ^binding.strength = #extensible
* component[cylindricalRefractionValue] ..1
* component[cylindricalRefractionValue].value[x]
  * ^minValueQuantity = -10 '[diop]'
  * ^maxValueQuantity = 0 '[diop]'
* component[cylindricalRefractionAxis] ..1
* component[cylindricalRefractionAxis].value[x]
  * ^minValueQuantity = 0 'deg'
  * ^maxValueQuantity = 180 'deg'
* component[prismValue] ..1
* component[prismValue].value[x]
  * ^minValueQuantity.value = 0
  * ^minValueQuantity.system = "http://unitsofmeasure.org"
  * ^minValueQuantity.code = #[p'diop] // More elaborate notation to account for the single quote
  * ^maxValueQuantity.value = 40
  * ^maxValueQuantity.system = "http://unitsofmeasure.org"
  * ^maxValueQuantity.code = #[p'diop]
* component[prismBase] ..1
* component[prismBase].value[x]
  * ^minValueQuantity = 0 'deg'
  * ^maxValueQuantity = 360 'deg'
* component[sphericalRefractionValue] ..1
* component[sphericalRefractionValue].value[x]
  * ^minValueQuantity = -25 '[diop]'
  * ^maxValueQuantity = 25 '[diop]'
* component[sphericalEquivalent] ..1
* component[sphericalEquivalent].value[x]
  * ^minValueQuantity = -25 '[diop]'
  * ^maxValueQuantity = 25 '[diop]'
* component[readAddition] ..1
* component[readAddition].value[x]
  * ^minValueQuantity = 0 '[diop]'
  * ^maxValueQuantity = 5 '[diop]'

// Short, alias, definition and comment texts
* ^description = "The refraction measurement is a measurement with which the refractive error of the eye is determined. During the refraction measurement, the necessary correction is established: the spherical power (in diopters), the cylindrical power (in diopters), the axis direction (in degrees) for any cylindrical correction, the prism (in prism diopters) and any additional power of the reading area (in diopters), the so-called reading addition."
* . ^alias[+] = "nl-core-Refraction"
