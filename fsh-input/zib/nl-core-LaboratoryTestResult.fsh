Profile: NlcoreLaboratoryTestResult
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult
Id: nl-core-LaboratoryTestResult
Title: "nl core LaboratoryTestResult"
* insert ProfileMetadata(nl-core-LaboratoryTestResult)
* insert Purpose(LaboratoryTestResult, 4.6, Observation)

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-EdifactReferenceNumber named edifactReferenceNumber 0..1 and
    http://nictiz.nl/fhir/StructureDefinition/ext-CopyIndicator named copyIndicator 0..1
* extension[sequelTo].value[x] only Reference(Observation or http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult)
* category 1..
* category[laboratoryCategory] 1..1
* category[resultType] ..1
* category[resultType] ^binding.strength = #required
* code from http://nictiz.nl/fhir/ValueSet/TestCode-en-Onderzoek-Codelijsten (required)
* insert NlCorePatientForObservation
* performer[performer] ..1
* performer[performer] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
* interpretation[resultFlags] ^binding.strength = #extensible
* interpretation[resultFlags].coding 1..
* interpretation[resultInterpretation] ..1
* interpretation[resultInterpretation].coding ..0
* note ..1
* method ^binding.strength = #required
* specimen only Reference(Specimen or http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult.Specimen)
* hasMember[laboratoryTest] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-LaboratoryTestResult)

// Short, alias, definition and comment texts
* ^description = """
    A laboratory result describes the result of a laboratory analysis.
    These are specimen-oriented tests as performed in laboratories such as Clinical Chemistry, Serology, Microbiology, etc.
    In addition to the results of tests with a singular result, this concept can also contain the results of more complex tests with multiple results or a ‘panel’.
    """
* . ^alias[+] = "nl-core-LaboratoryTestResult"
* performer[performer] ^definition = """
    The organization where or by whom the LaboratoryTestResult was performed.
    
    Note: the zib formally defines this relation as a reference to zib HealthcareProvider, which is primarily defined as the location at which the service was performed, and only secondarily as the organization associated with this location. According to this logic, the expected reference would be to the zib HealthcareProvider Location profile (<http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider>) rather than the Organization profile (<http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization>). However, on a functional level this concept is usually understood to be about the organization rather than the location, which is in line with the way FHIR models the current element. For this reason, the Organization rather than the Location resource is referenced here. See https://bits.nictiz.nl/browse/MM-4747 for more information.
    """

Mapping: NlcoreLaboratoryTestResult-to-lu-dataset-laboratory-exchange-20210222
Id: lu-dataset-laboratory-exchange-20210222
Title: "ART-DECOR Dataset Lab Exchange 20210222T00:00:00"
Source: NlcoreLaboratoryTestResult
Target: "https://decor.nictiz.nl/ad/#/lu-/datasets/dataset/2.16.840.1.113883.2.4.3.11.60.25.1.2/2021-02-22T00:00:00"
* identifier -> "lu-concept-v2-4296" "LaboratoriumUitslagIdentificatie"
* identifier -> "lu-concept-v2-4298" "TestIdentificatie"