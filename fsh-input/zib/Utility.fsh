RuleSet: Discriminator(type, path)
* ^slicing.discriminator.type = #{type}
* ^slicing.discriminator.path = "{path}"
* ^slicing.rules = #open

RuleSet: PermittedValues(canonical)
* ^binding.valueSet.extension[+].url = "http://hl7.org/fhir/StructureDefinition/11179-permitted-value-conceptmap"
* ^binding.valueSet.extension[=].valueCanonical = "{canonical}"

// Add nl-core-Patient as a target profile for Observation.subject. Unfortunately, the entire list of target profiles
// has to be specified in a differential.
RuleSet: NlCorePatientForObservation
* subject only Reference(Patient or Group or Device or Location or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
