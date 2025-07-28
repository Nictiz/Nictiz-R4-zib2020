Extension: ExtProblemFurtherSpecificationProblemName
Id: ext-Problem.FurtherSpecificationProblemName
Title: "ext Problem.FurtherSpecificationProblemName"
Context: Condition.code
* insert ProfileMetadata(ext-Problem.FurtherSpecificationProblemName)

* value[x] only string

// Short, alias, definition and comment texts
* ^description = "An extension to specify the problem name. The extension can be seen as an addition to the ProblemName concept mapped to the code element."
* ^purpose = "This extension represents the FurtherSpecificationProblemName concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Problem v4.4 (2020)](https://zibs.nl/wiki/Problem-v4.4(2020EN))."
* value[x]
  * ^short = "FurtherSpecificationProblemName"
  * ^alias[+] = "NadereSpecificatieProbleemNaam"
  * ^definition = "Further specification of problem name when it is recorded via a thesaurus or code system in which the required level of detail is not (yet) available."

Mapping: ExtProblemFurtherSpecificationProblemName-to-zib-problem-v4.4-2020EN
Id: zib-problem-v4.4-2020EN
Title: "zib Problem-v4.4(2020EN)"
Source: ExtProblemFurtherSpecificationProblemName
Target: "https://zibs.nl/wiki/Problem-v4.4(2020EN)"
* value[x] -> "NL-CM:5.1.13" "FurtherSpecificationProblemName"
