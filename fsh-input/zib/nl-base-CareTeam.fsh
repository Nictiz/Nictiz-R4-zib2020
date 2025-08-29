Profile: NlbaseCareTeam
Parent: CareTeam
Id: nl-base-CareTeam
Title: "nl base CareTeam"
* insert ProfileMetadata(nl-base-CareTeam)
* insert Purpose(CareTeam, 1.0, CareTeam)

* participant insert Discriminator(profile, member.resolve(\))
* participant contains
    contactPerson 0..1 and
    patient 0..1 and
    healthcareProfessional 0..1
* participant[contactPerson].member only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-ContactPerson)
* participant[patient].member only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-Patient)
* participant[healthcareProfessional].role insert Discriminator(value, $this)
* participant[healthcareProfessional].role contains
    healthProfessionalRole 0..1
* participant[healthcareProfessional].role[healthProfessionalRole] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.17.1.5--20200901000000 (preferred)
* participant[healthcareProfessional].member only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthProfessional-PractitionerRole)
* participant[healthcareProfessional].onBehalfOf only Reference(Organization or http://nictiz.nl/fhir/StructureDefinition/nl-base-HealthcareProvider-Organization)
* reasonReference only Reference(Condition or http://nictiz.nl/fhir/StructureDefinition/nl-base-Problem)

// Short, alias, definition and comment texts
* ^description = "A care team is a group of health professionals and other people involved in caring for a patient for one or more problems."
* .
  * ^short = "CareTeam"
  * ^alias[+] = "ZorgTeam"
* name
  * ^short = "CareTeamName"
  * ^alias[+] = "ZorgTeamNaam"
  * ^definition = "The name of the care team."
* participant[contactPerson].member
  * ^short = "CareTeamMember"
  * ^alias[+] = "Contactpersoon"
  * ^definition = "A contact person of the patient as member of the care team."
* participant[patient].member
  * ^short = "CareTeamMember"
  * ^alias[+] = "Patient"
  * ^definition = "The patient as member of the care team."
* participant[healthcareProfessional].role[healthProfessionalRole]
  * ^short = "HealthProfessionalRole"
  * ^alias[+] = "ZorgverlenerRol"
  * ^definition = "The role the health professional fulfils in the healthcare process. For health professionals, this could be for example attender, referrer or performer."
* participant[healthcareProfessional].member
  * ^short = "CareTeamMember"
  * ^alias[+] = "Zorgverlener"
  * ^definition = "A health professional as a member of the care team involved in the care around the patient."
  * insert PatternNlBaseHealthProfessional
* reasonReference
  * ^short = "Problem"
  * ^alias[+] = "Probleem"
  * ^definition = "The disease and/or the health status for which the patient receives treatment via members of the care team."

Mapping: NlbaseCareTeam-to-zib-careteam-v1.0-2020EN
Id: zib-careteam-v1.0-2020EN
Title: "zib CareTeam-v1.0(2020EN)"
Source: NlbaseCareTeam
Target: "https://zibs.nl/wiki/CareTeam-v1.0(2020EN)"
*  -> "NL-CM:17.3.1" "CareTeam"
* name -> "NL-CM:17.3.12" "CareTeamName"
* participant[contactPerson].member -> "NL-CM:17.3.8" "CareTeamMember"
* participant[patient].member -> "NL-CM:17.3.7" "CareTeamMember"
* participant[healthcareProfessional].member -> "NL-CM:17.3.9" "CareTeamMember"
* reasonReference -> "NL-CM:17.3.5" "Problem"

Mapping: NlbaseCareTeam-to-zib-healthprofessional-v3.5-2020EN
Id: zib-healthprofessional-v3.5-2020EN
Title: "zib HealthProfessional-v3.5(2020EN)"
Source: NlbaseCareTeam
Target: "https://zibs.nl/wiki/HealthProfessional-v3.5(2020EN)"
* participant[healthcareProfessional].role[healthProfessionalRole] -> "NL-CM:17.1.5" "HealthProfessionalRole"
