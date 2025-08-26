Profile: NlcoreVisualFunction
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-VisualFunction
Id: nl-core-VisualFunction
Title: "nl core VisualFunction"
* insert ProfileMetadata(nl-core-VisualFunction)
* insert Purpose(VisualFunction, 3.1, Observation)

* extension[visualAid].value[x] only Reference(Resource or http://nictiz.nl/fhir/StructureDefinition/nl-core-VisualFunction.VisualAid)
* note ..1

// Short, alias, definition and comment texts
* ^description = """
    Sight is the ability to observe lit objects, with the goal of orienting yourself on objects and people in a lit environment. This pertains to observing the light stimuli, and not processing them in the brain.
    A sight disorder can lead to things including orientation problems.
    """
* . ^alias[+] = "nl-core-VisualFunction"
