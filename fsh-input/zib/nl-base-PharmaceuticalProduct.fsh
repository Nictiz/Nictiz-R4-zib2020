Profile: NlbasePharmaceuticalProduct
Parent: Medication
Id: nl-base-PharmaceuticalProduct
Title: "nl base PharmaceuticalProduct"
* insert ProfileMetadata(nl-base-PharmaceuticalProduct)
* insert Purpose(PharmaceuticalProduct, 2.1.2, Medication)

* extension contains
    http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalProduct.Description named description 0..*
* code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.12--20200901000000 (preferred)
* form from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.9.7.8--20200901000000 (preferred)
* ingredient.item[x] insert Discriminator(type, $this)
* ingredient.itemCodeableConcept only CodeableConcept
* ingredient.itemCodeableConcept from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.13--20200901000000 (preferred)
* ingredient.strength.numerator only Quantity
* ingredient.strength.numerator ^type.profile = http://nictiz.nl/fhir/StructureDefinition/pattern-GstdQuantity
* ingredient.strength.denominator only Quantity
* ingredient.strength.denominator ^type.profile = http://nictiz.nl/fhir/StructureDefinition/pattern-GstdQuantity

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
* .
  * ^short = "PharmaceuticalProduct"
  * ^alias[+] = "FarmaceutischProduct"
* code
  * ^short = "MedicationCode"
  * ^alias[+] = "ProductCode"
  * ^definition = """
    Coding medication in the Netherlands is done on the basis of the G standard (issued by Z-index), which is filled under the direction of KNMP. 
    
    The coded medication can be expressed as:
    
    * GTIN International Article Number
    * ZI-nummer (2.16.840.1.113883.2.4.4.8)
    * Trade product code (HPK)
    * Prescription code (PRK)
    * Generic product code (GPK)
    * Anatomic Therapeutic Classification code (ATC)
    * Substance Name Code (SNK)
    *  Substance Name Code, in combination with Route of Administration (SSK)
    *  SNOMED CT code
    
    The GTIN enables identification of the product including its origin with a barcode. The ZI number represents the tradeproduct and the package size. The HPK is the code for the trade product (with the brand name) as used per dose/per time the medication is taken (1 pill, 1 puff, 1ml) The PRK contains als GPK information supplemented with information needed to prescribe the right product. this level is intended to facilitate generic prescription of drugs. The GPK defines the pharmaceutical characteristics of a product: ingredients, strengths, units, pharmaceutical form and route of administration. The Substance Name Code (SNK) is the (active) compound. Further information about the G-Standaard levels see https://www.z-index.nl So called 90.000.000 numbers are used in local IT systems. These numbers shall not be used for external communication. In the this is necessary only the description (not the code) may be included. This is in accordance with national agreements (Nictiz Standard).
    
    The bound ValueSet includes the NullFlavor code 'OTH', which is not allowed for the zib concept 'MedicationCode'. However, FHIR explicitly defines 'a textual description if no code is available', which is equivalent to the zib concept 'Medication', to be placed on `.code.text`. The 'OTH' code is included to allow this.
    """
* code.text
  * ^short = "Medication"
  * ^alias[+] = "ProductNaam"
  * ^definition = "For medication which has no code, enter the complete name of the pharmaceutical product here."
* form
  * ^short = "PharmaceuticalForm"
  * ^alias[+] = "FarmaceutischeVorm"
  * ^definition = "The pharmaceutical form indicates the form of the medication. Examples include: tablet, suppository, infusion liquid, ointment. If the product has a GPK code in the G standard, the form will be known in the G standard. For products without a code (free text, preparation by the pharmacy), the means of administration can be entered."
* ingredient
  * ^short = "Ingredient"
  * ^alias[+] = "Ingredient"
  * ^definition = """
    A product contains one or more active substances and excipients. These are usually determined by the product code. For medication prepared or compounded by the local pharmacy, each ingredient must be entered separately.
    
    The active substances play an important role, as they: a) determine the pharmacotherapeutic effect of the medication and b) serve as the basis for the indication of the strength of the medication (e.g. 200mg).
    """
* ingredient.itemCodeableConcept
  * ^short = "SubstanceCode"
  * ^alias[+] = "IngredientCode"
  * ^definition = """
    Active substance or excipient. Here, the same codes can be used as for the ProductCode (for dilutions and compounds in particular), but now, the ATC, SSK and SNK codes can also be used to indicate a substance (to list ingredients of local products prepared by the pharmacy). 
    
    * GTIN International Article Number 
    * KNMP article number 
    * Trade product code (HPK) 
    * Prescription code (PRK) 
    * Generic product code (GPK) 
    * ATC (anatomic therapeutic classification) 
    * SSK (substance name code with route of administration) 
    * SNK (substance name code)
    
    For further explanation about ATC see <https://www.whocc.no/atc/structure_and_principles/>
    """
* ingredient.strength
  * ^short = "Concentration"
  * ^alias[+] = "Sterkte"
  * ^definition = """
    The relative amount of this ingredient in this product.
    Calculation of Concentration = Ingredient Amount ÷ Product Amount.
    
    This could be a concentration if the medication is dissolved in liquid, for example.
    """
* ingredient.strength.numerator
  * ^short = "IngredientAmount"
  * ^alias[+] = "IngredientHoeveelheid"
  * ^definition = "The amount and unit of this ingredient. This is the numerator for the calculation of the concentration. The unit should be selected from the G-Standard (Table 902)."
* ingredient.strength.denominator
  * ^short = "ProductAmount"
  * ^alias[+] = "ProductHoeveelheid"
  * ^definition = "Amount of the product. This is the denominator for the calculation of the concentration. Optionally a translation to NHG table Gebruiksvoorschriften(Table 25) is also allowed."

Mapping: NlbasePharmaceuticalProduct-to-zib-pharmaceuticalproduct-v2.1.2-2020EN
Id: zib-pharmaceuticalproduct-v2.1.2-2020EN
Title: "zib PharmaceuticalProduct-v2.1.2(2020EN)"
Source: NlbasePharmaceuticalProduct
Target: "https://zibs.nl/wiki/PharmaceuticalProduct-v2.1.2(2020EN)"
*  -> "NL-CM:9.7.19926" "PharmaceuticalProduct"
* code -> "NL-CM:9.7.19927" "MedicationCode"
* code.text -> "NL-CM:9.7.19929" "Medication"
* form -> "NL-CM:9.7.19931" "PharmaceuticalForm"
* ingredient -> "NL-CM:9.7.19932" "Ingredient"
* ingredient.itemCodeableConcept -> "NL-CM:9.7.19934" "SubstanceCode"
* ingredient.strength -> "NL-CM:9.7.19933" "Concentration"
* ingredient.strength.numerator -> "NL-CM:9.7.22277" "IngredientAmount"
* ingredient.strength.denominator -> "NL-CM:9.7.22278" "ProductAmount"
