Extension: ExtPharmaceuticalProductDescription
Id: ext-PharmaceuticalProduct.Description
Title: "ext PharmaceuticalProduct.Description"
Context: Medication
* insert ProfileMetadata(ext-PharmaceuticalProduct.Description)

* . 0..1
* value[x] only string

// Short, alias, definition and comment texts
* ^description = "An extension to provide a textual description of the type of medication (including relevant properties of the composition and preparation method if possible), which is only used if no coded indication from the G Standard is available (historical data regarding magistral preparation which has been entered as free text instead of entering the substance codes)."
* ^purpose = "This extension represents the Description concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) PharmaceuticalProduct v2.1.2 (2020)](https://zibs.nl/wiki/PharmaceuticalProduct-v2.1.2(2020EN)), which is only used if no coded indication from the G Standard is available."
* value[x]
  * ^short = "Description"
  * ^alias[+] = "Omschrijving"
  * ^definition = "A textual description of the type of medication (including relevant properties of the composition and preparation method if possible), which is only used if no coded indication from the G Standard is available (historical data regarding magistral preparation which has been entered as free text instead of entering the substance codes)."

Mapping: ExtPharmaceuticalProductDescription-to-zib-pharmaceuticalproduct-v2.1.2-2020EN
Id: zib-pharmaceuticalproduct-v2.1.2-2020EN
Title: "zib PharmaceuticalProduct-v2.1.2(2020EN)"
Source: ExtPharmaceuticalProductDescription
Target: "https://zibs.nl/wiki/PharmaceuticalProduct-v2.1.2(2020EN)"
* value[x] -> "NL-CM:9.7.19784" "Description"
