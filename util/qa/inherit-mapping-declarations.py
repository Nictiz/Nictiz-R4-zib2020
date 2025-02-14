#!/usr/bin/env python3

"""
Simple script to check if all zib mappings from zib profiles have been inherited by the nl-core profiles.

USAGE: inherit-mapping-declarations.py [list of nl-core profiles]
"""

import sys
import xml.etree.ElementTree as ET
import xml.parsers.expat

if __name__ == "__main__":
    success = True

    ns = {"f": "http://hl7.org/fhir"}
    
    for nl_core_path in sys.argv[1:]:
        zib_path = nl_core_path.replace("nl-core", "zib")
        
        nl_core = ET.parse(nl_core_path)
        zib     = ET.parse(zib_path)
        if nl_core.getroot().tag != "{http://hl7.org/fhir}StructureDefinition":
            print(f"Resource {sd_path} is not a StructureDefinition")
            sys.exit(1)
        
        for identity in zib.findall("f:mapping/f:identity", ns):
            value = identity.attrib["value"]
            if value.startswith("zib-"):
                if not nl_core.findall(f"f:mapping/f:identity[@value = '{value}']", ns):
                    print(f"Missing mapping {value} in {nl_core_path}")
                    success = False

    if success:
        sys.exit(0)
    else:
        sys.exit(1)