Extension: ExtCodeSpecification
Id: ext-CodeSpecification
Title: "ext CodeSpecification"
Context: code
* insert ProfileMetadata(ext-CodeSpecification)

* value[x] only CodeableConcept

// Short, alias, definition and comment texts
* ^description = """
    Sometimes it is not possible to use the ValueSet from the functional description on the corresponding FHIR element. This is a common occurrence when the FHIR element has datatype _code_ and has a _required_ binding with an incompatible FHIR core ValueSet. It can also happen when the FHIR element has a _string_ or other non-coded datatype.
    
    In this case, the FHIR element may be augmented with this extension to communicate the code from the functional description. This information should always be _added_ to the normal use of the FHIR element to allow for maximum interoperability.
    """
