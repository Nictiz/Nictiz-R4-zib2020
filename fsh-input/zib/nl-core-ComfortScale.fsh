Profile: NlcoreComfortScale
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ComfortScale
Id: nl-core-ComfortScale
Title: "nl core ComfortScale"
* insert ProfileMetadata(nl-core-ComfortScale)
* insert Purpose(ComfortScale, 1.1, Observation)

* note ..1
* component[alertness] ..1
* component[alertness].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.1--20200901000000 (required)
* component[calmnessAgitation] ..1
* component[calmnessAgitation].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.2--20200901000000 (required)
* component[respiratoryResponse] ..1
* component[respiratoryResponse].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.3--20200901000000 (required)
* component[crying] ..1
* component[crying].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.4--20200901000000 (required)
* component[bodyMovement] ..1
* component[bodyMovement].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.5--20200901000000 (required)
* component[facialTone] ..1
* component[facialTone].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.6--20200901000000 (required)
* component[bodyMuscleTone] ..1
* component[bodyMuscleTone].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.12.7--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    The Comfort Behaviour scale/ComfortNeo scale is an assessment tool, that is used to assess the pain behaviour of neonates (newborn).
    The Comfort Behaviour scale has 7 observation points that need to be addressed. For each observation a value is assigned from a 5-point scale, the final score indicates whether the observed child suffers pain and 'how much'. The score is combined with an NRS score that is completed by the nurses on basis of clinical experience.
    """
* . ^alias[+] = "nl-core-ComfortScale"
