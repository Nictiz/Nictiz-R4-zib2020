Profile: NlcoreHelpFromOthers
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-HelpFromOthers
Id: nl-core-HelpFromOthers
Title: "nl core HelpFromOthers"
* insert ProfileMetadata(nl-core-HelpFromOthers)
* insert Purpose(HelpFromOthers, 3.01, CarePlan)

* category 1..
* category[helpFromOthersCode] 1..1
* subject only Reference(Patient or Group or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
* activity ..1
* activity.detail.code ^binding.strength = #extensible
* activity.detail.performer ..1
* activity.detail.performer[healthProfessional] ..1
* activity.detail.performer[healthProfessional] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
* activity.detail.performer[caregiver] ..1
* activity.detail.performer[caregiver] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-ContactPerson)
* activity.detail.performer[healthcareProvider] ..1
* activity.detail.performer[healthcareProvider] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
* note ..1

// Short, alias, definition and comment texts
* ^description = """
    There are often multiple people or parties involved in the care for a patient with a disorder or disability, particularly in the event of home care. Their efforts enable the patient to function more or less independently. This includes not only caregivers, but also professional help such as that offered by home care organizations, nurses, aids and helpers.
    Current doctors and staff from the facility to which a patient is admitted do not fall under this concept.
    """
* . ^alias[+] = "nl-core-HelpFromOthers"
* activity.detail.performer[healthProfessional] insert PatternNlCoreHealthProfessional
