Profile: NlcoreNameInformationGivenName
Parent: http://nictiz.nl/fhir/StructureDefinition/nl-base-NameInformation.GivenName
Id: nl-core-NameInformation.GivenName
Title: "nl core NameInformation.GivenName"
* insert ProfileMetadata(nl-core-NameInformation.GivenName)
* ^purpose = "This HumanName datatype represents the GivenName concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) NameInformation v1.1 (2020)](https://zibs.nl/wiki/NameInformation-v1.1(2020EN)).

For the entire zib, the complementary profile [zib-NameInformation](http://nictiz.nl/fhir/StructureDefinition/zib-NameInformation) should be used. Both profiles can be added in a slice with the discriminator set to `value`/`use`."

* use 1..
* family ..0
* given 1..
* prefix ..0
* suffix ..0

// Short, alias, definition and comment texts
* ^description = "The name normally used to address the person."
* . ^alias[+] = "nl-core-NameInformation.GivenName"
