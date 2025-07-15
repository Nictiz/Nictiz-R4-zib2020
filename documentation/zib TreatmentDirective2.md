# TreatmentDirective2
## Modifier extension "SpecificationOther"
Zib TreatmentDirective2 is concerned with the desirability to perform a treatment on a patient. Such a desirability can be a straightforward binary choice to either perform on not perform the treatment, but it can also be subject to the circumstances. In the zib, this is modeled using the concept TreatmentDecision, which has the option "other" next to the options "do perform" or "do not perform". If this "other" option is chosen, a textual specification must be given (concept SpecificationOther).

In FHIR, the decision to perform the treatment is modeled using the `Consent.provision.type` concept. However, this has a _required_ binding to a limited ValueSet that only contains the options _deny_ and _permit_. This binary choice is thus not granular enough for the zib.

For this reason, a modifier extension is created, named "ext-TreatmentDirective2.SpecificationOther". If present, this extension carries the textual guidance on the desirability of the treatment. If this modifier extension is present, it's value overrules `Consent.provision.type`. Sending systems SHOULD refrain from setting this values when the treatment decision is "Other", and receiving systems MUST present the information from the modifier extension to the user.

Note that this must be a [modifier extension](https://www.hl7.org/fhir/R4/extensibility.html#modifierExtension) instead of a regular extension, as the resource cannot be safely processed without interpreting the information in the extension.

## Choice of the Consent resource
At the time of writing, there is no obvious way to represent treatment directives in FHIR. The Consent resource [states that](https://www.hl7.org/fhir/R4/consent.html#scope) it's intended to cover the use case of "Advance Care Directives: Consent to instructions for potentially needed medical treatment (e.g. DNR)", but that this use case is not modeled yet.

Meanwhile there is [discussion in the FHIR community](https://jira.hl7.org/browse/FHIR-50903) if the ServiceRequest would be a better fit. A ServiceRequest is an actionable resource, and it supports _directive_ as an `.intent`. The Consent resource on the other hand is about a consumer choice, which is not the same as an agreement as a treatment directive defines. Indeed, the PACIO Advance Directive Interoperability IG [has adopted ServiceRequest](https://build.fhir.org/ig/HL7/fhir-pacio-adi/StructureDefinition-ADI-PMOCPRServiceRequest.html) to model a(relative simple) DNR directive.

However, the zib is a more elaborate model than what the ServiceRequest resource (or the Consent resource) can cover.

For now, the choice has been made to adopt the Consent resource. During testing, this approach turned out to work well enough. Future developments of both the zib and FHIR could result in a different approach.
