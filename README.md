# Nictiz-R4-Zib2020

This repository contains HL7 FHIR R4 compliant profiles and related conformance materials for the Release 2020 of the Dutch [zibs](https://zibs.nl/wiki/Zorginformatiebouwstenen) (_Zorginformatiebouwstenen_, i.e. Clinical Information Models, also known as Clinical Building Blocks or Health and Care Information Models).

This repository is maintained by the Dutch National Institute for ICT in Healthcare (Nictiz).
## Releases

Note: _Resources in this repository should be considered unstable and not suited for immediate implementation._

The packages are split in two layers:
* zib (nictiz.fhir.nl.r4.zib2020): Profiles and other conformance resources that are a faithful representation of the zib data models. These should _not_ be used for actual implementations; profiles are marked `abstract`.
* nl-core (nictiz.fhir.nl.r4.nl-core): This is the package that should be used for actual implementations. It contains profiles and other conformance resources derived from their zib counterparts, enriched with the additions needed for implementations. For example, these profiles make the Patient reference explicit and implement all known additions from various use cases.

At the moment, Nictiz publishes packages in beta status to test out implementations. The releases are produced from the 'main' branch. See [the releases](https://github.com/Nictiz/Nictiz-R4-zib2020/releases) and [Simplifier](https://simplifier.net/packages/nictiz.fhir.nl.r4.nl-core) for the beta releases from this repository.

## Validation by HL7 Netherlands

All of the conformance resources representing the zibs are vetted by HL7 Netherlands. For some of the materials in the beta packages, this process already has been completed. This is documented in the `StructureDefinition.description` of the relevant profiles.

## Changes in this repository

Bugs and other issues are internally tracked using the [BITS MM project](https://bits.nictiz.nl/projects/MM/).

Issues against ZIBs can be reported using the [Nictiz servicedesk](https://nictiz.atlassian.net/servicedesk/customer/portal/4).

Note 1: It is a bit of a misnomer to use this project, but this has been chosen for pragmatic reasons.

Note 2: Changes affecting the published packages are guaranteed to be tracked using a change request in this issue tracker. Unpublished materials might change for a variety of reasons.

## Profiling guidelines

The profiling guidelines for this project can be found at the [informatiestandaarden wiki](http://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4).
