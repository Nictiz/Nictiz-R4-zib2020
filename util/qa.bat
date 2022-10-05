@echo off

SET ntsCredentialsFlag=
if exist qaAutomation/nts-credentials.env (
  SET ntsCredentialsFlag=--env-file qaAutomation/nts-credentials.env
)

docker-compose %ntsCredentialsFlag% -f qaAutomation/docker-compose.yml run --rm -p 8081:8081 qa-zib2020-r4 --menu --changed-only %*
pause