#!/bin/bash

# For the snapshot generation to succeed, we need a flat list of profiles together with the package manifest.
mkdir flattened
cd flattened
ln -s ../package.json
ln -s ../fhirpkg.lock.json
for f in $(find ../resources -name "*.xml"); do ln -s $f; done

# Make sure dependencies are in place
~/.dotnet/tools/fhir restore

mkdir ../snapshots
for sd in $@; do
  base=$(basename $sd .xml);
  ~/.dotnet/tools/fhir push $base.xml
  ~/.dotnet/tools/fhir snapshot
  ~/.dotnet/tools/fhir save ../snapshots/$base.json --json
done
cd ..