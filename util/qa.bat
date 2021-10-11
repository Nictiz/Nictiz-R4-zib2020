@echo off

docker-compose --env-file qaAutomation/nts-credentials.env -f qaAutomation/docker-compose.yml run --rm -p 8081:8081 qa-zib2020-r4 --menu --changed-only %*
pause