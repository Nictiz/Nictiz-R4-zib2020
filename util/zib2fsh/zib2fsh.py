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
PatternCodeableConcept = collections.namedtuple("PatternCodeableConcept", ["system", "code"])
PatternQuantity = collections.namedtuple("PatternQuantity", ["value", "system", "code", "unit"])
PatternIdentifier = collections.namedtuple("PatternIdentifier", ["system"])

@dataclass
class Element:
    fsh_path: str
    fhir_path: str
    min: int = None
    max: str = None
    short: str = None
    alias: list[str] = field(default_factory=list)
    definition: str = None
    comment: str = None
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
    patterns: dict[str, list[str]] = field(default_factory=lambda: {"CodeableConcept": [], "Quantity": [], "Identifier": []})

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
        if self.parent == "Extension":
            # We only have contexts of type "element"
            context = xml_root.find("f:context", NS)
            self.context = self.__fhirValue__(context, "expression")

        self.zib_name = None
        self.zib_version = None
        self.resource_type = None
        self.purpose = None
        purpose = self.__fhirValue__(xml_root, "purpose")
        if purpose:
            if match := re.search("^This (\\w+) resource represents the Dutch \\[zib \\('Zorginformatiebouwsteen', i.e. Health and Care Information Model\\) (\\w+) v(\\S+) ", purpose, re.MULTILINE):
                self.zib_name = match.group(2)
                self.zib_version = match.group(3)
                self.resource_type = match.group(1)
            else:
                self.purpose = purpose

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
            
            el.short = self.__fhirValue__(xml_el, "short")
            for alias in xml_el.findall("f:alias", NS):
                el.alias.append(alias.get("value"))
            el.definition = self.__fhirValue__(xml_el, "definition")
            el.comment = self.__fhirValue__(xml_el, "comment")

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
            
            for pattern_el in xml_el.findall("f:patternCodeableConcept", NS):
                coding_el = pattern_el.find("f:coding", NS)
                pattern = PatternCodeableConcept(
                    self.__fhirValue__(coding_el, "system"),
                    self.__fhirValue__(coding_el, "code"),
                )
                el.patterns["CodeableConcept"].append(pattern)

            for pattern_el in xml_el.findall("f:patternQuantity", NS):
                pattern = PatternQuantity(
                    self.__fhirValue__(pattern_el, "value"),
                    self.__fhirValue__(pattern_el, "system"),
                    self.__fhirValue__(pattern_el, "code"),
                    self.__fhirValue__(pattern_el, "unit"),
                )
                el.patterns["Quantity"].append(pattern)

            for pattern_el in xml_el.findall("f:patternIdentifier", NS):
                pattern = PatternIdentifier(
                    self.__fhirValue__(pattern_el, "system"),
                )
                el.patterns["Identifier"].append(pattern)

    def asFSH(self):
        fsh = ""

        if self.parent == "Extension":
            fsh += self.__fshExtension__()
        else:
            fsh += self.__fshProfile__()

        fsh += self.__fshMappings__()
        return fsh
    
    def __fshProfile__(self):
        fsh = ""

        fsh += f"Profile: {self.name}\n"
        fsh += f"Parent: {self.parent}\n"
        fsh += f"Id: {self.id}\n"
        fsh += f'Title: "{self.title}"\n'
        if self.zib_name and self.zib_version:
            fsh += f"* insert CoreProfileMetaData({self.zib_name}, {self.zib_version}, {self.resource_type})\n"
        else:
            if self.purpose:
                fsh += f'* ^purpose = "{self.purpose}"\n'
            fsh += "* insert BoilerPlate\n"

        # Write out extensions first
        fsh += self.__fshExtensions__()

        for el in self.elements:
            fsh += self.__fshElementLine__(el)
            fsh += self.__fshTypes__(el)
            fsh += self.__fshTerminologyBinding__(el)
            fsh += self.__fshSlicing__(el)
            fsh += self.__fshPatterns__(el)

        fsh += self.__fshTextSection__()

        fsh += self.__fshConstraints__()

        return fsh

    def __fshExtension__(self):
        fsh = ""

        fsh += f"Extension: {self.name}\n"
        fsh += f"Id: {self.id}\n"
        fsh += f'Title: "{self.title}"\n'
        fsh += f"Context: {self.context}\n"

        for el in self.elements:
            fsh += self.__fshElementLine__(el)
            fsh += self.__fshTypes__(el)
            fsh += self.__fshTerminologyBinding__(el)
            fsh += self.__fshSlicing__(el)
            fsh += self.__fshPatterns__(el)

        fsh += self.__fshTextSection__()

        fsh += self.__fshConstraints__()

        return fsh

    def __fshExtensions__(self):
        extensions = [el for el in self.elements if len(el.types) > 0 and el.types[0] == "Extension"]
        fsh_strings = []
        for el in extensions:
            fsh = f"{el.profiles[0]} named {el.slice_name} {el.min if el.min else ''}..{el.max if el.max else '*'}"
            fsh_strings.append(fsh)
        if len(fsh_strings) > 0:
            return f"* extension contains:\n    " + " and\n    ".join(fsh_strings) + "\n"
        return ""

    def __fshElementLine__(self, el):
        write_out = [
            (el.min or el.max) and not el.slice_name,
            len(el.constraints) > 0,
            len(el.conditions) > 0,
        ]
        if not any(write_out):
            return ""

        fsh = f"* {el.fsh_path}"
        card = False
        if (el.min or el.max) and not el.slice_name:
            fsh += f" {el.min if el.min else ''}..{el.max if el.max else ''}"
            card = True

        fsh_strings = []
        if len(el.constraints) > 0:
            fsh_strings.append(f"obeys " + " and ".join(el.constraints))
        for condition in el.conditions:
            fsh_strings.append(f"^condition[+] = {condition}")
        if card or len(fsh_strings) > 1:
            fsh += "\n"
            for fsh_string in fsh_strings:
                fsh += f"  * {fsh_string}\n"
        else:
            fsh += f" {fsh_strings[0]}\n"

        return fsh

    def __fshTypes__(self, el):
        fsh = ""

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

        return fsh

    def __fshTerminologyBinding__(self, el):
        fsh = ""

        if el.value_set or el.binding_strength:
            fsh += f"* {el.fsh_path} from {el.value_set}"
            if el.binding_strength:
                fsh += f" ({el.binding_strength})\n"

        return fsh

    def __fshSlicing__(self, el):
        fsh = ""

        if el.slicing_path and el.slicing_type :
            fsh += f"* insert Discriminator({el.fsh_path}, {el.slicing_type}, {el.slicing_path})\n"
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
        
        return fsh

    def __fshPatterns__(self, el):
        fsh = ""

        for pattern in el.patterns["CodeableConcept"]:
            fsh += f"* {el.fsh_path} = {pattern.system}#{pattern.code}\n"
        for pattern in el.patterns["Quantity"]:
            value_fsh = f"{pattern.value} " if pattern.value else ""
            if pattern.system == "http://unitsofmeasure.org":
                code_fsh = f"'{pattern.code}'"
            else:
                code_fsh = f"{pattern.system}#{pattern.code}"
            unit_fsh = f' "{pattern.unit}"' if pattern.unit else ""
            fsh += f"* {el.fsh_path} = {value_fsh}{code_fsh}{unit_fsh}\n"
        for pattern in el.patterns["Identifier"]:
            fsh += f'* {el.fsh_path} ^system = "{pattern.system}"\n'

        return fsh

    def __fshMappings__(self):
        fsh = ""

        for mapping in self.mapping_declarations:
            fsh += f"\nMapping: {self.name}-to-{mapping.identity}\n"
            fsh += f"Id: {mapping.identity}\n"
            fsh += f'Title: "{mapping.name}"\n'
            fsh += f"Source: {self.name}\n"
            fsh += f'Target: "{mapping.uri}"\n'
            for el_mapping in self.el_mappings[mapping.identity]:
                fsh += f'* {el_mapping.fsh_path} -> "{el_mapping.map}" "{el_mapping.comment}"\n'

        return fsh

    def __fshConstraints__(self):
        fsh = ""

        for constraint in self.constraints:
            fsh += f"\nInvariant: {constraint.key}\n"
            fsh += f'Description: "{constraint.human}"\n'
            fsh += f"Severity: #{constraint.severity}\n"
            fsh += f'Expression: "{constraint.expression}"\n'
        
        return fsh

    def __fshTextSection__(self):
        fsh = ""
        for el in self.elements:
            fsh_strings = []
            if el.short:
                fsh_strings.append(f'^short = "{el.short}"')
            for alias in el.alias:
                fsh_strings.append(f'^alias[+] = "{alias}"')
            if el.definition:
                fsh_strings.append("^definition = " + self.__tripleQuote__(el.definition, 4))
            if el.comment:
                fsh_strings.append("^comment = " + self.__tripleQuote__(el.comment, 4))
            
            if len(fsh_strings) == 1:
                fsh += f"* {el.fsh_path if el.fsh_path else '.'} {fsh_strings[0]}\n"
            elif len(fsh_strings) > 1:
                fsh += f"* {el.fsh_path if el.fsh_path else '.'}\n"
                fsh += "  * " + "\n  * ".join(fsh_strings) + "\n"
        if len(fsh):
            return "\n// Short, alias, definition and comment texts\n" + fsh
        return ""

    def __tripleQuote__(self, text, indent_level):
        lines = text.split("\n")
        if len(lines) > 1:
            quoted = '"""\n'
            for line in lines:
                quoted += f"{' ' * indent_level}{line}\n"
            quoted += f'{" " * indent_level}"""'
            return quoted
        else:
            return f'"{text}"'

if __name__ == "__main__":
    shutil.rmtree(OUT_DIR, ignore_errors=True)
    OUT_DIR.mkdir(exist_ok=True, parents=True)

    for in_file in IN_DIR.glob("*.xml"):
        profile = Profile.fromXML(in_file)
        out_name = in_file.name.replace(".xml", ".fsh")
        with open(OUT_DIR / out_name, "w") as out_file:
            out_file.write(profile.asFSH())