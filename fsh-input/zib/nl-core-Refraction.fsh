Profile: NlcoreRefraction
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Refraction
Id: nl-core-Refraction
Title: "nl core Refraction"
* insert ProfileMetadata(nl-core-Refraction)
* insert Purpose(Refraction, 1.0, Observation)

* . obeys zib-Refraction-1 and zib-Refraction-2 and zib-Refraction-3 and zib-Refraction-4 and zib-Refraction-5
* bodySite.extension[laterality].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.20.2--20200901000000 (required)
* method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.20.1--20200901000000 (extensible)
* component[cylindricalRefractionValue] ..1
* component[cylindricalRefractionAxis] ..1
* component[prismValue] ..1
* component[prismBase] ..1
* component[sphericalRefractionValue] ..1
* component[sphericalEquivalent] ..1
* component[readAddition] ..1

// Short, alias, definition and comment texts
* ^description = "The refraction measurement is a measurement with which the refractive error of the eye is determined. During the refraction measurement, the necessary correction is established: the spherical power (in diopters), the cylindrical power (in diopters), the axis direction (in degrees) for any cylindrical correction, the prism (in prism diopters) and any additional power of the reading area (in diopters), the so-called reading addition."
* . ^alias[+] = "nl-core-Refraction"
