from pathlib import Path

import collections
import re
import shutil
import xml.etree.ElementTree as ET

IN_DIR = Path("../../resources/zib")
OUT_DIR = Path("../../fsh-input/zib")
NS = {"f": "http://hl7.org/fhir"}

MappingDeclaration = collections.namedtuple("MappingDeclaration", ["identity", "uri", "name"])
ElementMapping = collections.namedtuple("ElementMapping", ["path", "map", "comment"])

class Profile:
    def __init__(self):
        pass

    @classmethod
    def fromXML(cls, xml_path):
        root = ET.parse(xml_path)
        instance = cls()
        instance.__parseXML__(root)
        return instance

    def __parseXML__(self, xml_root):
        self.name = xml_root.find("f:name", NS).get("value")
        self.id = xml_root.find("f:id", NS).get("value")
        self.title = xml_root.find("f:title", NS).get("value")
        self.parent = xml_root.find("f:baseDefinition", NS).get("value").replace("http://hl7.org/fhir/StructureDefinition/", "")
        
        differential = xml_root.find("f:differential", NS)
        
        self.mapping_declarations = []
        self.el_mappings = {}
        for mapping in xml_root.findall("f:mapping", NS):
            declaration = MappingDeclaration(
                mapping.find("f:identity", NS).get("value"),
                mapping.find("f:uri", NS).get("value"),
                mapping.find("f:name", NS).get("value"),
            )
            self.mapping_declarations.append(declaration)
            self.el_mappings[declaration.identity] = []

        elements = []
        for el in differential.findall("f:element", NS):
            fshPath = el.get("id")
            fshPath = ".".join(fshPath.split(".")[1:]) # Cut off resource name
            fshPath = re.sub(":(\\w*)", "[\\1]", fshPath, flags=re.MULTILINE) # Put slice names in brackets
            
            for mapping in el.findall("f:mapping", NS):
                identity = mapping.find("f:identity", NS).get("value")
                el_mapping = ElementMapping(
                    path = fshPath,
                    map = mapping.find("f:map", NS).get("value"),
                    comment = mapping.find("f:comment", NS).get("value")
                )
                self.el_mappings[identity].append(el_mapping)

    def asFSH(self):
        fsh = ""
        fsh += f"Profile: {self.name}\n"
        fsh += f"Parent: {self.parent}\n"
        fsh += f"Id: {self.id}\n"
        fsh += f'Title: "{self.title}"\n'

        for mapping in self.mapping_declarations:
            fsh += f"\nMapping: {mapping.identity}\n"
            fsh += f"Id: {mapping.identity}\n"
            fsh += f'Title: "{mapping.name}"\n'
            fsh += f"Source: {self.name}\n"
            fsh += f'Target: "{mapping.uri}"\n'
            for el_mapping in self.el_mappings[mapping.identity]:
                fsh += f'* {el_mapping.path} -> "{el_mapping.map}" "{el_mapping.comment}"\n'
        return (fsh)

if __name__ == "__main__":
    shutil.rmtree(OUT_DIR, ignore_errors=True)
    OUT_DIR.mkdir(exist_ok=True, parents=True)

    for in_file in IN_DIR.glob("zib-*.xml"):
        profile = Profile.fromXML(in_file)
        out_name = in_file.name.replace(".xml", ".fsh")
        with open(OUT_DIR / out_name, "w") as out_file:
            out_file.write(profile.asFSH())