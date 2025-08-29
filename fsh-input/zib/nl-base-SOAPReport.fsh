Profile: NlbaseSOAPReport
Parent: Composition
Id: nl-base-SOAPReport
Title: "nl base SOAPReport"
* insert ProfileMetadata(nl-base-SOAPReport)
* insert Purpose(SOAPReport, 1.0, Composition)

* type = http://snomed.info/sct#11591000146107
* author only Reference(Practitioner or PractitionerRole or Device or Patient or RelatedPerson or Organization or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)
* section insert Discriminator(value, code)
* section contains
    soapLine 0..4
* section[soapLine].code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.13.6.2--20200901000000 (preferred)
* section[soapLine].entry only Reference(Resource or http://nictiz.nl/fhir/StructureDefinition/nl-base-SOAPReport.SOAPLine)

// Short, alias, definition and comment texts
* ^description = """
    A SOAP report is a textual report of a (partial) consult with relation to a single problem according to the SOAP structure. SOAP (acronym for subjective, objective, assessment, plan) is a method used by health professionals to structurally record information that comes up during contact between the patient and a health professionals in the patient's record. The following standardized format is used for reporting:
    
    * Subjective: the patient's complaint and request for help and the amnesic data
    * Objective: the findings from the physical and supplementary examination.
    * Assessment: the working hypothesis and the thinking process, for example a differential diagnosis of the healthcare professional.
    * Plan: the diagnostic plan or treatment plan and what has been discussed or agreed with the patient.
    
    The SOAP report is mainly used in general practice care.
    
    Note: the zib doesn't state explicitly if zib SOAPReport pertains a consult or a partial consult, but it has become clear that the zib, and thus this profile, should be interpreted as a partial consult with relation to a single problem (see <https://bits.nictiz.nl/browse/ZIB-1474>). The text above has been adjusted according to this insight.
    """
* .
  * ^short = "SOAPReport"
  * ^alias[+] = "SOEPVerslag"
  * ^comment = """
    Zib SOAPReport is implemented using two profiles: this profile implements the SOAPReport concept of the zib, while <http://nictiz.nl/fhir/StructureDefinition/nl-base-SOAPReport.SOAPLine> represents the SOAPLine concept of the zib which is referenced by `.section.entry`. 
    The Composition resource SHOULD hold a summary in the `.section.text` elements of the information found in the referenced SOAPReport.SOAPLine profile.
    """
* status ^comment = "Unless the status is explicitly recorded it is expected that only _final_ reports are exchanged."
* date
  * ^short = "SOAPReportDateTime"
  * ^alias[+] = "SOEPVerslagDatumTijd"
  * ^definition = "Date and time when the report was recorded"
* author
  * ^short = "Author"
  * ^alias[+] = "Auteur"
  * ^definition = "The healthcare provider who prepared the report and who is responsible for its content."
  * insert PatternNlBaseHealthProfessional
* title ^definition = "Official human-readable label for the composition. Suggested value is the ICPC display name on the A entry."
* section[soapLine]
  * ^short = "SOAPLine"
  * ^alias[+] = "SOEPRegel"
* section[soapLine].code
  * ^short = "SOAPLineHeader"
  * ^alias[+] = "SOEPRegelNaam"
  * ^definition = "The name of the SOAP line as a coded description. In a SOAP report this can be one of the following: subjective, objective, assessment or plan."
* section[soapLine].text ^comment = "This element SHOULD hold the information as found in the referenced [nl-base-SOAPReport.SOAPLine](http://nictiz.nl/StructureDefinition/nl-base-SOAPReport.SOAPLine) profile to provide a human-readable narrative of the Composition."
* section[soapLine].entry ^definition = "A reference to data that supports this section. At a minimum, there should be an entry for the SOAPReport.SOAPLine profile."

Mapping: NlbaseSOAPReport-to-zib-soapreport-v1.0-2020EN
Id: zib-soapreport-v1.0-2020EN
Title: "zib SOAPReport-v1.0(2020EN)"
Source: NlbaseSOAPReport
Target: "https://zibs.nl/wiki/SOAPReport-v1.0(2020EN)"
*  -> "NL-CM:13.6.1" "SOAPReport"
* date -> "NL-CM:13.6.2" "SOAPReportDateTime"
* author -> "NL-CM:13.6.3" "Author"
* section[soapLine] -> "NL-CM:13.6.4" "SOAPLine"
* section[soapLine].code -> "NL-CM:13.6.6" "SOAPLineHeader"
