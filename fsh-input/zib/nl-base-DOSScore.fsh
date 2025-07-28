Profile: NlbaseDOSScore
Parent: Observation
Id: nl-base-DOSScore
Title: "nl base DOSScore"
* insert ProfileMetadata(nl-base-DOSScore)
* insert Purpose(DOSScore, 1.0, Observation)

* code = http://snomed.info/sct#55681000146102
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    dozesOff 0..1 and
    easilyDistracted 0..1 and
    maintainsAttention 0..1 and
    unfinishedQuestionAnswer 0..1 and
    answersNoFit 0..1 and
    reactsSlowly 0..1 and
    thinksSomewhereElse 0..1 and
    knowsPartDay 0..1 and
    remembersRecent 0..1 and
    restless 0..1 and
    pullsWires 0..1 and
    easilyEmotional 0..1 and
    hallucinations 0..1
* component[dozesOff].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007006
* component[dozesOff].value[x] only integer
* component[easilyDistracted].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007007
* component[easilyDistracted].value[x] only integer
* component[maintainsAttention].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007008
* component[maintainsAttention].value[x] only integer
* component[unfinishedQuestionAnswer].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007009
* component[unfinishedQuestionAnswer].value[x] only integer
* component[answersNoFit].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007010
* component[answersNoFit].value[x] only integer
* component[reactsSlowly].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007011
* component[reactsSlowly].value[x] only integer
* component[thinksSomewhereElse].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007012
* component[thinksSomewhereElse].value[x] only integer
* component[knowsPartDay].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007013
* component[knowsPartDay].value[x] only integer
* component[remembersRecent].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007014
* component[remembersRecent].value[x] only integer
* component[restless].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007015
* component[restless].value[x] only integer
* component[pullsWires].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007016
* component[pullsWires].value[x] only integer
* component[easilyEmotional].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007017
* component[easilyEmotional].value[x] only integer
* component[hallucinations].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#18007018
* component[hallucinations].value[x] only integer

// Short, alias, definition and comment texts
* ^description = "The Delirium Observation Screening Scale is a tool to determine whether a patient has delirium. The DOSS includes 13 observations of behavior (verbal and non-verbal) which represent the symptoms of a delirium. These observations can be performed during regular contact with the patient."
* .
  * ^short = "DOSScore"
  * ^alias[+] = "DOSScore"
* code ^comment = "The code to identify this concept (SNOMED 55681000146102) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* effectiveDateTime
  * ^short = "DOSScoreDateTime"
  * ^alias[+] = "DOSScoreDatumTijd"
  * ^definition = "The date on which the DOS score is registered."
