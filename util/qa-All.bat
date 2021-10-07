@echo off

SET step_num=0
:qa-Changed
echo.
call chooseStep.bat
if "%step_num%"=="-1" (GOTO :exit) else (docker-compose --env-file qaAutomation/nts-credentials.env -f qaAutomation/docker-compose.yml run --rm validate -p 8081:8081 %validation_switch% %*)
GOTO :qa-Changed

:exit
echo Exiting
