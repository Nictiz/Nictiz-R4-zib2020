@echo off

if not defined step_num (SET step_num=0)
if not defined changed_only (SET changed_only=--changed-only)
if not defined disable_tx (SET disable_tx=)
if not defined inspect_tx (SET inspect_tx=)

:selectStep
SET input=%step_num%

echo Steps to choose:
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
echo.
echo Other options:
if "%changed_only%"=="" (
  echo  a. Check just changed resources (currently: everything^)
) else (
  echo  a. Check everything (currently: just the the changed resources^)
)
if "%disable_tx%"=="" (
  echo  b. Disable terminology server (currently: use the terminology server^)
  if "%inspect_tx%"=="" (
    echo  c. Inspect terminology server calls (currently: Docker shuts down after all checks are performed^)
  ) else (
    echo  c. Don't inspect terminology server calls (currently: Docker will keep running after all checks are performed^)
  )
) else (
  echo  b. Enable terminology server (currently: terminology server use is disabled^)
)
echo  q. Quit

SET /P input=Choose a step to run (%step_num%):
 
if "%input%"=="a" (
  if "%changed_only%"=="" (SET changed_only=--changed-only) else (SET changed_only=)
  GOTO :selectStep
)
if "%input%"=="b" (
  if "%disable_tx%"=="" (
    SET disable_tx=--no-tx
    SET inspect_tx=
  ) else (
    SET disable_tx=
  )
  GOTO :selectStep
)
if "%input%"=="c" (
  if "%inspect_tx%"=="" (SET inspect_tx=--inspect-tx) else (SET inspect_tx=)
  GOTO :selectStep
)
if "%input%"=="q" (
  GOTO :exit
)

if not "%input%"=="" (SET step_num=%input%)

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
echo docker-compose --env-file qaAutomation/nts-credentials.env -f qaAutomation/docker-compose.yml run --rm -p 8081:8081 validate %validation_switch% %changed_only% %disable_tx% %inspect_tx%
docker-compose --env-file qaAutomation/nts-credentials.env -f qaAutomation/docker-compose.yml run --rm -p 8081:8081 validate %validation_switch% %changed_only% %disable_tx% %inspect_tx%
GOTO :selectStep

:exit
echo Exiting