@echo off
docker-compose -f docker/docker-compose.yml run --rm validate
pause