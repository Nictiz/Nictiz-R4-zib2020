Extension: ExtPayerBankInformation
Id: ext-Payer.BankInformation
Title: "ext Payer.BankInformation"
Context: Coverage
* insert ProfileMetadata(ext-Payer.BankInformation)

* extension insert Discriminator(value, url)
* extension contains
    bankName 0..1 and
    bankCode 0..1 and
    accountNumber 0..1
* extension[bankName].value[x] only string
* extension[bankCode].value[x] only string
* extension[accountNumber].value[x] only string

// Short, alias, definition and comment texts
* ^description = "This extension adds the BankInformation concept of the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) Payer v3.1.1 (2020)](https://zibs.nl/wiki/Payer-v3.1.1(2020EN)) to the `.payor` element of the Consent resource. The extension contains all data elements of the BankInformation concept."
* .
  * ^short = "BankInformation"
  * ^alias[+] = "Bankgegevens"
* extension[bankName].value[x]
  * ^short = "BankName"
  * ^alias[+] = "BankNaam"
  * ^definition = "Name of the financial organization."
* extension[bankCode].value[x]
  * ^short = "BankCode"
  * ^alias[+] = "Bankcode"
  * ^definition = "Code indicating the bank and branch. For European countries, this is the organization’s BIC or SWIFT code."
* extension[accountNumber].value[x]
  * ^short = "AccountNumber"
  * ^alias[+] = "Rekeningnummer"
  * ^definition = "The payer’s bank account number at the listed organization. For European countries, this is the IBAN."

Mapping: ExtPayerBankInformation-to-zib-payer-v3.1.1-2020EN
Id: zib-payer-v3.1.1-2020EN
Title: "zib Payer-v3.1.1(2020EN)"
Source: ExtPayerBankInformation
Target: "https://zibs.nl/wiki/Payer-v3.1.1(2020EN)"
*  -> "NL-CM:1.1.4" "BankInformation"
* extension[bankName].value[x] -> "NL-CM:1.1.9" "BankName"
* extension[bankCode].value[x] -> "NL-CM:1.1.10" "BankCode"
* extension[accountNumber].value[x] -> "NL-CM:1.1.11" "AccountNumber"
