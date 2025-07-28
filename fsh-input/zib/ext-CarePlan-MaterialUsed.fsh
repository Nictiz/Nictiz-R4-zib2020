Extension: ExtCarePlanMaterialUsed
Id: ext-CarePlan-MaterialUsed
Title: "ext CarePlan MaterialUsed"
Context: CarePlan.activity.detail
* insert ProfileMetadata(ext-CarePlan-MaterialUsed)

* value[x] only Reference(DeviceUseStatement)

// Short, alias, definition and comment texts
* ^description = "Materials that should be used during a CarePlan activity."
* value[x] ^definition = "Materials that should be used during a CarePlan activity."
