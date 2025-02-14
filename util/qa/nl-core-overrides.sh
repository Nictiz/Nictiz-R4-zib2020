#!/bin/bash

# We need this shell wrapper in order to call generatesnapshots.sh
echo "Generating snapshots"
source $script_dir/generatesnapshots.sh $@

python3 $script_dir/nl-core-overrides.py $snapshots/*json