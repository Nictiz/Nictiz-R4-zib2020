@echo off

SET ntsCredentialsFlag=
if exist qa/nts-credentials.env (
  SET ntsCredentialsFlag=--env-file qa/nts-credentials.env
)

docker-compose %ntsCredentialsFlag% -f qa/docker-compose.yml up %*
pause
