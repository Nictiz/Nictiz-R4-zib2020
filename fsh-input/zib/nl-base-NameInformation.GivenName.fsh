Profile: NlbaseNameInformationGivenName
Parent: HumanName
Id: nl-base-NameInformation.GivenName
Title: "nl base NameInformation.GivenName"
* insert ProfileMetadata(nl-base-NameInformation.GivenName)
* ^purpose = "This HumanName datatype represents the GivenName concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) NameInformation v1.1 (2020)](https://zibs.nl/wiki/NameInformation-v1.1(2020EN)).

For the entire zib, the complementary profile [nl-base-NameInformation](http://nictiz.nl/fhir/StructureDefinition/nl-base-NameInformation) should be used. Both profiles can be added in a slice with the discriminator set to `value`/`use`."

* use = #usual

// Short, alias, definition and comment texts
* ^description = "The name normally used to address the person."
* .
  * ^definition = "This slice represents the name information normally used to address the person."
  * ^comment = """
    This `.name` element represents the Dutch given name ("roepnaam") according to the [zib NameInformation v1.1 (2020)](https://zibs.nl/wiki/NameInformation-v1.1(2020EN)).
    
    **Note 1**: This element should only contain a person's _unofficial_ name. The official names are represented in one or more other `.name` elements with `.name.use` = _official_.
    
    **Note 2**: The examples illustrate how the zib is mapped to FHIR.
    """
* given
  * ^short = "GivenName"
  * ^alias[+] = "Roepnaam"
  * ^definition = "The name normally used to address the person."

Mapping: NlbaseNameInformationGivenName-to-zib-nameinformation-v1.1-2020EN
Id: zib-nameinformation-v1.1-2020EN
Title: "zib NameInformation-v1.1(2020EN)"
Source: NlbaseNameInformationGivenName
Target: "https://zibs.nl/wiki/NameInformation-v1.1(2020EN)"
* given -> "NL-CM:20.4.6" "GivenName"
