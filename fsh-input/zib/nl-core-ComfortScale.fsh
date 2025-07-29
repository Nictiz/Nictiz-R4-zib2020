Profile: NlcoreComfortScale
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ComfortScale
Id: nl-core-ComfortScale
Title: "nl core ComfortScale"
* insert ProfileMetadata(nl-core-ComfortScale)
* insert Purpose(ComfortScale, 1.1, Observation)

* note ..1
* component[alertness] ..1
* component[alertness].value[x] ^binding.strength = #required
* component[calmnessAgitation] ..1
* component[calmnessAgitation].value[x] ^binding.strength = #required
* component[respiratoryResponse] ..1
* component[respiratoryResponse].value[x] ^binding.strength = #required
* component[crying] ..1
* component[crying].value[x] ^binding.strength = #required
* component[bodyMovement] ..1
* component[bodyMovement].value[x] ^binding.strength = #required
* component[facialTone] ..1
* component[facialTone].value[x] ^binding.strength = #required
* component[bodyMuscleTone] ..1
* component[bodyMuscleTone].value[x] ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    The Comfort Behaviour scale/ComfortNeo scale is an assessment tool, that is used to assess the pain behaviour of neonates (newborn).
    The Comfort Behaviour scale has 7 observation points that need to be addressed. For each observation a value is assigned from a 5-point scale, the final score indicates whether the observed child suffers pain and 'how much'. The score is combined with an NRS score that is completed by the nurses on basis of clinical experience.
    """
* . ^alias[+] = "nl-core-ComfortScale"
