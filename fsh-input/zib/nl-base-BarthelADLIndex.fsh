Profile: NlbaseBarthelADLIndex
Parent: Observation
Id: nl-base-BarthelADLIndex
Title: "nl base BarthelADLIndex"
* insert ProfileMetadata(nl-base-BarthelADLIndex)
* insert Purpose(BarthelADLIndex, 3.1, Observation)

* code = http://snomed.info/sct#273302005
* value[x] insert Discriminator(type, $this)
* valueInteger only integer
* component insert Discriminator(value, code)
* component contains
    bowels 0..1 and
    bladder 0..1 and
    grooming 0..1 and
    toiletUse 0..1 and
    feeding 0..1 and
    transfers 0..1 and
    mobility 0..1 and
    dressing 0..1 and
    managingStairs 0..1 and
    bathing 0..1
* component[bowels].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4002004
* component[bowels].value[x] only CodeableConcept
* component[bowels].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.1--20200901000000 (preferred)
* component[bladder].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4002003
* component[bladder].value[x] only CodeableConcept
* component[bladder].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.2--20200901000000 (preferred)
* component[grooming].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4002005
* component[grooming].value[x] only CodeableConcept
* component[grooming].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.3--20200901000000 (preferred)
* component[toiletUse].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4002006
* component[toiletUse].value[x] only CodeableConcept
* component[toiletUse].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.4--20200901000000 (preferred)
* component[feeding].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4002007
* component[feeding].value[x] only CodeableConcept
* component[feeding].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.5--20200901000000 (preferred)
* component[transfers].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4002008
* component[transfers].value[x] only CodeableConcept
* component[transfers].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.6--20200901000000 (preferred)
* component[mobility].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4002009
* component[mobility].value[x] only CodeableConcept
* component[mobility].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.7--20200901000000 (preferred)
* component[dressing].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4002010
* component[dressing].value[x] only CodeableConcept
* component[dressing].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.8--20200901000000 (preferred)
* component[managingStairs].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4002011
* component[managingStairs].value[x] only CodeableConcept
* component[managingStairs].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.9--20200901000000 (preferred)
* component[bathing].code = urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1#4002012
* component[bathing].value[x] only CodeableConcept
* component[bathing].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.10--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    The Barthel ADL index is a validated scale used to measure and track patients’ activities of daily living (ADL) and indirectly, the extent to which they are dependent on help.
    The list comprises 10 variables: bowels, bladder, grooming, toilet use, feeding, transfers (from chair to bed and vice versa), mobility, dressing, climbing stairs and bathing, which are all given a score.
    The total score is the sum of the scores of the 10 variables.
    """
* .
  * ^short = "BarthelADLIndex"
  * ^alias[+] = "BarthelIndex"
* valueInteger
  * ^short = "TotalScore"
  * ^alias[+] = "TotaalScore"
  * ^definition = """
    The Barthel ADL index is the sum of the scores of the individual variables. 
    
    The interpretation of this total score is 0-9 for serious dependence, 10-19 for slight dependence and 20 for independence. Twenty is the maximum score.
    """
  * ^comment = "The individual scores are communicated using the different `Observation.component` slices. The ordinal values of these indivdual scores, which are used to calculate the total score, are defined by the underlying code system and are registered in the ValueSet resources bound on these slices, using the [ordinalValue](http://hl7.org/fhir/StructureDefinition/ordinalValue) extension."
* component[bowels].value[x]
  * ^short = "Bowels"
  * ^alias[+] = "Darm"
  * ^definition = """
    The bowel function describes the extent of fecal incontinence. 
    
    The measurement takes the condition as measured in the preceding week. In this scale, the following interpretations are used: 
    
    *  Incontinent: incontinent or enema required.
    *  Accident: max. 1 accident per week.
    *  Continent: continent for the entire week.
    """
* component[bladder].value[x]
  * ^short = "Bladder"
  * ^alias[+] = "Blaas"
  * ^definition = """
    The bladder function describes the extent of urinary incontinence. 
    
    The measurement takes the condition as measured in the preceding week.  In this scale, the following interpretations are used: 
    
    *  Incontinent: incontinent or catheter required.
    *  Accident: max. 1 accident per 24 hours.
    *  Continent: continent for the entire week or patients who can attend to their own catheter.
    """
* component[grooming].value[x]
  * ^short = "Grooming"
  * ^alias[+] = "UiterlijkeVerzorging"
  * ^definition = """
    Grooming indicates the extent to which a patient is capable of maintaining their hygiene and appearance. This refers to personal hygiene such as brushing teeth, brushing hair, shaving and washing. 
    
    The measurement takes the condition as measured in the preceding 24-48 hours.  In this scale, the following interpretations are used:
    
    *  Dependent: not capable of grooming independently.
    *  Independent: capable of brushing teeth, brushing hair, shaving and washing independently.
    """
* component[toiletUse].value[x]
  * ^short = "ToiletUse"
  * ^alias[+] = "Toiletgebruik"
  * ^definition = """
    Toilet use indicates the extent to which a patient is capable of using the toilet independently.  
    
    In this scale, the following interpretations are used:
    
    *  Dependent: dependent.
    *  Help: needs some help but can do certain things themselves, like wiping.
    *  Independent: capable of using the toilet, sufficiently undressing, cleaning, getting dressed and leaving.
    """
* component[feeding].value[x]
  * ^short = "Feeding"
  * ^alias[+] = "Eten"
  * ^definition = """
    Feeding indicates the extent to which a patient is capable of eating independently. 
    
    In this scale, the following interpretations are used:
    
    *  Not independent: not capable of eating independently.
    *  Help: food is puréed; patient does feed themselves, but needs help cutting food, spreading butter, et cetera.
    *  Independent: capable of eating normal food (including hard food). The food can be cooked and served by others, but is not to be puréed.
    """
* component[transfers].value[x]
  * ^short = "Transfers"
  * ^alias[+] = "Transfers"
  * ^definition = """
    Transfers indicates the extent to which a patient is capable of independently getting from a chair to the bed and vice versa.
    
    In this scale, the following interpretations are used:
    
    *  Not independent: not capable of sitting up; the use of a patient hoist is required.
    *  Major help: help from a strong, trained individual or 2 regular individuals, but the patient can sit up by themselves.
    *  Minor help: a person to supervise or provide some help, either verbally or physically.
    *  Independent: does not need help.
    """
* component[mobility].value[x]
  * ^short = "Mobility"
  * ^alias[+] = "Mobiliteit"
  * ^definition = """
    Mobility indicates the extent to which a patient is capable of moving independently. 
    
    In this scale, the following interpretations are used:
    
    *  Dependent: cannot move themselves.
    *  Independent with wheelchair: uses a wheelchair, with the ability to go around corners or open doors without help.
    *  Assisted walking: help from one person, for example verbally or physically.
    *  Independent: can move within the home or department; aids may be used.
    """
* component[dressing].value[x]
  * ^short = "Dressing"
  * ^alias[+] = "AanUitkleden"
  * ^definition = """
    Dressing indicates the extent to which a patient is capable of dressing and undressing themselves independently.
    
    In this scale, the following interpretations are used:
    
    * Dependent: dependent.
    * Help: needs help but can do about half themselves, such as only needing help with buttons and/or zippers.
    * Independent: capable of selecting and putting on clothes.
    """
* component[managingStairs].value[x]
  * ^short = "ManagingStairs"
  * ^alias[+] = "TrappenLopen"
  * ^definition = """
    Managing stairs indicates the extent to which a patient is capable of going up and down stairs independently.
    
    In this scale, the following interpretations are used:
    
    *  Dependent: not capable of going up and down stairs.
    *  Help: needs help, for example verbally, physically or in the form of an aid.
    *  Independent: capable of going up and down stairs independently, and if necessary can carry their own aid.
    """
* component[bathing].value[x]
  * ^short = "Bathing"
  * ^alias[+] = "BadenDouchen"
  * ^definition = """
    Bathing indicates the extent to which a patient is capable of independently taking a bath or shower. 
    
    In this scale, the following interpretations are used:
    
    *  Dependent: not capable of bathing independently.
    *  Independent: capable of getting in and out of the bath or shower and bathing without help or supervision.
    """

Mapping: NlbaseBarthelADLIndex-to-zib-bartheladlindex-v3.1-2020EN
Id: zib-bartheladlindex-v3.1-2020EN
Title: "zib BarthelADLIndex-v3.1(2020EN)"
Source: NlbaseBarthelADLIndex
Target: "https://zibs.nl/wiki/BarthelADLIndex-v3.1(2020EN)"
*  -> "NL-CM:4.2.1" "BarthelADLIndex"
* valueInteger -> "NL-CM:4.2.2" "TotalScore"
* component[bowels].value[x] -> "NL-CM:4.2.4" "Bowels"
* component[bladder].value[x] -> "NL-CM:4.2.3" "Bladder"
* component[grooming].value[x] -> "NL-CM:4.2.5" "Grooming"
* component[toiletUse].value[x] -> "NL-CM:4.2.6" "ToiletUse"
* component[feeding].value[x] -> "NL-CM:4.2.7" "Feeding"
* component[transfers].value[x] -> "NL-CM:4.2.8" "Transfers"
* component[mobility].value[x] -> "NL-CM:4.2.9" "Mobility"
* component[dressing].value[x] -> "NL-CM:4.2.10" "Dressing"
* component[managingStairs].value[x] -> "NL-CM:4.2.11" "ManagingStairs"
* component[bathing].value[x] -> "NL-CM:4.2.12" "Bathing"
