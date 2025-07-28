Profile: NlcoreHelpFromOthers
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-HelpFromOthers
Id: nl-core-HelpFromOthers
Title: "nl core HelpFromOthers"
* insert ProfileMetadata(nl-core-HelpFromOthers)
* insert Purpose(HelpFromOthers, 3.01, CarePlan)

* category 1..
* category[helpFromOthersCode] 1..1
* activity ..1
* activity.detail.code from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.3.2.1--20200901000000 (extensible)
* activity.detail.performer ..1
* activity.detail.performer[healthProfessional] ..1
* activity.detail.performer[caregiver] ..1
* activity.detail.performer[healthcareProvider] ..1
* note ..1

// Short, alias, definition and comment texts
* ^description = """
    There are often multiple people or parties involved in the care for a patient with a disorder or disability, particularly in the event of home care. Their efforts enable the patient to function more or less independently. This includes not only caregivers, but also professional help such as that offered by home care organizations, nurses, aids and helpers.
    Current doctors and staff from the facility to which a patient is admitted do not fall under this concept.
    """
* . ^alias[+] = "nl-core-HelpFromOthers"
* activity.detail.performer[healthProfessional] ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
