# Nictiz-R4-Zib2020/util

This folder contains some utilities for zib2020 profiling.

## qaAutomation

This folders contains the pieces to run the automated QA tools. These tools are used in the configured Github actions (configured in `.github/actions/*.yml` from the root of this repo) but can also be used manually. See the README in that folder.

## addDataFromZib

When only an `element.mapping.map` is defined, addDataFromZib.xsl adds `element.short`, `.definition`, `.alias` and `.mapping.comment` from the zib2020bbr-decor.xml file based on the zib Concept ID. If one of these elements is already defined, the XSLT displays a message identifying the conflict, but does not touch the defined value, allowing for overruling the default value when profiling.

The XSLT allows for multiple mappings on one element (combining `.short` and `.definition`, adding multiple `.alias`, adding the right `.mapping.comment`), but testing has been limited.

## refreshTerminology

This folder contains 2 xslt scripts that loop through all resources, find relevant canonicals for ValueSets and CodeSystems and resolves them from ArtDecor. It overwrites previous resolved resources.
The *.xsl scripts can be runned with the same script as XML source and will place the output in resources/terminology.