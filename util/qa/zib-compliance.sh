#!/bin/bash

# Install our tools, if needed
which node > /dev/null
has_node=$?
which npm > /dev/null
has_npm=$?
if [[ $has_node != 0 || $has_npm != 0 ]]; then
  if [[ $write_github == 1 ]]; then
    echo "::group::Installing NodeJS and NPM"
  else
    echo -e "\033[1;37mInstalling NodeJS and NPM.\033[0m"
  fi
    
  apt-get update
  apt-get -y upgrade
  apt-get -y install nodejs npm

  if [[ $write_github == 1 ]]; then
    echo "::endgroup::"
  fi
fi

if [[ ! -f $tools_dir/zib-compliance-fhir/index.js ]]; then
  if [[ $write_github == 1 ]]; then
    echo "::group::Downloading zib compliance tool"
  else
    echo -e "\033[1;37mDownloading zib compliance tool\033[0m"
  fi

  git clone -b action --depth 1 https://github.com/pieter-edelman-nictiz/zib-compliance-fhir.git $tools_dir/zib-compliance-fhir
  cd $tools_dir/zib-compliance-fhir
  npm install

  if [[ $write_github == 1 ]]; then
    echo "::endgroup::"
  fi
fi

exit_code=0

echo "Generating snapshots"
source $script_dir/generatezibsnapshots.sh $@

if [ $? == 0 ]; then
    if [[ $changed_only == 0 ]]; then
      check_missing="mapped-only"
    else
      check_missing="none"
    fi
    node $tools_dir/zib-compliance-fhir/index.js -m qa/zibs2020.max -z 2020 -l 2 --check-missing=$check_missing -f text --fail-at warning --zib-overrides known-issues.yml $snapshots/*json
else
    echo -e "\033[0;33mThere was an error during snapshot generation. Re-run with the --debug option to see the output.\033[0m"
    echo "Skipping zib compliance check."
fi
if [ $? -ne 0 ]; then
    exit_code=1
fi

exit $exit_code