Profile: NlbaseLaboratoryTestResult
Parent: Observation
Id: nl-base-LaboratoryTestResult
Title: "nl base LaboratoryTestResult"
* insert ProfileMetadata(nl-base-LaboratoryTestResult)
* insert Purpose(LaboratoryTestResult, 4.6, Observation)

* extension contains
    http://hl7.org/fhir/StructureDefinition/observation-sequelTo named sequelTo 0..*
* extension[sequelTo].value[x] only Reference(Observation or http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult)
* status insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/TestUitslagStatusCodelijst-to-ObservationStatus)
* status from http://hl7.org/fhir/ValueSet/observation-status|4.0.1 (required)
* category insert Discriminator(value, $this)
* category contains
    laboratoryCategory 0..1 and
    resultType 0..1
* category[laboratoryCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* category[resultType] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.1--20200901000000 (preferred)
* code from http://nictiz.nl/fhir/ValueSet/TestCode-en-Onderzoek-Codelijsten (preferred)
* effective[x] insert Discriminator(type, $this)
* effectiveDateTime only dateTime
* performer insert Discriminator(profile, resolve(\))
* performer contains
    performer 0..1
* performer[performer] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider-Organization)
* interpretation insert Discriminator(exists, coding)
* interpretation contains
    resultFlags 0.. and
    resultInterpretation 0..1
* interpretation[resultFlags] insert PermittedValues(http://nictiz.nl/fhir/ConceptMap/InterpretatieVlaggenCodelijst-to-ObservationInterpretationCodes)
* interpretation[resultFlags] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.7--20200901000000 (extensible)
* method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.4--20200901000000 (preferred)
* specimen only Reference(Specimen or http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult.Specimen)
* hasMember insert Discriminator(profile, resolve(\))
* hasMember contains
    laboratoryTest 0..
* hasMember[laboratoryTest] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult)

// Short, alias, definition and comment texts
* ^description = """
    A laboratory result describes the result of a laboratory analysis.
    These are specimen-oriented tests as performed in laboratories such as Clinical Chemistry, Serology, Microbiology, etc.
    In addition to the results of tests with a singular result, this concept can also contain the results of more complex tests with multiple results or a ‘panel’.
    """
* .
  * ^short = "LaboratoryTestResult / LaboratoryTest"
  * ^alias[+] = "LaboratoriumUitslag"
  * ^alias[+] = "LaboratoriumTest"
  * ^definition = "An instance of zib LaboratoryTestResult or of a single LaboratoryTest within this zib."
  * ^comment = """
    **1. Guidance on use for singular tests and panels**
    
    The zib LaboratoryTestResult captures both singular laboratory tests and panels/clusters of multiple related tests requested together (e.g. blood gases and EBV serology)*. This profile should be used slightly different in these two situations:
    
    * For singular laboratory test results
        * A single instance of this profile is to be used.
        * `Observation.code` represents zib concept TestCode (NL-CM:13.1.8, the name and code of the executed test) while zib concept PanelOrBattery (NL-CM:13.1.4, the name and code of the compound test) is not expected to be present.
        * `Observation.status` represents zib concept TestResultStatus (NL-CM:13.1.31, the status of the test result). ResultStatus (NL-CM:13.1.6) is redundant in this situation and not expected to be present.
    * For a panel or cluster:
        * There is a single instance for the overall result plus an instance for each individual test result.
        * The concepts Comment (NL-CM:13.1.5, `Observation.note`), ResultType (NL-CM:13.1.7, `Observation.category:resultType`) and Performer (NL-CM:13.1.35, `Observation.performer`) are repeated in the instance for the overall result and in all instances for the individual test results.
        * For the instance representing the overall result:
          * `Observation.code` represents zib concept PanelOrBattery (NL-CM:13.1.4, the name and code of the compound test), which is required for panels/clusters.
          * `Observation.status` represents zib concept ResultStatus (NL-CM:13.1.6, the overall status of the test result). This status should be in accordance with the statuses of each individual test.
          * The instances representing the individual test results are referenced using `Observation.hasMember:laboratoryTest`.
        * For the instances representing the individual test results:
          * `Observation.code` represents zib concept TestCode (NL-CM:13.1.8, the name and code of the executed test) for that particular test.
          * `Observation.status` represents zib concept TestResultStatus (NL-CM:13.1.31, the status of the test result) for that particular test.
    
    Note 1: The zib also recognizes the RelatedResult concept (NL-CM:13.1.33). This is unrelated to the use of panels/clusters. This concept is represented using `Observation.extension:sequelTo`.
    
    **2. Unmapped zib concepts**
    
    * The zib concept Requester (NL-CM:13.1.34) is not implemented because it is deemed unimplementable as-is. It will be removed in the next version of the zib (see <https://bits.nictiz.nl/browse/ZIB-1269> for more information).
    * The zib concept InterpretationMethod (NL-CM:13.1.30) is not implemented because there's no obvious mapping to FHIR while the definition is problematic and there doesn't seem to be a use case for exchanging this information (see <https://bits.nictiz.nl/browse/ZIB-1292> for more information).
    """
