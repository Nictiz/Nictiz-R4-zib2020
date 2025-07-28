Profile: NlcoreDOSScore
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-DOSScore
Id: nl-core-DOSScore
Title: "nl core DOSScore"
* insert ProfileMetadata(nl-core-DOSScore)
* insert Purpose(DOSScore, 1.0, Observation)

* note ..1
* component[dozesOff] ..1
* component[easilyDistracted] ..1
* component[maintainsAttention] ..1
* component[unfinishedQuestionAnswer] ..1
* component[answersNoFit] ..1
* component[reactsSlowly] ..1
* component[thinksSomewhereElse] ..1
* component[knowsPartDay] ..1
* component[remembersRecent] ..1
* component[restless] ..1
* component[pullsWires] ..1
* component[easilyEmotional] ..1
* component[hallucinations] ..1

// Short, alias, definition and comment texts
* ^description = "The Delirium Observation Screening Scale is a tool to determine whether a patient has delirium. The DOSS includes 13 observations of behavior (verbal and non-verbal) which represent the symptoms of a delirium. These observations can be performed during regular contact with the patient."
* . ^alias[+] = "nl-core-DOSScore"
