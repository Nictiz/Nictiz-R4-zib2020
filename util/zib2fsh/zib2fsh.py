from dataclasses import dataclass, field
from pathlib import Path

import collections
import copy
import re
import shutil
import textwrap
import xml.etree.ElementTree as ET

IN_DIR = Path("../../resources/zib")
OUT_DIR = Path("../../fsh/NictizR4Zib2020/input/fsh")
NS = {"f": "http://hl7.org/fhir"}

# Chosen pragmatic route by hard coding the FHIR core bindings, instead of resolving core specification.
# FHIR R4 elements that have Required binding strength in the core specification
# These should not have their binding strength weakened in base profiles
FHIR_CORE_REQUIRED_BINDINGS = {
    "ContactPoint.use",
    "ContactPoint.system", 
    "Identifier.use",
    "HumanName.use",
    "Address.use",
    "Address.type",
    "Timing.repeat.durationUnit",
    "Timing.repeat.periodUnit",
    "Timing.repeat.dayOfWeek",
    "Timing.repeat.when"
}

# FHIR R4 elements that have Extensible binding strength in the core specification
# These should not have their binding strength weakened below extensible
FHIR_CORE_EXTENSIBLE_BINDINGS = {
    "Identifier.type",
    "Encounter.class",
    "Encounter.participant.type",
    "Observation.interpretation",
    "Patient.maritalStatus",
    "Patient.contact.relationship",
    "Condition.category"
}

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
    permitted_values: str = None
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
        self.uniq_id = self.id.replace("zib-", "")
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
        self.description = self.__fhirValue__(xml_root, "description")

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
                if value_set_el := binding.find("f:valueSet", NS):
                    for ext in value_set_el.findall("f:extension", NS):
                        if ext.get("url") == "http://hl7.org/fhir/StructureDefinition/11179-permitted-value-conceptmap":
                            el.permitted_values = self.__fhirValue__(ext, "valueCanonical")

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
            if el.slice_name and not (el.min or el.max):
                # If we have a slice definition or extension without min or max, we should set a default because FSH requires it
                el.min = "0"

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

    def asBase(self):
        base = copy.deepcopy(self)

        base.name = self.name.replace("Zib", "Nlbase")
        base.id = self.id.replace("zib", "nl-base")
        base.title = self.title.replace("zib", "nl base")
        base.parent = self.parent.replace("zib", "nl-base")

        for el in base.elements:
            # Remove cardinality constraints. When it is a slice definition, set them to 0..* because FSH requires them
            if not el.slice_name:
                el.min = None
                el.max = None
            else:
                if el.min != "0":
                    el.min = "0"
                #if el.max != "*":
                #    el.max = "*"    
            
            if el.comment:
                el.comment = el.comment.replace("zib-", "nl-base-")

            if el.binding_strength and el.value_set:
                # Set binding strengths to preferred, but preserve FHIR core bindings
                # Don't weaken if:
                # 1. ValueSet is from FHIR core (http://hl7.org/ or http://terminology.hl7.org/)
                # 2. Element path has Required binding in FHIR core
                # 3. Element path has Extensible binding in FHIR core (keep as extensible)
                is_hl7_valueset = (el.value_set.startswith("http://hl7.org/") or 
                                 el.value_set.startswith("http://terminology.hl7.org/"))
                
                if (not is_hl7_valueset and 
                    el.fhir_path not in FHIR_CORE_REQUIRED_BINDINGS):
                    
                    if el.fhir_path in FHIR_CORE_EXTENSIBLE_BINDINGS:
                        el.binding_strength = "extensible"
                    else:
                        el.binding_strength = "preferred"

            el.target_profiles = [p.replace("zib-", "nl-base-") for p in el.target_profiles]
            el.profiles = [p.replace("zib-", "nl-base-") for p in el.profiles]

        return base

    def asCore(self):
        core = copy.deepcopy(self)

        core.name = self.name.replace("Zib", "Nlcore")
        core.id = self.id.replace("zib", "nl-core")
        core.title = self.title.replace("zib", "nl core")
        core.parent = f"http://nictiz.nl/fhir/StructureDefinition/nl-base-{self.uniq_id}"
        
        # Mappings and constraints are defined in base
        core.mappings = []
        core.mapping_declarations = []
        core.constraints = []

        for el in core.elements:
            el.short = None
            el.alias = []
            el.definition = None
            if el.comment:
                comment = el.comment.replace("zib-", "nl-core-")
                if comment == el.comment:
                    el.comment = None # No need to override
                else:
                    el.comment = comment

            if el.min == "0":
                el.min = None
            if el.max == "*":
                el.max = None

            el.permitted_values = None

            # Don't emit discriminators again
            el.slicing_type = None
            el.slicing_path = None

            el.target_profiles = [p.replace("zib-", "nl-core-") for p in el.target_profiles if "zib-" in p]
            el.profiles = [p.replace("zib-", "nl-core-") for p in el.profiles if "zib-" in p]
            el.types = []
            el.conditions = []
            el.patterns = {
                "CodeableConcept": [],
                "Quantity": [],
                "Identifier": []
            }
        
        return core

    def asFSH(self):
        fsh = ""

        if self.parent == "Extension":
            fsh += self.__fshExtension__()
        else:
            fsh += self.__fshProfile__()

        fsh += self.__fshMappings__()
        return fsh

    def __fshInitialize__(self):
        self.handled_slices = []
    
    def __fshProfile__(self):
        self.__fshInitialize__()

        fsh = ""

        fsh += f"Profile: {self.name}\n"
        fsh += f"Parent: {self.parent}\n"
        fsh += f"Id: {self.id}\n"
        fsh += f'Title: "{self.title}"\n'
        fsh += f"* insert ProfileMetadata({self.id})\n"
        if self.zib_name and self.zib_version and self.resource_type:
            fsh += f"* insert Purpose({self.zib_name}, {self.zib_version}, {self.resource_type})\n"
        if self.purpose:
            fsh += f'* ^purpose = "{self.purpose}"\n'
        fsh += "\n"
        
        for el in self.elements:
            fsh += self.__fshExtensionsDefinition__(el)
            fsh += self.__fshSlicing__(el)
            fsh += self.__fshElementLine__(el)
            fsh += self.__fshTypes__(el)
            fsh += self.__fshTerminologyBinding__(el)
            fsh += self.__fshPatterns__(el)

        fsh += self.__fshTextSection__()

        fsh += self.__fshConstraints__()

        return fsh

    def __fshExtension__(self):
        self.__fshInitialize__()

        fsh = ""

        fsh += f"Extension: {self.name}\n"
        fsh += f"Id: {self.id}\n"
        fsh += f'Title: "{self.title}"\n'
        fsh += f"Context: {self.context}\n"
        fsh += f"* insert ProfileMetadata({self.uniq_id})\n\n"

        for el in self.elements:
            fsh += self.__fshElementLine__(el)
            fsh += self.__fshTypes__(el)
            fsh += self.__fshTerminologyBinding__(el)
            fsh += self.__fshSlicing__(el)
            fsh += self.__fshPatterns__(el)

        fsh += self.__fshTextSection__()

        fsh += self.__fshConstraints__()

        return fsh

    def __fshExtensionsDefinition__(self, el):
        if not el.fhir_path.endswith(".extension"):
            return ""
        
        extensions = []
        for ext_el in self.elements:
            if not ext_el.fhir_path == el.fhir_path:
                continue # Not an extension in the parent element
            if not (len(ext_el.types) > 0 and ext_el.types[0] == "Extension"):
                continue # Not an extension definition (but profiled path within an extension)
            if not len(ext_el.profiles) > 0:
                continue # Not an extension definition, only a constraint
            if ext_el.fsh_path in self.handled_slices:
                continue # Already handled this
            extensions.append(ext_el)
            self.handled_slices.append(ext_el.fsh_path)

        fsh_strings = []
        for extension in extensions:
            fsh = f"{extension.profiles[0]} named {extension.slice_name} {extension.min if extension.min else ''}..{extension.max if extension.max else '*'}"
            fsh_strings.append(fsh)
        if len(fsh_strings) > 0:
            fsh_path = ".".join(el.fhir_path.split(".")[1:-1])
            return f"* {fsh_path}{'.' if fsh_path else ''}extension contains\n    " + " and\n    ".join(fsh_strings) + "\n"
        return ""

    def __fshSlicing__(self, el):
        fsh = ""

        if not (el.slicing_path and el.slicing_type):
            return ""

        slicing_path = el.slicing_path.replace(")", "\\)")
        fsh += f"* {el.fsh_path}{' ' if el.fsh_path else ''}insert Discriminator({el.slicing_type}, {slicing_path})\n"

        if el.slicing_type == "type": # Type slicing works a bit different
            return fsh

        slices = []
        for sliced_el in self.elements:
            if not sliced_el.fhir_path == el.fhir_path:
                continue # Not an extension in the parent element
            if not (sliced_el.slice_name):
                continue # Not a slice
            if not (sliced_el.min or sliced_el.max):
                continue # We only write out something if we have explicit cardinalities
            if sliced_el.fsh_path in self.handled_slices:
                continue # Already handled this

            slices.append(sliced_el)
            self.handled_slices.append(sliced_el.fsh_path)

        fsh_strings = []
        for sliced_el in slices:
            fsh_string = f"{sliced_el.slice_name} {sliced_el.min if sliced_el.min else ''}..{sliced_el.max if sliced_el.max else ''}"
            fsh_strings.append(fsh_string)
        fsh += f"* {el.fsh_path} contains\n    " + " and\n    ".join(fsh_strings) + "\n"
        
        return fsh

    def __fshElementLine__(self, el):
        # Write a line if we have explicit cardinality, constraints or conditions. Cardinality is only written if it
        # wasn't defined already in a "contains" line.
        write_out = False
        if (el.min or el.max):
            if el.fsh_path not in self.handled_slices:
                if not (el.slice_name and el.fhir_path.endswith("[x]") and el.min == "0" and el.max in [None, "*"]): # Don't write out type slices with default cardinalities
                    write_out = True
        if len(el.constraints) > 0:
            write_out = True
        if len(el.conditions) > 0:
            write_out = True
        if el.permitted_values:
            write_out = True

        if not write_out:
            return ""

        fsh = f"* {el.fsh_path if el.fsh_path else '.'}"
        card = False
        if (el.min or el.max) and (el.fsh_path not in self.handled_slices):
            fsh += f" {el.min if el.min else ''}..{el.max if el.max else ''}"
            card = True

        fsh_strings = []
        if len(el.constraints) > 0:
            fsh_strings.append(f"obeys " + " and ".join(el.constraints))
        for condition in el.conditions:
            fsh_strings.append(f"^condition[+] = {condition}")
        if el.permitted_values:
            fsh_strings.append(f"insert PermittedValues({el.permitted_values})")
        if card or len(fsh_strings) > 1: # Multiple lines
            fsh += "\n"
            for fsh_string in fsh_strings:
                fsh += f"  * {fsh_string}\n"
        else:
            fsh += f" {fsh_strings[0]}\n"

        return fsh

    def __fshTypes__(self, el):
        fsh = ""

        if len(el.types) > 0:
            if el.types[0] == "Extension": # Extensions are handled different in FSH
                pass
            elif len(el.target_profiles):
                fsh += f"* {el.fsh_path} only Reference({' or '.join(el.target_profiles)})\n"
            else:
                fsh += f"* {el.fsh_path} only {' or '.join(el.types)}\n" # Not bulletproof, but it doesn't need to be
            if el.types[0] != "Extension":
                for profile in el.profiles:
                    fsh += f"* {el.fsh_path} ^type.profile = {profile}\n"

        return fsh

    def __fshTerminologyBinding__(self, el):
        fsh = ""

        if el.value_set or el.binding_strength:
            fsh += f"* {el.fsh_path} from {el.value_set}"
            if el.binding_strength:
                fsh += f" ({el.binding_strength})\n"

        return fsh

    def __fshPatterns__(self, el):
        fsh = ""

        for pattern in el.patterns["CodeableConcept"]:
            fsh += f"* {el.fsh_path} = {pattern.system}#{pattern.code}\n"
        for pattern in el.patterns["Quantity"]:
            value_fsh = f"{pattern.value} " if pattern.value else ""
            # For quantity patterns, always use the full system#code format to avoid the UCOM Code including the char: ` like [p'diop] 
            code_fsh = f"{pattern.system}#{pattern.code}"
            unit_fsh = f' "{pattern.unit}"' if pattern.unit else ""
            fsh += f"* {el.fsh_path} = {value_fsh}{code_fsh}{unit_fsh}\n"
        for pattern in el.patterns["Identifier"]:
            fsh += f'* {el.fsh_path} ^patternIdentifier.system = "{pattern.system}"\n'

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
        if self.description:
            fsh += f"* ^description = {self.__tripleQuote__(self.description, 4)}\n"
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
                quoted += f"{' ' * indent_level}" + line.replace('\"', '\\\"') + "\n"
            quoted += f'{" " * indent_level}"""'
            return quoted
        else:
            return '\"' + text.replace('\"', '\\\"') + '\"'

