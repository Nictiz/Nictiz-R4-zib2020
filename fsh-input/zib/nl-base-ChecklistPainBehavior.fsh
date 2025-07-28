Profile: NlbaseChecklistPainBehavior
Parent: Observation
Id: nl-base-ChecklistPainBehavior
Title: "nl base ChecklistPainBehavior"
* insert ProfileMetadata(nl-base-ChecklistPainBehavior)
* insert Purpose(ChecklistPainBehavior, 1.1, Observation)

* code = http://snomed.info/sct#108331000146104
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    face 0..1 and
    mouth 0..1 and
    grimace 0..1 and
    lookingSad 0..1 and
    eyes 0..1 and
    panic 0..1 and
    moaning 0..1 and
    cry 0..1 and
    soundsOfRestlessness 0..1 and
    tears 0..1
* component[face].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12017003
* component[face].value[x] only integer
* component[mouth].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12017004
* component[mouth].value[x] only integer
* component[grimace].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12017005
* component[grimace].value[x] only integer
* component[lookingSad].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12017006
* component[lookingSad].value[x] only integer
* component[eyes].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12017007
* component[eyes].value[x] only integer
* component[panic].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12017008
* component[panic].value[x] only integer
* component[moaning].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12017009
* component[moaning].value[x] only integer
* component[cry].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12017010
* component[cry].value[x] only integer
* component[soundsOfRestlessness].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12017011
* component[soundsOfRestlessness].value[x] only integer
* component[tears].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#12017012
* component[tears].value[x] only integer

// Short, alias, definition and comment texts
* ^description = """
    The CPB (Checklist Pain Behaviour) is a pain assessment tool, that is used to assess pain in children with a limited expressive repertoire or with a profound cognitive impairment, by observing their behaviour.
    The CPB has ten observations that need to be addressed. The final score indicates whether the observed child suffers pain and 'how much'. The score is often combined with a VAS score that is completed by the nurses on basis of clinical experience.
    """
* .
  * ^short = "ChecklistPainBehaviour"
  * ^alias[+] = "ChecklistPijnGedrag"
* effectiveDateTime
  * ^short = "ScoreDateTime"
  * ^alias[+] = "ScoreDatumTijd"
  * ^definition = "The date and time at which the CPB score was determined."
* valueInteger
  * ^short = "TotalScore"
  * ^alias[+] = "TotaalScore"
  * ^definition = "The total score is the sum of all the individual scores. The total score has a range from 0 - 10."
  * ^comment = "The total score communicated using this element is always determined using the individual scores, but these individual scores are not always registered or communicated. For this reason, all individual `Observation.component`s representing the individual scores are optional, and the total score might not align with the sum of the individual scores that are communicated."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the circumstances during the measurement."
* component[face].value[x]
  * ^short = "Face"
  * ^alias[+] = "Gezicht"
  * ^definition = "Tense face; one or more muscles in the face are tensed."
* component[mouth].value[x]
  * ^short = "Mouth"
  * ^alias[+] = "Mond"
  * ^definition = "Deeper naso-labial furrow; the line between the nose and mouth (naso-labial furrow) is deeper and aside."
* component[grimace].value[x]
  * ^short = "Grimace"
  * ^alias[+] = "Grimas"
  * ^definition = "Grimace; the co-occurrence of: furrowed eyebrows; eyes that are composed or pinched; a deeper line between the nose and mouth; opened mouth."
* component[lookingSad].value[x]
  * ^short = "Looking sad"
  * ^alias[+] = "VerdrietigeBlik"
  * ^definition = "Looking sad, almost in tears: eyebrows which have been pulled up laterally on the inner sides; wrinkles in the forehead, especially over the nose; eyes are squeezed; mouth drawn down possibly combined with a pout."
* component[eyes].value[x]
  * ^short = "Eyes"
  * ^alias[+] = "Ogen"
  * ^definition = """
    Eyes squeezed.
    Note: Do NOT score as present when the child is blinking or when the eyes are still closed without blinking.
    """
* component[panic].value[x]
  * ^short = "Panic"
  * ^alias[+] = "Paniek"
  * ^definition = """
    Panics, panic attack: an extreme form of anxiety which manifests itself in random restless body movements or violent resistance.
    
    This may be associated with an anxious look characterized by large widely opened eyes and eyebrows which are on the inner side raised up.
    """
* component[moaning].value[x]
  * ^short = "Moaning"
  * ^alias[+] = "Kreunen"
  * ^definition = "Moaning, groaning; monotonous sound on plaintive tone."
* component[cry].value[x]
  * ^short = "Cry"
  * ^alias[+] = "Huilen"
  * ^definition = "Cries softly; crying is accompanied by a shocking breath."
* component[soundsOfRestlessness].value[x]
  * ^short = "SoundsOfRestlessness"
  * ^alias[+] = "Onrustgeluiden"
  * ^definition = "Penetrating sounds of restlessness: sudden or longer lasting intense cries or verbal expressions of pain, such as \"ow\" or \"you hurt me\"."
* component[tears].value[x]
  * ^short = "Tears"
  * ^alias[+] = "Tranen"
  * ^definition = "Tears: child produces tears in at least one eye, so more than just watery eyes."

Mapping: NlbaseChecklistPainBehavior-to-zib-checklistpainbehavior-v1.1-2020EN
Id: zib-checklistpainbehavior-v1.1-2020EN
Title: "zib ChecklistPainBehavior-v1.1(2020EN)"
Source: NlbaseChecklistPainBehavior
Target: "https://zibs.nl/wiki/ChecklistPainBehavior-v1.1(2020EN)"
*  -> "NL-CM:12.17.1" "ChecklistPainBehaviour"
* effectiveDateTime -> "NL-CM:12.17.13" "ScoreDateTime"
* valueInteger -> "NL-CM:12.17.2" "TotalScore"
* note.text -> "NL-CM:12.17.14" "Comment"
* component[face].value[x] -> "NL-CM:12.17.3" "Face"
* component[mouth].value[x] -> "NL-CM:12.17.4" "Mouth"
* component[grimace].value[x] -> "NL-CM:12.17.5" "Grimace"
* component[lookingSad].value[x] -> "NL-CM:12.17.6" "LookingSad"
* component[eyes].value[x] -> "NL-CM:12.17.7" "Eyes"
* component[panic].value[x] -> "NL-CM:12.17.8" "Panic"
* component[moaning].value[x] -> "NL-CM:12.17.9" "Moaning"
* component[cry].value[x] -> "NL-CM:12.17.10" "Cry"
* component[soundsOfRestlessness].value[x] -> "NL-CM:12.17.11" "SoundsOfRestlessness"
* component[tears].value[x] -> "NL-CM:12.17.12" "Tears"
