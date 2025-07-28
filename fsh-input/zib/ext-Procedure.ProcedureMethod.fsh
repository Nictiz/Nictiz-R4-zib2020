Extension: ExtProcedureProcedureMethod
Id: ext-Procedure.ProcedureMethod
Title: "ext Procedure.ProcedureMethod"
Context: Procedure
* insert ProfileMetadata(ext-Procedure.ProcedureMethod)

* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.14.1.4--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "An extension to provide the method or technique that was used to perform the procedure, e.g. approach, lavage, pressuring, etc."
* value[x]
  * ^short = "ProcedureMethod"
  * ^alias[+] = "VerrichtingMethode"
  * ^definition = "The method or technique that was used to perform the procedure, e.g. approach, lavage, pressuring, etc."

Mapping: ExtProcedureProcedureMethod-to-zib-procedure-v5.2-2020EN
Id: zib-procedure-v5.2-2020EN
Title: "zib Procedure-v5.2(2020EN)"
Source: ExtProcedureProcedureMethod
Target: "https://zibs.nl/wiki/Procedure-v5.2(2020EN)"
* value[x] -> "NL-CM:14.1.12" "ProcedureMethod"
