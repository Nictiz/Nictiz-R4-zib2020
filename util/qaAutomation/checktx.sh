#!/bin/bash
# Script to see if the terminology server is reachable

tx_opt=""

wget -O /dev/null --quiet tx.fhir.org
if [ $? -ne 0 ]; then
    tx_opt="-tx n/a"
fi

export tx_opt