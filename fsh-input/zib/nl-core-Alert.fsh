Profile: NlcoreAlert
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-Alert
Id: nl-core-Alert
Title: "nl core Alert"
* insert ProfileMetadata(nl-core-Alert)
* insert Purpose(Alert, 4.1, Flag)

* . obeys zib-Alert-1 and zib-Alert-2
* extension[condition] ..1
* extension[condition].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/Resource or http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* extension[comment] ..1
* category[alertType] ..1
* category[alertType] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.3.1--20200901000000 (required)
* code.coding 1..
* code.coding[alertName] ..1
* code.coding[alertName] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.8.3.2--20200901000000 (required)
* code.coding[dataAbsentReason] ..1

// Short, alias, definition and comment texts
* ^description = """
    An alert describes a clinical or administrative fact brought to the attention of the users of the clinical systems to be taken into account when shaping diagnostic and therapeutic policy or in dealing with the patient, usually because of a safety risk.
    Disorders that describe the body’s sensitivity to a substance which results in a specific physiological reaction after being exposed to that substance are referred to as allergies. These are described in a separate information model.
    Warnings for non-allergic disorders can concern:
    * A disorder, condition or diagnosis which can be considered as a contraindication for undergoing a certain type of therapy, such as pregnancy or long QT syndrome;
    * Impaired functioning of an organ system (heart failure, impaired liver or kidney function, weakened immune system);
    * Risk of spreading certain microorganisms (multi-resistant bacteria, tubercle bacilli, HIV, HBV, Ebola virus);
    * Other risks
    """
* . ^alias[+] = "nl-core-Alert"
