Profile: NlcoreBarthelADLIndex
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-BarthelADLIndex
Id: nl-core-BarthelADLIndex
Title: "nl core BarthelADLIndex"
* insert ProfileMetadata(nl-core-BarthelADLIndex)
* insert Purpose(BarthelADLIndex, 3.1, Observation)

* component[bowels] ..1
* component[bowels].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.1--20200901000000 (required)
* component[bladder] ..1
* component[bladder].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.2--20200901000000 (required)
* component[grooming] ..1
* component[grooming].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.3--20200901000000 (required)
* component[toiletUse] ..1
* component[toiletUse].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.4--20200901000000 (required)
* component[feeding] ..1
* component[feeding].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.5--20200901000000 (required)
* component[transfers] ..1
* component[transfers].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.6--20200901000000 (required)
* component[mobility] ..1
* component[mobility].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.7--20200901000000 (required)
* component[dressing] ..1
* component[dressing].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.8--20200901000000 (required)
* component[managingStairs] ..1
* component[managingStairs].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.9--20200901000000 (required)
* component[bathing] ..1
* component[bathing].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.4.2.10--20200901000000 (required)

// Short, alias, definition and comment texts
* ^description = """
    The Barthel ADL index is a validated scale used to measure and track patients’ activities of daily living (ADL) and indirectly, the extent to which they are dependent on help.
    The list comprises 10 variables: bowels, bladder, grooming, toilet use, feeding, transfers (from chair to bed and vice versa), mobility, dressing, climbing stairs and bathing, which are all given a score.
    The total score is the sum of the scores of the 10 variables.
    """
* . ^alias[+] = "nl-core-BarthelADLIndex"
