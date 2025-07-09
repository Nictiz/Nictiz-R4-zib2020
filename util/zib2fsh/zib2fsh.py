from dataclasses import dataclass, field
from pathlib import Path

import collections
import re
import shutil
import xml.etree.ElementTree as ET

IN_DIR = Path("../../resources/zib")
OUT_DIR = Path("../../fsh-input/zib")
NS = {"f": "http://hl7.org/fhir"}

MappingDeclaration = collections.namedtuple("MappingDeclaration", ["identity", "uri", "name"])
ElementMapping = collections.namedtuple("ElementMapping", ["fsh_path", "map", "comment"])

@dataclass
class Element:
    fsh_path: str
    fhir_path: str
    min: int = None
    max: str = None
    value_set: str = None
    binding_strength: str = None
    types: list[str] = field(default_factory=list)
    target_profiles: list[str] = field(default_factory=list)
    profiles: list[str] = field(default_factory=list)
    slicing_type: str = None
    slicing_path: str = None
    slice_name: str = None
    constraints: list[str] = field(default_factory=list) # Only constraint keys here
    conditions: list[str] = field(default_factory=list)

@dataclass
class Constraint:
    key: str
    severity: str
    human: str
    expression: str

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
        self.constraints = []
        differential = xml_root.find("f:differential", NS)
        for xml_el in differential.findall("f:element", NS):
            fsh_path = xml_el.get("id")
            fsh_path = ".".join(fsh_path.split(".")[1:]) # Cut off resource name
            fsh_path = re.sub("(\\.?)\\w+\\[x]\\:([\\w-]+)", "\\1\\2", fsh_path) # When the pattern is element[x]:elementDataType, in FSH this needs to be simply elementDataType. This conversion isn't bulletproof, but good enough for our puropses
            fsh_path = re.sub(":([\\w-]+)", "[\\1]", fsh_path, flags=re.MULTILINE) # Put slice names in brackets
            
            el = Element(fsh_path, self.__fhirValue__(xml_el, "path"))
            self.elements.append(el)

            el.min = self.__fhirValue__(xml_el, "min")
            el.max = self.__fhirValue__(xml_el, "max")
            
            binding = xml_el.find("f:binding", NS)
            if binding != None:
                el.value_set = self.__fhirValue__(binding, "valueSet")
                el.binding_strength = self.__fhirValue__(binding, "strength")

            data_type = xml_el.find("f:type", NS)
            if data_type != None:
                for code in data_type.findall("f:code", NS):
                    el.types.append(code.get("value"))
                for profile in data_type.findall("f:targetProfile", NS):
                    el.target_profiles.append(profile.get("value"))
                for profile in data_type.findall("f:profile", NS):
                    el.profiles.append(profile.get("value"))

            slicing = xml_el.find("f:slicing", NS)
            if slicing != None:
                discriminator = slicing.find("f:discriminator", NS)
                el.slicing_type = self.__fhirValue__(discriminator, "type")
                el.slicing_path = self.__fhirValue__(discriminator, "path")
            el.slice_name = self.__fhirValue__(xml_el, "sliceName")

            for mapping in xml_el.findall("f:mapping", NS):
                identity = self.__fhirValue__(mapping, "identity")
                el_mapping = ElementMapping(
                    fsh_path = fsh_path,
                    map = self.__fhirValue__(mapping, "map"),
                    comment = self.__fhirValue__(mapping, "comment")
                )
                self.el_mappings[identity].append(el_mapping)
            
            for constraint_el in xml_el.findall("f:constraint", NS):
                constraint = Constraint(
                    self.__fhirValue__(constraint_el, "key"),
                    self.__fhirValue__(constraint_el, "severity"),
                    self.__fhirValue__(constraint_el, "human"),
                    self.__fhirValue__(constraint_el, "expression")
                )
                self.constraints.append(constraint)
                el.constraints.append(constraint.key)
            
            for condition_el in xml_el.findall("f:condition", NS):
                el.conditions.append(condition_el.get("value"))

    def asFSH(self):
        fsh = ""
        fsh += f"Profile: {self.name}\n"
        fsh += f"Parent: {self.parent}\n"
        fsh += f"Id: {self.id}\n"
        fsh += f'Title: "{self.title}"\n'

        # Write out extensions first
        extension_elements = [ext_el for ext_el in self.elements if len(ext_el.types) > 0 and ext_el.types[0] == "Extension"]
        extension_fsh_strings = []
        for ext_el in extension_elements:
            ext_fsh = f"{ext_el.profiles[0]} named {ext_el.slice_name} {ext_el.min if ext_el.min else ''}..{ext_el.max if ext_el.max else '*'}"
            extension_fsh_strings.append(ext_fsh)
        if len(extension_fsh_strings) > 0:
            fsh += f"* extension contains:\n    " + " and\n    ".join(extension_fsh_strings) + "\n"

        for el in self.elements:
            if (el.min or el.max) and not el.slice_name:
                fsh += f"* {el.fsh_path} {el.min if el.min else ''}..{el.max if el.max else ''}\n"
            if len(el.types) > 0:
                if el.types[0] != "Extension":
                    for profile in el.profiles:
                        fsh += f"* {el.fsh_path} ^type.profile = {profile}\n"
                if el.types[0] == "Extension": # Extensions are handled different in FSH
                    pass
                elif len(el.target_profiles):
                    fsh += f"* {el.fsh_path} only Canonical({' or '.join(el.target_profiles)})\n"
                else:
                    fsh += f"* {el.fsh_path} only {' or '.join(el.types)}\n" # Not bulletproof, but it doesn't need to be
            if el.value_set or el.binding_strength:
                fsh += f"* {el.fsh_path} from {el.value_set}"
                if el.binding_strength:
                    fsh += f" ({el.binding_strength})\n"
            if el.slicing_path and el.slicing_type :
                fsh += f"* {el.fsh_path} ^slicing.discriminator.type = #{el.slicing_type}\n"
                fsh += f'* {el.fsh_path} ^slicing.discriminator.path = "{el.slicing_path}"\n'
                fsh += f"* {el.fsh_path} ^slicing.rules = #open\n" # default
                if el.slicing_type != "type": # Type slicing works a bit different
                    sliced_elements = [sliced_el for sliced_el in self.elements if (sliced_el.slice_name != None and sliced_el.fhir_path == el.fhir_path)]
                    slice_declarations = []
                    for sliced_el in sliced_elements:
                        slice_declaration = sliced_el.slice_name

                        if sliced_el.min or sliced_el.max:
                            slice_declaration += f" {sliced_el.min if sliced_el.min else ''}..{sliced_el.max if sliced_el.max else ''}"
                        else:
                            # It is required to add a cardinality, so default to ..* if nothing exists
                            slice_declaration += " ..*"
                        slice_declarations.append(slice_declaration)
                    fsh += f"* {el.fsh_path} contains\n    " + " and\n    ".join(slice_declarations) + "\n"
            if len(el.constraints) > 0:
                fsh += f"* {el.fsh_path}{' ' if el.fsh_path else ''}obeys " + " and ".join(el.constraints) + "\n"
            for condition in el.conditions:
                fsh += f"* {el.fsh_path} ^condition = {condition}\n"

        for mapping in self.mapping_declarations:
            fsh += f"\nMapping: {self.name}-to-{mapping.identity}\n"
            fsh += f"Id: {mapping.identity}\n"
            fsh += f'Title: "{mapping.name}"\n'
            fsh += f"Source: {self.name}\n"
            fsh += f'Target: "{mapping.uri}"\n'
            for el_mapping in self.el_mappings[mapping.identity]:
                fsh += f'* {el_mapping.fsh_path} -> "{el_mapping.map}" "{el_mapping.comment}"\n'

        for constraint in self.constraints:
            fsh += f"\nInvariant: {constraint.key}\n"
            fsh += f'Description: "{constraint.human}"\n'
            fsh += f"Severity: #{constraint.severity}\n"
            fsh += f'Expression: "{constraint.expression}"\n'

        return (fsh)

if __name__ == "__main__":
    shutil.rmtree(OUT_DIR, ignore_errors=True)
    OUT_DIR.mkdir(exist_ok=True, parents=True)

    for in_file in IN_DIR.glob("zib-*.xml"):
        profile = Profile.fromXML(in_file)
        out_name = in_file.name.replace(".xml", ".fsh")
        with open(OUT_DIR / out_name, "w") as out_file:
            out_file.write(profile.asFSH())