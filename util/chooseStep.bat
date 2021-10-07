@echo off

echo -1: None
echo  0. Perform full check
echo  ----
echo  1. Validate zib profiles
echo  2. Validate zib extensions
echo  3. Validate nl-core profiles
echo  4. Validate nl-core extensions
echo  5. Validate other profiles
echo  6. Validate ConceptMaps
echo  7. Validate other terminology
echo  8. Validate examples
echo  9. Check zib compliance

SET /P step_num=Choose a step to run (%step_num%): 
if "%step_num%"=="0" (SET validation_switch=)
if "%step_num%"=="1" (SET validation_switch=--zib-profiles)
if "%step_num%"=="2" (SET validation_switch=--zib-extensions)
if "%step_num%"=="3" (SET validation_switch=--nl-core-profiles)
if "%step_num%"=="4" (SET validation_switch=--nl-core-extensions)
if "%step_num%"=="5" (SET validation_switch=--other-profiles)
if "%step_num%"=="6" (SET validation_switch=--conceptmaps)
if "%step_num%"=="7" (SET validation_switch=--other-terminology)
if "%step_num%"=="8" (SET validation_switch=--examples)
if "%step_num%"=="9" (SET validation_switch=--zib-compliance)
