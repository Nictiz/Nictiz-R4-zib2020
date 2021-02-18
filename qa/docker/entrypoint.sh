#!/bin/bash

work_dir=/workdir
src_dir=/repo
tools_dir=/tools
output_dir=/output

exit_code=0

# The repo is mounted read-only, we make a local copy to src_dir where we can modify things if needed.
rm -rf $work_dir # The assumption is that we use run in a temp container, but for good measure, lets erase the target location first.
rm $output_dir/* 2> /dev/null
cp -r $src_dir $work_dir
cd $work_dir

changed_only=0
output_redirect="> /dev/null 2> /dev/null"
while [ "$1" != "" ]; do
    case $1 in
        --changed-only) shift
                        changed_only=1
                        ;;
        --debug)        shift
                        output_redirect=""
                        ;;
        *)              echo "Usage: $0 [--changed-only] [--debug]"
                        exit 1
                        ;;
    esac
    shift
done

# If the "--changed-only" parameter is given, then we only check the changed files, otherwise the full set.
if [ $changed_only == 0 ]; then
  profiles=resources/zib-*
  examples=examples/*
else
  profiles=$(git diff --name-only origin/main -- resources/zib-* resources/ext-*)
  examples=$(git diff --name-only origin/main -- examples)
fi

echo
echo "+++ Validating profiles"
mkdir ig
cd ig
ln -s ../resources
ln -s ../qa/ProfilingGuidelinesR4.xml
ls
cd ..
eval java -jar $tools_dir/validator/validator.jar -version 4.0 -ig ig/ -recurse -profile https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4 $profiles -output $output_dir/profile_validation.xml $output_redirect
if [ $? -eq 0 ]; then
  python3 $tools_dir/hl7-fhir-validator-action/analyze_results.py --fail-at warning --ignored-issues known-issues.yml $output_dir/profile_validation.xml
else
  echo "There was an error running the validator. Re-run with the --debug option to see the output."
fi
if [ $? -ne 0 ]; then
  exit_code=1
fi

echo
echo "+++ Validating examples"
eval java -jar $tools_dir/validator/validator.jar -version 4.0 -ig resources/ -recurse $examples -output $output_dir/example_validation.xml $output_redirect
if [ $? -eq 0 ]; then
  python3 $tools_dir/hl7-fhir-validator-action/analyze_results.py --fail-at warning --ignored-issues known-issues.yml $output_dir/example_validation.xml
else
  echo "There was an error running the validator. Re-run with the --debug option to see the output."
fi
if [ $? -ne 0 ]; then
  exit_code=1
fi

echo
echo "+++ Checking zib compliance"
echo "Generating snapshots"
# For the snapshot generation to succeed, we need a flat list of profiles together with the package manifest.
mkdir flattened
cd flattened
ln -s ../package.json
ln -s ../fhirpkg.lock.json
for f in $(find ../resources -name "*.xml"); do ln -s $f; done

mkdir ../snapshots
for sd in ../$profiles; do
  base=$(basename $sd .xml);
  eval ~/.dotnet/tools/fhir push $base.xml $output_redirect
  eval ~/.dotnet/tools/fhir snapshot $output_redirect
  eval ~/.dotnet/tools/fhir save ../snapshots/$base.json --json $output_redirect
done
cd ..

if [ $? -eq 0 ]; then
  node $tools_dir/zib-compliance-fhir/index.js -m qa/zibs2020.max -z 2020 -r -l 2 -f text --fail-at warning --zib-overrides known-issues.yml snapshots/*json
else
  echo "There was an error during snapshot generation. Re-run with the --debug option to see the output."
  echo "Skipping zib compliance check."
fi
if [ $? -ne 0 ]; then
  exit_code=1
fi

exit $exit_code