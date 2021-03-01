# Nictiz-R4-Zib2020/util

This folder contains some utilities for zib2020 profiling.

## qaAutomation

This folders contains the pieces to run the automated QA tools. These tools are used in the configured Github actions (configured in `.github/actions/*.yml` from the root of this repo) but can also be used manually. See the README in that folder.

## addDataFromZib

When only an `element.mapping.map` is defined, addDataFromZib.xsl adds `element.short`, `.definition`, `.alias` and `.mapping.comment` from the zib2020bbr-decor.xml file based on the zib Concept ID. If one of these elements is already defined, the XSLT displays a message identifying the conflict, but does not touch the defined value, allowing for overruling the default value when profiling.

The XSLT allows for multiple mappings on one element (combining `.short` and `.definition`, adding multiple `.alias`, adding the right `.mapping.comment`), but testing has been limited.

## downloadTerminology

This folder contains two xslt scripts that loop through all resources in the `resources` folder, find relevant canonicals for ValueSets and systems for CodeSystems and download these terminology resources from ART-DECOR to `resources/terminology`.

These scripts are standalone XSL files that operate without an XML source. They can be executed by selecting the XSL file as the XML source within Oxygen, or by calling the XSL using Saxon and using the `-it` flag with the name (downloadValueSets and downloadCodeSystems) of the template.