Profile: NlbaseNutritionAdvice
Parent: NutritionOrder
Id: nl-base-NutritionAdvice
Title: "nl base NutritionAdvice"
* insert ProfileMetadata(nl-base-NutritionAdvice)
* insert Purpose(NutritionAdvice, 3.2, NutritionOrder)

* extension contains
    http://hl7.org/fhir/StructureDefinition/workflow-reasonReference named indication 0..1
* extension[indication].value[x] only Reference(Condition or DiagnosticReport or DocumentReference or Observation or http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)

// Short, alias, definition and comment texts
* ^description = "A nutritional advice is a description of nourishment for the patient, which must meet specific requirements in view of the health condition of the patient. Allergies and food intolerances or chewing and swallowing problems may be a reason for special nutrition."
* .
  * ^short = "NutritionAdvice"
  * ^alias[+] = "Voedingsadvies"
  * ^comment = "Please note that there's a mismatch between the zib concept Consistency (NL-CM:7.11.3) and the FHIR resource NutritionOrder."
* extension[indication].value[x]
  * ^short = "Indication"
  * ^alias[+] = "Indicatie"
  * ^definition = "The indication is the reason for advising the diet."
* intent ^comment = "No zib concept can be mapped to `intent`. Unless `intent` is explicitly recorded it may be assumed that a NutritionAdvice represents an _order_."
* oralDiet.type.text
  * ^short = "DietType"
  * ^alias[+] = "DieetType"
  * ^definition = "Description of the type of diet."
* oralDiet.texture.modifier
  * ^short = "Consistency"
  * ^alias[+] = "Consistentie"
  * ^definition = "A description of the consistency of the food."
  * ^comment = """
    There's a mismatch between the zib concept Consistency (NL-CM:7.11.3) and the FHIR resource NutritionOrder. On the zib level, all information about the oral diet consistency is flattened to a single string. In FHIR however there are much richer semantics, recognizing at least the difference between solid (`.oralDiet.texture.modifier`) and liquid (`.oralDiet.fluidConsistencyType`) nutrition, and in addition allowing using coded data for the consistency and to distinguish between different types of solid foods.
    
    In consultation with HL7 Netherlands and the zib centre at Nictiz, it has been decided that a one-to-one mapping from the simple zib concept to the FHIR resource is undesirable as it may result in the loss of valuable information. Sending systems should use `.oralDiet.texture.modifier` and/or `.oralDiet.fluidConsistencyType` concepts as intended wherever they can. If data is not available in coded form, sending systems can use the `.text` element in these concepts for textual descriptions; if there's just a single string like the zib defines it, it is the expectation that the `.text` element in `oralDiet.texture.modifier` is used, as this concept has a broader meaning and may include liquid foods as well. (Because of this mismatch, the Consistency concept has been mapped to `.oralDiet.texture.modifier`, `.oralDiet.texture.modifier.text`, and `.oralDiet.fluidConsistencyType`).
    
    This means that receiving systems MUST be able to interpret `.oralDiet.texture.modifier` and `.oralDiet.fluidConsistencyType`, both as coded and textual concepts, to reconstruct the zib concept Consistency. Reconstructing this string could be a straightforward concatenation of all coded and textual information in these two elements. In order to assist receiving systems which do not support coded information, sending systems MUST add a `.display` to each coding.
    """
