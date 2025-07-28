Profile: NlcoreChecklistPainBehavior
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-ChecklistPainBehavior
Id: nl-core-ChecklistPainBehavior
Title: "nl core ChecklistPainBehavior"
* insert ProfileMetadata(nl-core-ChecklistPainBehavior)
* insert Purpose(ChecklistPainBehavior, 1.1, Observation)

* note ..1
* component[face] ..1
* component[mouth] ..1
* component[grimace] ..1
* component[lookingSad] ..1
* component[eyes] ..1
* component[panic] ..1
* component[moaning] ..1
* component[cry] ..1
* component[soundsOfRestlessness] ..1
* component[tears] ..1

// Short, alias, definition and comment texts
* ^description = """
    The CPB (Checklist Pain Behaviour) is a pain assessment tool, that is used to assess pain in children with a limited expressive repertoire or with a profound cognitive impairment, by observing their behaviour.
    The CPB has ten observations that need to be addressed. The final score indicates whether the observed child suffers pain and 'how much'. The score is often combined with a VAS score that is completed by the nurses on basis of clinical experience.
    """
* . ^alias[+] = "nl-core-ChecklistPainBehavior"
