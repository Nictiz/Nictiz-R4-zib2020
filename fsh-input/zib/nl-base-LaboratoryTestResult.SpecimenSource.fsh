Profile: NlbaseLaboratoryTestResultSpecimenSource
Parent: Device
Id: nl-base-LaboratoryTestResult.SpecimenSource
Title: "nl base LaboratoryTestResult.SpecimenSource"
* insert ProfileMetadata(nl-base-LaboratoryTestResult.SpecimenSource)
* ^purpose = "This Device resource represents the SpecimenSource concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LaboratoryTestResult v4.6 (2020)](https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN))."


// Short, alias, definition and comment texts
* ^description = "Source of obtained specimen material or a microbial isolate that is used in a laboratory analysis."
* . ^comment = "The Device container from Dutch zib LaboratoryTestResult contains the concept for SpecimenSource."
* deviceName.name
  * ^short = "SpecimenSource"
  * ^alias[+] = "BronMonster"
  * ^definition = "If the material is not collected directly from the patient but comes from a patient-related object, e.g. a cathetertip, this source of material can be recorded here."
* deviceName.type
  * ^definition = "The type of name the device is referred by."
  * ^comment = "If type is unknown, use value `other`."

Mapping: NlbaseLaboratoryTestResultSpecimenSource-to-zib-laboratorytestresult-v4.6-2020EN
Id: zib-laboratorytestresult-v4.6-2020EN
Title: "zib LaboratoryTestResult-v4.6(2020EN)"
Source: NlbaseLaboratoryTestResultSpecimenSource
Target: "https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN)"
* deviceName.name -> "NL-CM:13.1.29" "SpecimenSource"
