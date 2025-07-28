Profile: NlbasePainScore
Parent: Observation
Id: nl-base-PainScore
Title: "nl base PainScore"
* insert ProfileMetadata(nl-base-PainScore)
* insert Purpose(PainScore, 4.0, Observation)

* . obeys zib-PainScore-1 and zib-PainScore-2
* code = http://snomed.info/sct#225908003
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* value[x] insert Discriminator(type, $this)
* valueInteger 0..
  * ^condition[+] = zib-PainScore-1
  * ^condition[+] = zib-PainScore-2
* valueInteger only integer
* method
  * ^condition[+] = zib-PainScore-1
  * ^condition[+] = zib-PainScore-2
* method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.12.9.1--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = """
    The pain score is a general measurement for pain experience, not a description of specific, localized pain.
    
    The following are used as an easily reproducible measurement for pain experience:
    NRS (Numeric Rating Scale) in which the patient gives the pain a number on a scale of 1 (no pain) to 10 (unbearable pain).
    VAS (Visual Analogue Score), in which the patient points to a bar with a line to indicate the pain they feel. The back of the bar has a scale from 0 (no pain) to 10 (unbearable pain) on it.
    
    The results of both scores have the same meaning, but the visual analogue method (VAS) is seen as more reliable than the NRS pain score.
    """
* .
  * ^short = "PainScore"
  * ^alias[+] = "PijnScore"
* effectiveDateTime
  * ^short = "PainScoreDateTime"
  * ^alias[+] = "PijnscoreDatumTijd"
  * ^definition = "The date and time at which the pain score was measured."
* valueInteger
  * ^short = "PainScoreValue"
  * ^alias[+] = "PijnscoreWaarde"
  * ^definition = """
    The score is a general measurement of pain experience, not a description of specific, localized pain. 
     
    Depending on the measuring method used, it indicates the level of pain experienced by the patient on a scale of 0 to 10: 0 = no pain and 10 = the worst pain imaginable. No descriptions are used for the intermediate values, so that the value is displayed as a number and not as a code.  
     
    Sometimes a value range of 0-100 is used instead of 0-10.
    """
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comment on the pain score measurement, including comments on for example the circumstances and/or disruptive factors that may influence the result."
* method
  * ^short = "PainMeasuringMethod"
  * ^alias[+] = "PijnMeetmethode"
  * ^definition = "The measuring method describes the method used to determine the pain score. The measurement involves a visualization of the pain scale."
  * ^comment = "PijnMeetmethodeCodelijst uses codes from a custom code system. Although more standardized LOINC codes are available for VAS and NRS, these are about the *result* of the measurement (as determined by the method) rather than the method itself, and thus are not suitable as a drop-in replacement (they should be used on `Observation.code` rather than `Observation.method`). In future versions of the zib, the data model may be redesigned to adopt these standardized codes. See [ZIB-2199](https://nictiz.atlassian.net/browse/ZIB-2199) for more information."

Invariant: zib-PainScore-1
Description: "The maximum value is 10 if method is VAS10 or NRS, or 100 if method is VAS100"
Severity: #error
Expression: "(method.coding.code in ('VAS10' | 'NRS') implies value <= 10) and (method.coding.code = 'VAS100' implies value <= 100)"

Invariant: zib-PainScore-2
Description: "The minimum value is 0"
Severity: #error
Expression: "value >= 0"

Mapping: NlbasePainScore-to-zib-painscore-v4.0-2020EN
Id: zib-painscore-v4.0-2020EN
Title: "zib PainScore-v4.0(2020EN)"
Source: NlbasePainScore
Target: "https://zibs.nl/wiki/PainScore-v4.0(2020EN)"
*  -> "NL-CM:12.9.1" "PainScore"
* effectiveDateTime -> "NL-CM:12.9.3" "PainScoreDateTime"
* valueInteger -> "NL-CM:12.9.2" "PainScoreValue"
* note.text -> "NL-CM:12.9.5" "Comment"
* method -> "NL-CM:12.9.4" "PainMeasuringMethod"
