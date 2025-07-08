from dataclasses import dataclass
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

@dataclass
class Element:
    path: str
    min: int = None
    max: str = None

class Profile:
    def __init__(self):
        pass

    @classmethod
    def fromXML(cls, xml_path):
        root = ET.parse(xml_path)
        instance = cls()
        instance.__parseXML__(root)
        return instance

    def __fhirValue__(self, root, el_name):
        el = root.find("f:" + el_name, NS)
        if el != None:
            return el.get("value")
        return None

    def __parseXML__(self, xml_root):
        self.name = self.__fhirValue__(xml_root, "name")
        self.id = self.__fhirValue__(xml_root, "id")
        self.title = self.__fhirValue__(xml_root, "title")
        self.parent = self.__fhirValue__(xml_root, "baseDefinition").replace("http://hl7.org/fhir/StructureDefinition/", "")
        
        self.mapping_declarations = []
        self.el_mappings = {}
        for mapping in xml_root.findall("f:mapping", NS):
            declaration = MappingDeclaration(
                self.__fhirValue__(mapping, "identity"),
                self.__fhirValue__(mapping, "uri"),
                self.__fhirValue__(mapping, "name")
            )
            self.mapping_declarations.append(declaration)
            self.el_mappings[declaration.identity] = []

        self.elements = []
        differential = xml_root.find("f:differential", NS)
        for xml_el in differential.findall("f:element", NS):
            fshPath = xml_el.get("id")
            fshPath = ".".join(fshPath.split(".")[1:]) # Cut off resource name
            fshPath = re.sub(":(\\w*)", "[\\1]", fshPath, flags=re.MULTILINE) # Put slice names in brackets
            el = Element(fshPath)
            el.min = self.__fhirValue__(xml_el, "min")
            el.max = self.__fhirValue__(xml_el, "max")
            self.elements.append(el)
            
            for mapping in xml_el.findall("f:mapping", NS):
                identity = self.__fhirValue__(mapping, "identity")
                el_mapping = ElementMapping(
                    path = fshPath,
                    map = self.__fhirValue__(mapping, "map"),
                    comment = self.__fhirValue__(mapping, "comment")
                )
                self.el_mappings[identity].append(el_mapping)

    def asFSH(self):
        fsh = ""
        fsh += f"Profile: {self.name}\n"
        fsh += f"Parent: {self.parent}\n"
        fsh += f"Id: {self.id}\n"
        fsh += f'Title: "{self.title}"\n'
        for el in self.elements:
            if el.min or el.max:
                fsh += f"* {el.path} {el.min if el.min else ''}..{el.max if el.max else ''}\n"

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