if __name__ == "__main__":
    shutil.rmtree(OUT_DIR, ignore_errors=True)
    OUT_DIR.mkdir(exist_ok=True, parents=True)

    with open(OUT_DIR / "Utility.fsh", "w") as out_file:
        out_file.write(textwrap.dedent("""\
        RuleSet: Discriminator(type, path)
        * ^slicing.discriminator.type = #{type}
        * ^slicing.discriminator.path = "{path}"
        * ^slicing.rules = #open

        RuleSet: PermittedValues(canonical)
        * ^binding.valueSet.extension[+].url = "http://hl7.org/fhir/StructureDefinition/11179-permitted-value-conceptmap"
        * ^binding.valueSet.extension[=].valueCanonical = "{canonical}"
        """))
    
    with open(OUT_DIR / "Metadata.fsh", "w") as out_file:
        out_file.write(textwrap.dedent("""\
        RuleSet: BaseProfileMetadata(UniqueId)
        * insert ProfileMetadata(nl-base-{UniqueId})

        RuleSet: CoreProfileMetadata(UniqueId)
        * insert ProfileMetadata(nl-core-{UniqueId})

        RuleSet: ZibProfileMetadata(UniqueId)
        * insert ProfileMetadata(zib-{UniqueId})

        RuleSet: ProfileMetadata(id)
        * ^url = "http://nictiz.nl/fhir/StructureDefinition/{id}"
        * insert BoilerPlate

        RuleSet: Purpose(ZibName, ZibVersion, ResourceType)
        * ^purpose = "This {ResourceType} resource represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) {ZibName} v{ZibVersion} (2020)](https://zibs.nl/wiki/{ZibName}-v{ZibVersion}(2020EN))."

        RuleSet: BoilerPlate
        * ^text.status = #empty
        * ^text.div = "<div xmlns=\\\"http://www.w3.org/1999/xhtml\\\">No narrative is provided for definitional resources. A human-readable rendering can be found in the implementation guide(s) where this resource is used.</div>"
        * ^status = #draft
        * ^publisher = "Nictiz"
        * ^contact.name = "Nictiz"
        * ^contact.telecom.system = #url
        * ^contact.telecom.value = "https://www.nictiz.nl"
        * ^contact.telecom.use = #work
        * ^copyright = "Copyright and related rights waived via CC0, https://creativecommons.org/publicdomain/zero/1.0/. This does not apply to information from third parties, for example a medical terminology system. The implementer alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize third party IP in connection with the specification or otherwise."
        """))

    for in_file in IN_DIR.glob("*.xml"):
        profile = Profile.fromXML(in_file)
        base = profile.asBase()
        out_name = in_file.name.replace("zib-", "nl-base-").replace(".xml", ".fsh")
        with open(OUT_DIR / out_name, "w") as out_file:
            out_file.write(base.asFSH())

        if in_file.name.startswith("zib-"):
            core = profile.asCore()
            out_name = in_file.name.replace("zib-", "nl-core-").replace(".xml", ".fsh")
            with open(OUT_DIR / out_name, "w") as out_file:
                out_file.write(core.asFSH())
