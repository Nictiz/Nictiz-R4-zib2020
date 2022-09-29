#!/bin/bash

export ntsCredentialsFlag=
if [ -e qaAutomation/nts-credentials.env ]; then
  export ntsCredentialsFlag="--env-file qaAutomation/nts-credentials.env"
fi

docker-compose ${ntsCredentialsFlag} -f qa/docker-compose.yml up $*