* oralDiet.texture.modifier.text
  * ^short = "Consistency"
  * ^alias[+] = "Consistentie"
  * ^definition = "A description of the consistency of the food."
  * ^comment = """
    There's a mismatch between the zib concept Consistency (NL-CM:7.11.3) and the FHIR resource NutritionOrder. On the zib level, all information about the oral diet consistency is flattened to a single string. In FHIR however there are much richer semantics, recognizing at least the difference between solid (`.oralDiet.texture.modifier`) and liquid (`.oralDiet.fluidConsistencyType`) nutrition, and in addition allowing using coded data for the consistency and to distinguish between different types of solid foods.
    
    In consultation with HL7 Netherlands and the zib centre at Nictiz, it has been decided that a one-to-one mapping from the simple zib concept to the FHIR resource is undesirable as it may result in the loss of valuable information. Sending systems should use `.oralDiet.texture.modifier` and/or `.oralDiet.fluidConsistencyType` concepts as intended wherever they can. If data is not available in coded form, sending systems can use the `.text` element in these concepts for textual descriptions; if there's just a single string like the zib defines it, it is the expectation that the `.text` element in `oralDiet.texture.modifier` is used, as this concept has a broader meaning and may include liquid foods as well. (Because of this mismatch, the Consistency concept has been mapped to `.oralDiet.texture.modifier`, `.oralDiet.texture.modifier.text`, and `.oralDiet.fluidConsistencyType`).
    
    This means that receiving systems MUST be able to interpret `.oralDiet.texture.modifier` and `.oralDiet.fluidConsistencyType`, both as coded and textual concepts, to reconstruct the zib concept Consistency. Reconstructing this string could be a straightforward concatenation of all coded and textual information in these two elements. In order to assist receiving systems which do not support coded information, sending systems MUST add a `.display` to each coding.
    """
* oralDiet.fluidConsistencyType
  * ^short = "Consistency"
  * ^alias[+] = "Consistentie"
  * ^definition = "A description of the consistency of the food."
  * ^comment = """
    There's a mismatch between the zib concept Consistency (NL-CM:7.11.3) and the FHIR resource NutritionOrder. On the zib level, all information about the oral diet consistency is flattened to a single string. In FHIR however there are much richer semantics, recognizing at least the difference between solid (`.oralDiet.texture.modifier`) and liquid (`.oralDiet.fluidConsistencyType`) nutrition, and in addition allowing using coded data for the consistency and to distinguish between different types of solid foods.
    
    In consultation with HL7 Netherlands and the zib centre at Nictiz, it has been decided that a one-to-one mapping from the simple zib concept to the FHIR resource is undesirable as it may result in the loss of valuable information. Sending systems should use `.oralDiet.texture.modifier` and/or `.oralDiet.fluidConsistencyType` concepts as intended wherever they can. If data is not available in coded form, sending systems can use the `.text` element in these concepts for textual descriptions; if there's just a single string like the zib defines it, it is the expectation that the `.text` element in `oralDiet.texture.modifier` is used, as this concept has a broader meaning and may include liquid foods as well. (Because of this mismatch, the Consistency concept has been mapped to `.oralDiet.texture.modifier`, `.oralDiet.texture.modifier.text`, and `.oralDiet.fluidConsistencyType`).
    
    This means that receiving systems MUST be able to interpret `.oralDiet.texture.modifier` and `.oralDiet.fluidConsistencyType`, both as coded and textual concepts, to reconstruct the zib concept Consistency. Reconstructing this string could be a straightforward concatenation of all coded and textual information in these two elements. In order to assist receiving systems which do not support coded information, sending systems MUST add a `.display` to each coding.
    """
* note.text
  * ^short = "Comment"
  * ^alias[+] = "Toelichting"
  * ^definition = "A comment on the nutrition advice."

Mapping: NlbaseNutritionAdvice-to-zib-nutritionadvice-v3.2-2020EN
Id: zib-nutritionadvice-v3.2-2020EN
Title: "zib NutritionAdvice-v3.2(2020EN)"
Source: NlbaseNutritionAdvice
Target: "https://zibs.nl/wiki/NutritionAdvice-v3.2(2020EN)"
*  -> "NL-CM:7.11.1" "NutritionAdvice"
* extension[indication].value[x] -> "NL-CM:7.11.5" "Indication"
* oralDiet.type.text -> "NL-CM:7.11.2" "DietType"
* oralDiet.texture.modifier -> "NL-CM:7.11.3" "Consistency"
* oralDiet.texture.modifier.text -> "NL-CM:7.11.3" "Consistency"
* oralDiet.fluidConsistencyType -> "NL-CM:7.11.3" "Consistency"
* note.text -> "NL-CM:7.11.4" "Comment"
