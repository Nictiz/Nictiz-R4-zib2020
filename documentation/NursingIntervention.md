# Zib NursingIntervention

## Performed interventions vs. planned interventions vs. plans

Zib NursingIntervention defines a conceptual model for nursing interventions, without differentiating between past, present and future use. Since FHIR resources are assumed to describe either an event or a request, the interpretation of the zib in the context of FHIR is not straightforward. From the zib perspective, there are at least three relevant applications that lead to different FHIR modelling:

* as a singular, concrete event that has been performed.
* as a singular, concrete event that is requested or planned.
* as a plan or policy, consisting of a repeating events in requested, planned and/or (partially) performed state.

Upon inspection, it turns out that not every concept is relevant to all of these three contexts, and indeed that the corresponding FHIR resource lacks supports for that concept. In [ZIB-2431](https://nictiz.atlassian.net/issues/ZIB-2431), a proposal for the interpretation of the different zib concepts in these different contexts is made.

The result of these considerations is that there are two different profiles for zib NursingIntervention, both lacking several concepts from the zib:

* zib-NursingIntervention-event; profile on the Procedure resource for concrete performed interventions
* zib-NursingIntervention-request; profile on the ServiceRequest resource for requested or planned concrete interventions, and for plans or policies that describe repeating interventions.

### Concrete performed nursing interventions
The fist application of zib NursingIntervention is that of performed, concrete interventions. For example: the wound dressing was changed yesterday at 17.10 or there was a pain consultation last Wednesday. These events are implemented using the zib-NursingIntervention-event profile on the Procedure resource.

The following zib concepts need special consideration for this profile:

* Interval and Frequency: these concepts apply specifically to repeating interventions, and are not mapped to this profile.
* Instruction (patient instruction): this can be relevant for requested or planned interventions, but not for performed interventions. This concept has not been mapped to the profile.
* TODO: Requester (health professional that requested the intervention): in FHIR, a requester is modelled as part of the request. This concept has not been mapped to the profile. If needed, a reference to the underlying ServiceRequest can be used.
* MedicalDevice (reference to zib MedicalDevice): zib MedicalDevice contains aspects of both a device and its application to a patient, which in FHIR is modelled using the Device and DeviceUseStatement resources respectively. In the context of zib NursingIntervention, the reference to zib MedicalDevice is about the materials used, which is a more narrow scope than the entire zib MedicalDevice. This meaning aligns well with the `Procedure.usedReference` concept, which can be used to reference the Device resource, so only that part of the zib MedicalDevice reference is modelled (see [ZIB-2691](https://nictiz.atlassian.net/browse/ZIB-2691) for more information).

### Concrete planned nursing interventions
The second application of zib NursingIntervention is that of concrete interventions that will be performed. For example, a request to change the wound dressing this afternoon or a pain consultation, next Wednesday at 15.00. These are implemented using the zib-NursingIntervention-request profile on the ServiceRequest resource.

The following zib concepts need special consideration for this profile in this situation:

* Interval and Frequency: these concepts apply specifically to repeating interventions, and are not mapped to this profile.
* TODO: MedicalDevice (reference to zib MedicalDevice): 

### Plans or policy's
The third application of zib NursingIntervention is that of a plan or policy. This could be a planned, ongoing or completed plan. For example: change the wound dressing every afternoon for the next week or assisting with toileting from now on. These are implemented as well using the zib-NursingIntervention-request profile on the ServiceRequest resource.

Please note that this situation can be indicated by specifying a frequency and interval of a more or less concrete intervention, but also by using an intervention code that indicates a policy, like "assisting with toileting".

The following zib concepts need special consideration for this profile in this situation:

* ProcedureStartDateTime and ProcedureEndDateTime: in this context, these concepts do not denote the beginning and end of an intervention, but of the plan. TODO: time fields
* TODO: MedicalDevice (reference to zib MedicalDevice): 


## References between use cases

## Time fields