* extension[sequelTo].value[x]
  * ^short = "RelatedResult"
  * ^alias[+] = "GerelateerdeUitslag"
  * ^definition = "Reference to related tests, e.g. paired tests or sequential tests like gram staining and microbiological cultures."
* status
  * ^short = "ResultStatus / TestResultStatus"
  * ^alias[+] = "TestUitslagStatus"
  * ^alias[+] = "ResultaatStatus"
  * ^definition = "The status of the laboratory test result or test result panel/cluster."
  * ^comment = "If this resource represents a singular test result or a single test in a cluster/panel, this will be the status of this particular test result. However, if it represents the overall result of a panel/cluster, this status should represent the status of the panel/cluster and should be in accordance with the test result statuses of the individual tests."
* category[resultType]
  * ^short = "ResultType"
  * ^alias[+] = "ResultaatType"
  * ^definition = "The type of result defines the laboratory specialty under which the test is categorized."
* code
  * ^short = "PanelOrBattery / TestCode"
  * ^alias[+] = "Onderzoek"
  * ^alias[+] = "TestCode"
  * ^definition = "The name and code of the executed test. For laboratory tests comprising multiple subtests and often requested together as a whole, this concept contains the name and code of the compound request (often indicated as a ‘panel’, ‘battery’ or ‘cluster’). Examples include: blood gases and EBV serology."
  * ^comment = "When this resource represents a singular laboratory test result, the code MUST come from either [TestCodeNHGCodelijst](http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.16--20200901000000) (representing NHG Tabel 45) or [TestCodeLOINCCodelijst](http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.3--20200901000000) (representing the Nederlandse Labcodeset). When this resource represents the overall result of a panel/cluster, the code MUST come from [OnderzoekCodelijst](http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.5--20200901000000) (representing LOINC). See the root of this profile for guidance."
* effectiveDateTime
  * ^short = "TestDateTime"
  * ^alias[+] = "TestDatumTijd"
  * ^definition = "The date and if possible the time at which the test was carried out."
* performer[performer]
  * ^short = "Performer"
  * ^alias[+] = "Uitvoerder"
  * ^definition = """
    The organization where or by whom the LaboratoryTestResult was performed.
    
    Note: the zib formally defines this relation as a reference to zib HealthcareProvider, which is primarily defined as the location at which the service was performed, and only secondarily as the organization associated with this location. According to this logic, the expected reference would be to the zib HealthcareProvider Location profile (<http://nictiz.nl/fhir/StructureDefinition/zib-HealthcareProvider>) rather than the Organization profile (<http://nictiz.nl/fhir/StructureDefinition/zib-HealthcareProvider-Organization>). However, on a functional level this concept is usually understood to be about the organization rather than the location, which is in line with the way FHIR models the current element. For this reason, the Organization rather than the Location resource is referenced here. See https://bits.nictiz.nl/browse/MM-4747 for more information.
    """
* value[x]
  * ^short = "TestResult"
  * ^alias[+] = "TestUitslag"
  * ^definition = "The test result. Depending on the type of test, the result will consist of a value with a unit or a coded value (ordinal or nominal)."
* interpretation[resultFlags]
  * ^short = "ResultFlags"
  * ^alias[+] = "InterpretatieVlaggen"
  * ^definition = "Attention codes indicating whether the result of a quantitative test is above or below certain reference values or interpreting the result otherwise. The values Resistant, Intermediate and Susceptible are used with microbiological test results."
