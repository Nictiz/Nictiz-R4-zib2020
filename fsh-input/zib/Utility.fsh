RuleSet: Discriminator(type, path)
* ^slicing.discriminator.type = #{type}
* ^slicing.discriminator.path = "{path}"
* ^slicing.rules = #open

RuleSet: PermittedValues(canonical)
* ^binding.valueSet.extension[+].url = "http://hl7.org/fhir/StructureDefinition/11179-permitted-value-conceptmap"
* ^binding.valueSet.extension[=].valueCanonical = "{canonical}"

RuleSet: AdditionalBinding(purpose, canonical)
* ^binding.extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* ^binding.extension[=].extension[+].url = "purpose"
* ^binding.extension[=].extension[=].valueCode = #{purpose}
* ^binding.extension[=].extension[+].url = "valueSet"
* ^binding.extension[=].extension[=].valueCanonical = "{canonical}"

// Add nl-core-Patient as a target profile for Observation.subject. Unfortunately, the entire list of target profiles
// has to be specified in a differential.
RuleSet: NlCorePatientForObservation
* subject only Reference(Patient or Group or Device or Location or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)

RuleSet: NlCorePatientForDeviceUseStatement
* subject only Reference(Patient or Group or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)