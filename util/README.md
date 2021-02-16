# Nictiz-R4-Zib2020/util

This folder contains some utilities for zib2020 profiling.

## addDataFromZib

When only an `element.mapping.map` is defined, addDataFromZib.xsl adds `element.short`, `.definition`, `.alias` and `.mapping.comment` from the zib2020bbr-decor.xml file based on the zib Concept ID. If one of these elements is already defined, the XSLT displays a message identifying the conflict, but does not touch the defined value, allowing for overruling the default value when profiling.

The XSLT allows for multiple mappings on one element (combining `.short` and `.definition`, adding multiple `.alias`, adding the right `.mapping.comment`), but testing has been limited.

