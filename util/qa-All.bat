@echo off
docker-compose -f qaAutomation/docker-compose.yml run --rm validate
pause