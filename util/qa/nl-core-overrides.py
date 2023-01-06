#!/usr/bin/env python

# Simple script to report all references to a zib profile in the snapshot of an nl-core profile.
# This should not be the case, all zib profiles should be overwritten by their nl-core counterparts.

import json
import sys

def scanForZibReferences(root, hits, element_id = "", element = "unknown"):
    # Recursively walk the JSON tree to find all string values.

    if type(root) == list:
        for entry in root:
            scanForZibReferences(entry, hits, element_id)
    elif type(root) == dict:
        if "id" in root:
            element_id = root["id"]
        for entry in root:
            scanForZibReferences(root[entry], hits, element_id, entry)
    elif type(root) == str:
        if "StructureDefinition/zib-" in root: # Our "magic string" to detect references to zib profiles. It doesn't contain the full hostname and path so that it catches misspelled references as well.
            if element != "source": # constraint.source is the one exception where the reference to the zib profile is required
                hits.append((element_id, element, root))

    return hits

if __name__ == "__main__":
    success = True

    for path in sys.argv[1:]:
        with open(path, "r") as in_file:
            sd = json.load(in_file)
    
        id = sd["id"]
        if "snapshot" in sd:
            hits = scanForZibReferences(sd["snapshot"]["element"], [])
        else:
            print(f"No snapshot in {id}!")
            success = False
    
        if len(hits) > 0:
            success = False
            print(f"In {id}:")
            for hit in hits:
                print(f"- {hit[0]} ({hit[1]}): {hit[2]}")
            print()
        
    sys.exit(0 if success else 1)