Profile: NlbaseTextResult
Parent: DiagnosticReport
Id: nl-base-TextResult
Title: "nl base TextResult"
* insert ProfileMetadata(nl-base-TextResult)
* insert Purpose(TextResult, 4.4, DiagnosticReport)

* status from http://hl7.org/fhir/ValueSet/diagnostic-report-status|4.0.1 (required)
* status insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/TekstStatusCodelijst-to-DiagnosticReportStatus, TekstStatusCodelijst_to_DiagnosticReportStatus, DiagnosticReportStatus)
* status.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification named textResultStatus 0..1
* status.extension[textResultStatus].value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.2.2--20200901000000 (preferred)
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.2.1--20200901000000 (preferred)
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* media.link only Reference(Media or http://nictiz.nl/fhir/StructureDefinition/nl-base-TextResult.VisualResult)

// Short, alias, definition and comment texts
* ^description = "Textual results describe the findings and interpretation of diagnostic or therapeutic procedures carried out on patients or on specimens from the patient."
* .
  * ^short = "TextResult"
  * ^alias[+] = "TekstUitslag"
  * ^comment = """
    Zib TextResult is mapped to this DiagnosticReport profile and a profile on Media (<http://nictiz.nl/fhir/StructureDefinition/nl-base-TextResult.VisualResult>). This DiagnosticReport profile acts as the focal resource of zib TextResult. This profile references the Media resource through `.media.link` that holds the VisualResult information.
    
    Please note that on a functional level, zib TextResult references zib Procedure, but in FHIR this direction is reversed. Therefore, the concept Procedure (NL-CM:13.2.5) is mapped on `Procedure.report` in profile [nl-base-Procedure-event](http://nictiz.nl/fhir/StructureDefinition/nl-base-Procedure-event) instead of in this profile.
    """
* status
  * ^short = "TextResultStatus"
  * ^alias[+] = "TekstUitslagStatus"
  * ^definition = "The status of the result."
  * ^comment = "Additional information about the mapping of the optional (`0..1`) TextResultStatus to the mandatory (`1..1`) `.status`: because `.status` is `1..1` implementers shall have to support `.status` one way or another although the _unknown_ code can be used as a fallback. When TextResultStatus is absent, other codes may be used than from the zib. In that case, the ext-CodeSpecification extension should be omitted."
* status.extension[textResultStatus].value[x]
  * ^short = "TextResultStatus"
  * ^alias[+] = "TekstUitslagStatus"
  * ^definition = "The status of the result."
* code
  * ^short = "TextResultType"
  * ^alias[+] = "TekstUitslagType"
  * ^definition = "The type of result."
* effectiveDateTime
  * ^short = "TextResultDateTime"
  * ^alias[+] = "TekstUitslagDatumTijd"
  * ^definition = "Date and if possible time of the result report."
* conclusion
  * ^short = "TextResultReport"
  * ^alias[+] = "TekstResultaat"
  * ^definition = "The text report detailing the actual results of the test or procedure."

Mapping: NlbaseTextResult-to-zib-textresult-v4.4-2020EN
Id: zib-textresult-v4.4-2020EN
Title: "zib TextResult-v4.4(2020EN)"
Source: NlbaseTextResult
Target: "https://zibs.nl/wiki/TextResult-v4.4(2020EN)"
*  -> "NL-CM:13.2.1" "TextResult"
* status -> "NL-CM:13.2.6" "TextResultStatus"
* status.extension[textResultStatus].value[x] -> "NL-CM:13.2.6" "TextResultStatus"
* code -> "NL-CM:13.2.4" "TextResultType"
* effectiveDateTime -> "NL-CM:13.2.3" "TextResultDateTime"
* conclusion -> "NL-CM:13.2.2" "TextResultReport"
