Profile: NlcoreNameInformation
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-NameInformation
Id: nl-core-NameInformation
Title: "nl core NameInformation"
* insert ProfileMetadata(nl-core-NameInformation)
* ^purpose = "This HumanName datatype represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) NameInformation v1.1 (2020)](https://zibs.nl/wiki/NameInformation-v1.1(2020EN)), except for the GivenName concept.

For the entire zib, the complementary profile [zib-NameInformation.GivenName](http://nictiz.nl/fhir/StructureDefinition/zib-NameInformation.GivenName) should be used. Both profiles can be added in a slice with the discriminator set to `value`/`use`."

* . obeys zib-NameInformation-1 and zib-NameInformation-2
* extension[nameUsage] ..1
* extension[nameUsage].value[x] from http://hl7.org/fhir/ValueSet/name-assembly-order|4.0.1 (required)
* use 1..
* given.extension 1..
* given.extension[givenOrInitial] 1..

// Short, alias, definition and comment texts
* ^description = "A person's official name information, including given names, last name and possibly the partner's last name."
* . ^alias[+] = "nl-core-NameInformation"
