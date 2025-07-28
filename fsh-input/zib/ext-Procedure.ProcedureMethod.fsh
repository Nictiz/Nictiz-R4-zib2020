Extension: ExtProcedureProcedureMethod
Id: ext-Procedure.ProcedureMethod
Title: "ext Procedure.ProcedureMethod"
Context: Procedure
* insert ProfileMetadata(ext-Procedure.ProcedureMethod)

* value[x] only CodeableConcept
* value[x] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.14.1.4--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "An extension to provide the method or technique that was used to perform the procedure, e.g. approach, lavage, pressuring, etc."
* ^purpose = "This extension represents the ProcedureMethod concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Procedure v5.2 (2020)](https://zibs.nl/wiki/Procedure-v5.2(2020EN)). The FHIR procedure method extension (http://hl7.org/fhir/StructureDefinition/procedure-method) cannot be used in R4 because it has a `0..1` cardinality which does not match the zib cardinality of `0..*` for this concept. The next release of FHIR, R5, will fix the cardinality to `0..*` (https://jira.hl7.org/browse/FHIR-30769) allowing the replacement of this extension with the HL7 FHIR core extension."
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