* interpretation[resultInterpretation].text
  * ^short = "ResultInterpretation"
  * ^alias[+] = "UitslagInterpretatie"
  * ^definition = "Comment of the laboratory specialist regarding the interpretation of the results"
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comments, such as a textual interpretation or advice accompanying the result, for example."
* method
  * ^short = "TestMethod"
  * ^alias[+] = "Testmethode"
  * ^definition = "The test method used to obtain the result."
* specimen ^comment = """
    The Specimen concept of the zib defines either the collected source material without further processing, or a microorganism, optionally including the source material from which it whas isolated.
    
    * If the Specimen pertains a material (zib concept SpecimenMaterial), the `Specimen.type` of the resource referenced here should contain a coding indicating a specimen material.
    * If the Specimen pertains a microorganism (zib concept Microorganism), the `Specimen.type` of the resource referenced here should contain a coding indicating the microorganims. If required, the sample material from which the microorganism was isolated can be referenced using `Specimen.parent` on that resource, but it is not referenced here.
    """
* referenceRange.low
  * ^short = "ReferenceRangeLowerLimit"
  * ^alias[+] = "ReferentieOndergrens"
  * ^definition = "The lower reference limit for the patient of the value measured with the test."
  * ^comment = "The zib concepts ReferenceRangeUpperLimit and ReferenceRangeLowerLimit are defined as datatype ANY, but they only have meaning if the result of the test (zib concept TestResult) is expressed using the Quantity datatype. Therefore, this element is only to be used if `Observation.valueQuantity` is populated, and should be in the same unit. This will be made explicit in future versions of the zib: see <https://bits.nictiz.nl/browse/ZIB-1703>."
* referenceRange.high
  * ^short = "ReferenceRangeUpperLimit"
  * ^alias[+] = "ReferentieBovengrens"
  * ^definition = "The upper reference limit for the patient of the value measured in the test."
  * ^comment = "The zib concepts ReferenceRangeUpperLimit and ReferenceRangeLowerLimit are defined as datatype ANY, but they only have meaning if the result of the test (zib concept TestResult) is expressed using the Quantity datatype. Therefore, this element is only to be used if `Observation.valueQuantity` is populated, and should be in the same unit. This will be made explicit in future versions of the zib: see <https://bits.nictiz.nl/browse/ZIB-1703>."
* hasMember ^comment = "When this resource is used to represent the overall result of a panel/cluster of laboratory tests, the individual test results SHOULD be referenced here. See the root of this profile for guidance."
* hasMember[laboratoryTest]
  * ^short = "LaboratoryTest"
  * ^alias[+] = "LaboratoriumTest"
  * ^definition = "Individual laboratory tests if the current Observation resource represents a panel or cluster."
  * ^comment = "See the root comment for guidance on representing singular laboratory test results versus panels/clusters."

Mapping: NlbaseLaboratoryTestResult-to-zib-laboratorytestresult-v4.6-2020EN
Id: zib-laboratorytestresult-v4.6-2020EN
Title: "zib LaboratoryTestResult-v4.6(2020EN)"
Source: NlbaseLaboratoryTestResult
Target: "https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN)"
*  -> "NL-CM:13.1.1" "LaboratoryTestResult"
*  -> "NL-CM:13.1.3" "LaboratoryTest"
* extension[sequelTo].value[x] -> "NL-CM:13.1.33" "RelatedResult"
* status -> "NL-CM:13.1.6" "ResultStatus"
* status -> "NL-CM:13.1.31" "TestResultStatus"
* category[resultType] -> "NL-CM:13.1.7" "ResultType"
* code -> "NL-CM:13.1.4" "PanelOrBattery"
* code -> "NL-CM:13.1.8" "TestCode"
* effectiveDateTime -> "NL-CM:13.1.13" "TestDateTime"
* performer[performer] -> "NL-CM:13.1.35" "Performer"
* value[x] -> "NL-CM:13.1.10" "TestResult"
* interpretation[resultFlags] -> "NL-CM:13.1.14" "ResultFlags"
* interpretation[resultInterpretation].text -> "NL-CM:13.1.32" "ResultInterpretation"
* note.text -> "NL-CM:13.1.5" "Comment"
* method -> "NL-CM:13.1.9" "TestMethod"
* referenceRange.low -> "NL-CM:13.1.12" "ReferenceRangeLowerLimit"
* referenceRange.high -> "NL-CM:13.1.11" "ReferenceRangeUpperLimit"
* hasMember[laboratoryTest] -> "NL-CM:13.1.3" "LaboratoryTest, if these are part of a panel/cluster"
