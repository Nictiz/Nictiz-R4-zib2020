#!/bin/bash

export ntsCredentialsFlag=
if [ -e qaAutomation/nts-credentials.env ]; then
  export ntsCredentialsFlag=--env-file qaAutomation/nts-credentials.env
fi

docker-compose ${ntsCredentialsFlag} -f qaAutomation/docker-compose.yml run --rm -p 8081:8081 qa-zib2020-r4 --menu --changed-only $*

