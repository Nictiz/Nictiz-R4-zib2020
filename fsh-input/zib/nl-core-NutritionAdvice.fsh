Profile: NlcoreNutritionAdvice
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-NutritionAdvice
Id: nl-core-NutritionAdvice
Title: "nl core NutritionAdvice"
* insert ProfileMetadata(nl-core-NutritionAdvice)
* insert Purpose(NutritionAdvice, 3.2, NutritionOrder)

* extension[indication] ..1
* extension[indication].value[x] only Reference(Condition or DiagnosticReport or DocumentReference or Observation or http://nictiz.nl/fhir/StructureDefinition/nl-core-Problem)
* oralDiet.texture.modifier.coding.display 1..
* oralDiet.fluidConsistencyType.coding.display 1..
* note ..1

// Short, alias, definition and comment texts
* ^description = "A nutritional advice is a description of nourishment for the patient, which must meet specific requirements in view of the health condition of the patient. Allergies and food intolerances or chewing and swallowing problems may be a reason for special nutrition."
* . ^alias[+] = "nl-core-NutritionAdvice"