* valueInteger
  * ^short = "DOSScoreTotal"
  * ^alias[+] = "DOSScoreTotaal"
  * ^definition = """
    Per shift a total score is calculated (minimum 0 and maximum 13). The total scores of three shifts (day, evening and night shifts) are summed to the total score of the day (minimum 0 and maximum 39).
    
    The DOS scale final score is calculated by dividing the total score of the day by 3 (minimum 0 and maximum 13).
    
    A DOS scale final score < 3 means that the patient is probably not delirious. A DOS scale final score > 3 means that the patient is probably delirious.
    """
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the DOS score."
* component[dozesOff].code ^comment = "The code to identify this concept (18007006 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[dozesOff].value[x]
  * ^short = "DozesOff"
  * ^alias[+] = "ZaktWeg"
  * ^definition = """
    DOS observation: patient dozes off during conversation or activities.
    
    Score:
    0: never
    1: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[easilyDistracted].code ^comment = "The code to identify this concept (18007007 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[easilyDistracted].value[x]
  * ^short = "EasilyDistracted"
  * ^alias[+] = "SnelAfgeleid"
  * ^definition = """
    DOS observation: patient is easily distracted by stimuli from the environment.
    
    Someone is easily distracted by stimuli from the environment when he/she responds verbally or non-verbally to sounds or movements that have no relation to him/her and the nature of which does not make you expect a reaction from him/her.
    
    Score:
    0: never
    1: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[maintainsAttention].code ^comment = "The code to identify this concept (18007008 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[maintainsAttention].value[x]
  * ^short = "MaintainsAttention"
  * ^alias[+] = "HeeftAandacht"
  * ^definition = """
    DOS observation: patient maintains attention to conversation or action.
    
    Someone is maintaining attention to a conversation or action if he/she verbally or non-verbally shows that they are following the conversation or action.
    
    Score:
    1: never
    0: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[unfinishedQuestionAnswer].code ^comment = "The code to identify this concept (18007009 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[unfinishedQuestionAnswer].value[x]
  * ^short = "UnfinishedQuestionAnswer"
  * ^alias[+] = "VraagAntwoordNietAf"
  * ^definition = """
    DOS observation: patient does not finish question or answer.
    
    Score:
    0: never
    1: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[answersNoFit].code ^comment = "The code to identify this concept (18007010 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[answersNoFit].value[x]
  * ^short = "AnswersNoFit"
  * ^alias[+] = "AntwoordenNietPassend"
  * ^definition = """
    DOS observation: patient gives answers that do not fit the question.
    
    Score:
    0: never
    1: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[reactsSlowly].code ^comment = "The code to identify this concept (18007011 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[reactsSlowly].value[x]
  * ^short = "ReactsSlowly"
  * ^alias[+] = "ReageertTraag"
  * ^definition = """
    DOS observation: patient reacts slowly to instructions.
    
    Someone reacts slowly to instructions when acting is delayed and/or there are moments of stillness/inactivity before moving into action.
    
    Score:
    0: never
    1: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[thinksSomewhereElse].code ^comment = "The code to identify this concept (18007012 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[thinksSomewhereElse].value[x]
  * ^short = "ThinksSomewhereElse"
  * ^alias[+] = "DenktErgensAnders"
  * ^definition = """
    DOS observation: patient thinks they are somewhere else.
    
    Someone thinks they are somewhere else when he/she shows this in words or actions.
    
    Score:
    0: never
    1: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[knowsPartDay].code ^comment = "The code to identify this concept (18007013 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[knowsPartDay].value[x]
  * ^short = "KnowsPartDay"
  * ^alias[+] = "BeseftDagdeel"
  * ^definition = """
    DOS observation: patient knows which part of the day it is.
    
    Someone knows what part of the day it is when he/she shows such in words or actions.
    
    Score:
    1: never
    0: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[remembersRecent].code ^comment = "The code to identify this concept (18007014 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[remembersRecent].value[x]
  * ^short = "RemembersRecent"
  * ^alias[+] = "HerinnertRecent"
  * ^definition = """
    DOS observation: patient remembers recent events.
    
    Someone remembers recent events when he/she can for example tell whether they had visitors or what he/she ate.
    
    Score:
    1: never
    0: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[restless].code ^comment = "The code to identify this concept (18007015 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[restless].value[x]
  * ^short = "Restless"
  * ^alias[+] = "Rusteloos"
  * ^definition = """
    DOS observation: patient is picking, disorderly, restless.
    
    Score:
    0: never
    1: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[pullsWires].code ^comment = "The code to identify this concept (18007016 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[pullsWires].value[x]
  * ^short = "PullsWires"
  * ^alias[+] = "TrektDraden"
  * ^definition = """
    DOS observation: patient pulls IV tubing, feeding tubes, catheters, etc.
    
    Score:
    0: never
    1: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[easilyEmotional].code ^comment = "The code to identify this concept (18007017 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[easilyEmotional].value[x]
  * ^short = "EasilyEmotional"
  * ^alias[+] = "SnelGeemotioneerd"
  * ^definition = """
    DOS observation: patient is easily or suddenly emotional.
    
    Someone is easily or suddenly emotional when he/she responds with a fierce emotion without provocation or when the fierceness of the emotion does not seem to match the provocation.
    
    Score:
    0: never
    1: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """
* component[hallucinations].code ^comment = "The code to identify this concept (18007018 in code system urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1) aligns with the next version of the zib, since the current version doesn't provide a code. See [ZIB-1674](https://bits.nictiz.nl/browse/ZIB-1674) for more information."
* component[hallucinations].value[x]
  * ^short = "Hallucinations"
  * ^alias[+] = "Hallucinaties"
  * ^definition = """
    DOS observation: patient sees/hears things which are not there.
    
    Someone sees/hears things which are not there when he/she shows this verbally (ask!) or non-verbally.
    
    Score:
    0: never
    1: sometimes-always
    (if the answer is \"don't know\", do not instantiate this concept)
    """

Mapping: NlbaseDOSScore-to-zib-dosscore-v1.0-2020EN
Id: zib-dosscore-v1.0-2020EN
Title: "zib DOSScore-v1.0(2020EN)"
Source: NlbaseDOSScore
Target: "https://zibs.nl/wiki/DOSScore-v1.0(2020EN)"
*  -> "NL-CM:18.7.1" "DOSScore"
* effectiveDateTime -> "NL-CM:18.7.5" "DOSScoreDateTime"
* valueInteger -> "NL-CM:18.7.3" "DOSScoreTotal"
* note.text -> "NL-CM:18.7.2" "Comment"
* component[dozesOff].value[x] -> "NL-CM:18.7.6" "DozesOff"
* component[easilyDistracted].value[x] -> "NL-CM:18.7.7" "EasilyDistracted"
* component[maintainsAttention].value[x] -> "NL-CM:18.7.8" "MaintainsAttention"
* component[unfinishedQuestionAnswer].value[x] -> "NL-CM:18.7.9" "UnfinishedQuestionAnswer"
* component[answersNoFit].value[x] -> "NL-CM:18.7.10" "AnswersNoFit"
* component[reactsSlowly].value[x] -> "NL-CM:18.7.11" "ReactsSlowly"
* component[thinksSomewhereElse].value[x] -> "NL-CM:18.7.12" "ThinksSomewhereElse"
* component[knowsPartDay].value[x] -> "NL-CM:18.7.13" "KnowsPartDay"
* component[remembersRecent].value[x] -> "NL-CM:18.7.14" "RemembersRecent"
* component[restless].value[x] -> "NL-CM:18.7.15" "Restless"
* component[pullsWires].value[x] -> "NL-CM:18.7.16" "PullsWires"
* component[easilyEmotional].value[x] -> "NL-CM:18.7.17" "EasilyEmotional"
* component[hallucinations].value[x] -> "NL-CM:18.7.18" "Hallucinations"
