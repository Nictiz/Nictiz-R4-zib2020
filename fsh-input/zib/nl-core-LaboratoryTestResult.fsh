Profile: NlcoreLaboratoryTestResult
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult
Id: nl-core-LaboratoryTestResult
Title: "nl core LaboratoryTestResult"
* insert ProfileMetadata(nl-core-LaboratoryTestResult)
* insert Purpose(LaboratoryTestResult, 4.6, Observation)

* extension[sequelTo].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/Observation or http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult)
* status from http://hl7.org/fhir/ValueSet/observation-status|4.0.1 (required)
* category 1..
* category[laboratoryCategory] 1..1
* category[resultType] ..1
* category[resultType] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.1--20200901000000 (required)
* code from http://nictiz.nl/fhir/ValueSet/TestCode-en-Onderzoek-Codelijsten (required)
* performer[performer] ..1
* performer[performer] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
* interpretation[resultFlags] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.7--20200901000000 (extensible)
* interpretation[resultFlags].coding 1..
* interpretation[resultInterpretation] ..1
* interpretation[resultInterpretation].coding ..0
* note ..1
* method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.4--20200901000000 (required)
* specimen only Reference(http://hl7.org/fhir/StructureDefinition/Specimen or http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult.Specimen)
* hasMember[laboratoryTest] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult)

// Short, alias, definition and comment texts
* ^description = """
    A laboratory result describes the result of a laboratory analysis.
    These are specimen-oriented tests as performed in laboratories such as Clinical Chemistry, Serology, Microbiology, etc.
    In addition to the results of tests with a singular result, this concept can also contain the results of more complex tests with multiple results or a ‘panel’.
    """
* . ^alias[+] = "nl-core-LaboratoryTestResult"
