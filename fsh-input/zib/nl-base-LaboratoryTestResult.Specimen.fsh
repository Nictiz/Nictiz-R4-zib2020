Profile: NlbaseLaboratoryTestResultSpecimen
Parent: Specimen
Id: nl-base-LaboratoryTestResult.Specimen
Title: "nl base LaboratoryTestResult.Specimen"
* insert ProfileMetadata(nl-base-LaboratoryTestResult.Specimen)
* ^purpose = "This Specimen resource represents the Specimen concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) LaboratoryTestResult v4.6 (2020)](https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN))."

* type from http://nictiz.nl/fhir/ValueSet/Monstermateriaal-en-Microorganisme-Codelijsten (preferred)
* subject only Reference(Patient or Group or Device or Substance or Location or http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult.SpecimenSource)
* parent only Reference(Specimen or http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult.Specimen)
* collection.collected[x] insert Discriminator(type, $this)
* collection.collectedDateTime only dateTime
* collection.collectedPeriod only Period
* collection.method from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.2--20200901000000 (preferred)
* collection.bodySite insert PatternNlBaseAnatomicalLocation
* collection.bodySite.extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-LaboratoryTestResult.Specimen.Morphology named morphology 0..1
* container.extension contains
    http://hl7.org/fhir/StructureDefinition/specimen-sequenceNumber named specimenNumberExtension 0..*
* container.type from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.1.9--20200901000000 (preferred)

// Short, alias, definition and comment texts
* ^description = "Obtained specimen material or a microbial isolate that is used in a laboratory analysis."
* .
  * ^short = "Specimen"
  * ^alias[+] = "Monster"
  * ^comment = "The Specimen concept from Dutch zib LaboratoryTestResult contains a concept for SpecimenMaterial and for Microorganism (isolated from the specimen material). These two concepts cannot be represented in the same Specimen resources; if there's a need to communicate both the microorganism and the sample material from which it was isolated, two instances need to be used. The instance representing the microorganism should refer in this case to the instance representing the sample material using `Specimen.parent`. All other zib concepts should be repeated in both resources."
* identifier
  * ^short = "SpecimenId"
  * ^alias[+] = "Monsternummer"
  * ^definition = "Identification number of the material obtained, as a reference for inquiries to the source organization. In a transmural setting, this number will consist of a specimen number including the identification of the issuing organization, to be unique outside of the borders of an organization."
* type
  * ^short = "SpecimenMaterial / Microorganism"
  * ^alias[+] = "Monstermateriaal"
  * ^alias[+] = "Microorganisme"
  * ^definition = """
    * SpecimenMaterial describes the material obtained. If the LOINC test code also implicitly describes a material, this element may not conflict with the description. If desired, this component can provide a more detailed description of the material: LOINC codes only contain the materials at a main level. This is in line with the agreements made in the IHE/Nictiz program e-Lab.
    * In particular in microbiological determinations the subject of the test is an isolate of a certain microorganism rather then a material. This concept provides the ability to capture information about this microorganism.
    """
  * ^comment = """
    The Specimen concept from Dutch zib LaboratoryTestResult contains a concept for SpecimenMaterial and for Microorganism (isolated from the specimen material). These two concepts cannot be represented in the same Specimen resource; this `Specimen.type` element defines which of the two concepts is represented.
    
    If there's a need to communicate both the microorganism and the sample material from which it was isolated, two instances need to be used. The instance representing the microorganism should refer in this case to the instance respresenting the sample material using `Specimen.parent`.
    
    If this resource represents material and is carried out on derived material (such as plasma), this element will still contain the material drawn (in this case, blood). In this case, the LOINC code will generally refer to plasma.
    """
* subject
  * ^short = "SpecimenSource"
  * ^alias[+] = "BronMonster"
  * ^definition = "If the material is not collected directly from the patient but comes from a patient-related object, e.g. a cathetertip, this source of material can be recorded here."
  * ^comment = "If zib concept SpecimenSource (NL-CM:13.1.29) is used, it can be recorded here using a reference to an instance of the [nl-base-LaboratoryTestResult.SpecimenSource](http://nictiz.nl/fhir/StructureDefinition/nl-base-LaboratoryTestResult.SpecimenSource) profile."
