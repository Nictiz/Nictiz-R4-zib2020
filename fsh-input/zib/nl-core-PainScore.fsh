Profile: NlcorePainScore
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-PainScore
Id: nl-core-PainScore
Title: "nl core PainScore"
* insert ProfileMetadata(nl-core-PainScore)
* insert Purpose(PainScore, 4.0, Observation)

* . obeys zib-PainScore-1 and zib-PainScore-2
* note ..1
* method ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    The pain score is a general measurement for pain experience, not a description of specific, localized pain.
    
    The following are used as an easily reproducible measurement for pain experience:
    NRS (Numeric Rating Scale) in which the patient gives the pain a number on a scale of 1 (no pain) to 10 (unbearable pain).
    VAS (Visual Analogue Score), in which the patient points to a bar with a line to indicate the pain they feel. The back of the bar has a scale from 0 (no pain) to 10 (unbearable pain) on it.
    
    The results of both scores have the same meaning, but the visual analogue method (VAS) is seen as more reliable than the NRS pain score.
    """
* . ^alias[+] = "nl-core-PainScore"
