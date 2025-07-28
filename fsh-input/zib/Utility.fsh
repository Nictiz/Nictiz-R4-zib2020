RuleSet: Discriminator(type, path)
* ^slicing.discriminator.type = #{type}
* ^slicing.discriminator.path = "{path}"
* ^slicing.rules = #open

RuleSet: PermittedValues(canonical)
* ^binding.valueSet.extension[+].url = "http://hl7.org/fhir/StructureDefinition/11179-permitted-value-conceptmap"
* ^binding.valueSet.extension[=].valueCanonical = "{canonical}"
