RuleSet: BaseProfileMetadata(UniqueId)
* insert ProfileMetadata(nl-base-{UniqueId})

RuleSet: CoreProfileMetadata(UniqueId)
* insert ProfileMetadata(nl-core-{UniqueId})

RuleSet: ZibProfileMetadata(UniqueId)
* insert ProfileMetadata(zib-{UniqueId})

RuleSet: ProfileMetadata(id)
* ^url = "http://nictiz.nl/fhir/StructureDefinition/{id}"
* insert BoilerPlate

RuleSet: Purpose(ZibName, ZibVersion, ResourceType)
* ^purpose = "This {ResourceType} resource represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) {ZibName} v{ZibVersion} (2020)](https://zibs.nl/wiki/{ZibName}-v{ZibVersion}(2020EN))."

RuleSet: BoilerPlate
* ^text.status = #empty
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No narrative is provided for definitional resources. A human-readable rendering can be found in the implementation guide(s) where this resource is used.</div>"
* ^status = #draft
* ^publisher = "Nictiz"
* ^contact.name = "Nictiz"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.nictiz.nl"
* ^contact.telecom.use = #work
* ^copyright = "Copyright and related rights waived via CC0, https://creativecommons.org/publicdomain/zero/1.0/. This does not apply to information from third parties, for example a medical terminology system. The implementer alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize third party IP in connection with the specification or otherwise."
