Profile: NlcoreTextResult
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-TextResult
Id: nl-core-TextResult
Title: "nl core TextResult"
* insert ProfileMetadata(nl-core-TextResult)
* insert Purpose(TextResult, 4.4, DiagnosticReport)

* status from http://hl7.org/fhir/ValueSet/diagnostic-report-status|4.0.1 (required)
* status.extension[textResultStatus] ..1
* status.extension[textResultStatus].value[x] ^binding.strength = #extensible
* code ^binding.strength = #extensible
* media.link only Reference(Media or http://nictiz.nl/fhir/StructureDefinition/nl-core-TextResult.VisualResult)

// Short, alias, definition and comment texts
* ^description = "Textual results describe the findings and interpretation of diagnostic or therapeutic procedures carried out on patients or on specimens from the patient."
* .
  * ^alias[+] = "nl-core-TextResult"
  * ^comment = """
    Zib TextResult is mapped to this DiagnosticReport profile and a profile on Media (<http://nictiz.nl/fhir/StructureDefinition/nl-core-TextResult.VisualResult>). This DiagnosticReport profile acts as the focal resource of zib TextResult. This profile references the Media resource through `.media.link` that holds the VisualResult information.
    
    Please note that on a functional level, zib TextResult references zib Procedure, but in FHIR this direction is reversed. Therefore, the concept Procedure (NL-CM:13.2.5) is mapped on `Procedure.report` in profile [nl-core-Procedure-event](http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-event) instead of in this profile.
    """
