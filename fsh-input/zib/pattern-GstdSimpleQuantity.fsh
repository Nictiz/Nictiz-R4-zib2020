Profile: PatternGstdSimpleQuantity
Parent: SimpleQuantity
Id: pattern-GstdSimpleQuantity
Title: "G-Standard SimpleQuantity"
* insert ProfileMetadata(pattern-GstdSimpleQuantity)
* ^purpose = "This profile provides a uniform way to include the iso21090-PQ-translation extension to provide a SimpleQuantity based on G-Standard units."

* extension contains
    http://hl7.org/fhir/StructureDefinition/iso21090-PQ-translation named gstdSimpleQuantity 0..*
* extension[gstdSimpleQuantity].value[x] only Quantity
* extension[gstdSimpleQuantity].value[x] ^type.profile = http://hl7.org/fhir/StructureDefinition/SimpleQuantity
* extension[gstdSimpleQuantity].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.20.77.11.27--20160830202453 (preferred)

// Short, alias, definition and comment texts
* ^description = "A SimpleQuantity datatype profile to add a SimpleQuantity translation in G-Standard units using the HL7 core iso21090-PQ-translation extension. The extension MAY be used to additionally add translations expressed in a different unit from a different unit code system (e.g. NHG table Gebruiksvoorschriften (Table 25))."
* extension[gstdSimpleQuantity].value[x] ^definition = "A SimpleQuantity translation in G-Standard units. The extension MAY be used to additionally add translations expressed in a different unit from a different unit code system (e.g. NHG table Gebruiksvoorschriften (Table 25))."
