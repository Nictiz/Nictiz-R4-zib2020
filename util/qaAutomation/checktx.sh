#!/bin/bash
# Script to see if the terminology server is reachable

wget -O /dev/null --quiet tx.fhir.org
if [ $? -ne 0 ]; then
    disable_tx=1
fi

export tx_opt