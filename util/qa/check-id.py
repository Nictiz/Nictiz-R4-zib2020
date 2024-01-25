#!/usr/bin/env python3

import json
import pathlib
import sys
import xml.etree.ElementTree as ET

def reportMissing(pure_path):
    print(f"Resource {pure_path} has no .id")

def reportMismatch(pure_path):
    print(f"Resource id doesn't match the file name in {pure_path}")

if __name__ == "__main__":
    success = True

    for file_path in sys.argv[1:]:
        pure_path = pathlib.PurePath(file_path)

        if pure_path.suffix.lower() == ".json":
            root = json.load(open(file_path))
            if "id" not in root:
                reportMissing(pure_path)
                success = False
            elif root["id"] != pure_path.stem:
                reportMismatch(pure_path)
                success = False
        elif pure_path.suffix.lower() == ".xml":
            root = ET.fromstring(open(pure_path).read())
            id = root.find("{http://hl7.org/fhir}id")
            if id == None:
                reportMissing(pure_path)
                success = False
            elif "value" not in id.attrib or id.attrib["value"] != pure_path.stem:
                reportMismatch(pure_path)
                success = False

    if not success:
        print("\nSome invalid resources were found!")
        sys.exit(1)
    else:
        print("No problems found")