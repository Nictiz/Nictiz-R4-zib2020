#!/bin/bash

overall_result=0

for file in $@; do
    if [[ $file =~ \.xml$ ]]; then
        basename=$(basename $file .xml)
        grep -Pq "<id\s+value=['\"]$basename['\"]\s*/>" $file
        if [[ $? != 0 ]]; then
            overall_result=1
            echo "The .id for $file doesn't match the filename"
        fi
    fi
done

exit $overall_result
