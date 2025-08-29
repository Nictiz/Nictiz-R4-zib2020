Profile: NlcorePharmaceuticalProduct
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-PharmaceuticalProduct
Id: nl-core-PharmaceuticalProduct
Title: "nl core PharmaceuticalProduct"
* insert ProfileMetadata(nl-core-PharmaceuticalProduct)
* insert Purpose(PharmaceuticalProduct, 2.1.2, Medication)

* code ^binding.strength = #required
* form ^binding.strength = #required
* ingredient.itemCodeableConcept ^binding.strength = #required

// Short, alias, definition and comment texts
* ^description = """
    The prescribed substance is usually medication. However, medical aids and bandages can also be prescribed and supplied via the pharmacy. Food and blood products do not strictly belong in the medication category, but can be prescribed and supplied by a pharmacy as well.
    
    A type of medication can be indicated with **a single code**. That code can be chosen from several possible coding systems (concretely: GPK, PRK, HPK or article numbers). Correct use of these codes in the software systems will sufficiently record the composition of the product used, making a complete product specification unnecessary.
    
    In addition to a primary code, **alternative codes** from other coding systems can also be entered (so that the GPK can be sent along in the event that the patient was registered based on PRK, for example).
    
    Entering multiple ingredients will enable you to display a compound product. If one of the composite parts is liquid, the dosage will be given in milliliters; otherwise it will be given in ‘units’.
    
    In that case, the **composition of the medication** can be specified implicitly (with the use of a medication code) or explicitly, for example by listing the (active) ingredient(s) of the medication.
    
    **Magistral prescriptions** can be entered as well. This can be done by means of the option listed above to enter coded ingredients and/or by entering the composition and preparation method as free text.
    This is a partial information model.
    """
* . ^alias[+] = "nl-core-PharmaceuticalProduct"

Mapping: NlcorePharmaceuticalProduct-to-imm-Vaccination-Immunization-20211118
Id: imm-Vaccination-Immunization-20211118
Title: "ART-DECOR Dataset Vaccination-Immunization 20211118T10:06:34"
Source: NlcorePharmaceuticalProduct
Target: "https://decor.nictiz.nl/ad/#/imm-/datasets/dataset/2.16.840.1.113883.2.4.3.11.60.131.1.1/2021-11-18T10:06:34"
* identifier -> "imm-dataelement-146" "SerialNumber"
* batch.lotNumber -> "imm-dataelement-145" "Batch/lotNumber"