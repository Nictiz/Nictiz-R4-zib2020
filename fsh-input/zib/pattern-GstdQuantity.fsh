Profile: PatternGstdQuantity
Parent: Quantity
Id: pattern-GstdQuantity
Title: "G-Standard Quantity"
* insert ProfileMetadata(pattern-GstdQuantity)
* ^purpose = "This profile provides a uniform way to include the iso21090-PQ-translation extension to provide a Quantity based on G-Standard units."

* extension contains
    http://hl7.org/fhir/StructureDefinition/iso21090-PQ-translation named gstdQuantity 0..*
* extension[gstdQuantity].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.20.77.11.27--20160830202453 (preferred)

// Short, alias, definition and comment texts
* ^description = "A Quantity datatype profile to add a Quantity translation in G-Standard units using the HL7 core iso21090-PQ-translation extension. The extension MAY be used to additionally add translations expressed in a different unit from a different unit code system (e.g. NHG table Gebruiksvoorschriften (Table 25))."
* extension[gstdQuantity].value[x] ^definition = "A Quantity translation in G-Standard units. The extension MAY be used to additionally add translations expressed in a different unit from a different unit code system (e.g. NHG table Gebruiksvoorschriften (Table 25))."
