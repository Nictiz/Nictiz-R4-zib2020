# Nictiz-R4-Zib2020/util

This folder contains some utilities for zib2020 profiling.

## qa

This folders contains the pieces to run the automated QA tools. These tools are used in the configured Github actions (configured in `.github/actions/*.yml` from the root of this repo). To use them manually:
* Make sure Docker is running.
* Start the batch scripts "qa.bat" (this might take a while if you run this for the first time).
* Point your webbrowser at http://localhost:9000. This will give you a menu of the checks that you can perform.

To use the Nationale Terminologieserver for validation, you need to place a file called "nts-credentials.env" in the "qa" folder, containing the following content:

```
NTS_USER=xxx
NTS_PASS=yyy
```

Where `xxx` and `yyy` are your username and password for the Nationale Terminologieserver.

### Rebuilding the Docker image
When encountering problems with running the qa tooling, rebuilding the Docker image is a good start. Run `docker-compose build --no-cache` from `util/qa` to perform a full rebuild.

## addDataFromZib

Based on the definitions from ART-DECOR, metadata (`url`, `name`, `title`, `status`, `publisher`, `contact`, `purpose`, `copyright`, `abstract`) following the profiling guidelines is added if not present or edited when containing Forge's default values for both zib and nl-core profiles. An `id` (in both zib and nl-core profiles) and a `mapping` to a zib (only in zib profiles) following the guidelines should be present for this to work. If a non-default value is already present, the XSLT does not modify it, allowing for overruling the default value when profiling.

Notable exception to this is `definition` - this will not be added automatically and should still be added by hand.

All unused `mapping` elements that are added by default by Forge are removed.

When only a `mapping.map` is defined on an `element`, addDataFromZib.xsl adds `element.short`, `.definition`, `.alias` and `.mapping.comment` from the zib2020bbr-decor.xml file based on the zib Concept ID. If one of these elements is already defined, the XSLT displays a message identifying the conflict, but does not touch the defined value, allowing for overruling the default value when profiling.

Exception: no `.definition` is added to the root concept of a zib following 10.2.1.2 of the Profiling Guidelines.

The XSLT allows for multiple mappings on one element (combining `.short` and `.definition`, adding multiple `.alias`, adding the right `.mapping.comment`), but testing has been limited.

### Update ART-DECOR definitions

To update the ART-DECOR definitions file (zib2020bbr-decor.xml), the refreshDecorDefinition style sheet can be used. This scripts is a standalone XSL file that operates without an XML source. It can be executed by selecting the XSL file as the XML source within Oxygen, or by calling the XSL using Saxon and using the `-it` flag with the name (refreshDecorDefinition) of the template.

## downloadTerminology

This folder contains an xslt scripts that loops through all resources in the `resources` folder, finds relevant canonicals for ValueSets and systems for CodeSystems, and downloads these terminology resources from ART-DECOR to `resources/zib/terminology` and `resources/nl-core/terminology` respectively.

These scripts are standalone XSL files that operate without an XML source. They can be executed by selecting the XSL with the "main" template (command line Saxon: `-xsl:downloadTerminology.xsl -it:main`; oXygen: create a transformation scenario and configure the "Transformer").

## updateNarratives

Tooling to add or re-generate the narratives for all resources in the "examples" folder, using the [Nictiz Narrative Generator](https://github.com/Nictiz/HL7-mappings/tree/master/fhir-narrativegenerator). This tool requires ANT to be installed.