* receivedTime
  * ^short = "ReceivedDateTime"
  * ^alias[+] = "AannameDatumTijd"
  * ^definition = "Date and time that the material is handed over at the laboratory or specimen collection center. This is the issue with material that is collected by the patient himself."
* parent ^comment = "When this resource represents a microorganism (that is, `Specimen.type` represents the zib concept Microorganism (NL-CM:13.1.22) and contains a code from MicroorganismeCodelijst), this reference can be used to refer to the source material from which it was isolated. In this case, the referenced resource should have `Specimen.type` represent the zib concept SpecimenMaterial (NL-CM:13.1.16) and contain a code from MonstermateriaalCodelijst."
* collection.collectedDateTime
  * ^short = "CollectionDateTime"
  * ^alias[+] = "AfnameDatumTijd"
  * ^definition = "Date and time at which the material was collected."
* collection.collectedPeriod
  * ^short = "CollectionPeriod"
  * ^alias[+] = "Verzamelperiode"
  * ^definition = "If the material has not been collected at a single point in time but over a certain period, this period can be captured in this concept. An example is 24 hour urine."
* collection.duration
  * ^short = "CollectionPeriod"
  * ^alias[+] = "Verzamelperiode"
  * ^definition = "If the material has not been collected at a single point in time but over a certain period, this period can be captured in this concept. An example is 24 hour urine."
* collection.quantity
  * ^short = "CollectedVolume"
  * ^alias[+] = "Verzamelvolume"
  * ^definition = "Total volume of the collected material. If it is necessary to determine the absolute amount of a particular substance in the collected material, the volume thereof must be given."
* collection.method
  * ^short = "CollectionMethod"
  * ^alias[+] = "Afnameprocedure"
  * ^definition = "If relevant for the results, the method of obtaining the specimen can be entered as well."
* collection.bodySite
  * ^short = "Location / AnatomicalLocation"
  * ^alias[+] = "AnatomischeLocatie"
  * ^definition = "Anatomic location where the material is collected, e.g. elbow."
* container.extension[specimenNumberExtension].value[x]
  * ^short = "SpecimenNumberExtension"
  * ^alias[+] = "Monstervolgnummer"
  * ^definition = "The specimen number extension is used when the collected material is distributed from the original tube or container across multiple tubes. In combination with the specimen Id the extension yield a unique identification of the tube or container."
* container.type
  * ^short = "ContainerType"
  * ^alias[+] = "Containertype"
  * ^definition = "Container type describes the envelope in which the material is collected or sent. Examples include blood tubes, transport container, possibly including culture medium."
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "Comments on the specimen , such as drawing material after a (glucose) stimulus or taking medicine."

Mapping: NlbaseLaboratoryTestResultSpecimen-to-zib-laboratorytestresult-v4.6-2020EN
Id: zib-laboratorytestresult-v4.6-2020EN
Title: "zib LaboratoryTestResult-v4.6(2020EN)"
Source: NlbaseLaboratoryTestResultSpecimen
Target: "https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN)"
*  -> "NL-CM:13.1.2" "Specimen"
* identifier -> "NL-CM:13.1.15" "SpecimenId"
* type -> "NL-CM:13.1.16" "SpecimenMaterial"
* type -> "NL-CM:13.1.22" "Microorganism"
* subject -> "NL-CM:13.1.29" "SpecimenSource"
* receivedTime -> "NL-CM:13.1.25" "ReceivedDateTime"
* collection.collectedDateTime -> "NL-CM:13.1.17" "CollectionDateTime"
* collection.collectedPeriod -> "NL-CM:13.1.24" "CollectionPeriod"
* collection.duration -> "NL-CM:13.1.24" "CollectionPeriod"
* collection.quantity -> "NL-CM:13.1.23" "CollectedVolume"
* collection.method -> "NL-CM:13.1.18" "CollectionMethod"
* collection.bodySite -> "NL-CM:13.1.36" "AnatomicalLocation"
* container.extension[specimenNumberExtension].value[x] -> "NL-CM:13.1.20" "SpecimenNumberExtension"
* container.type -> "NL-CM:13.1.21" "ContainerType"
* note.text -> "NL-CM:13.1.19" "Comment"
