#!/bin/bash

# Install the tools that we need
which dotnet > /dev/null
has_dotnet=$?
if [[ ! $has_dotnet == 0 || ! -f ~/.dotnet/tools/fhir ]]; then
    if [[ $write_github == 1 ]]; then
        echo "::group::Installing firely terminal"
    else
        echo -e "\033[1;37mInstalling Firely terminal.\033[0m"
    fi

    cd ~
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb
    apt-get update && apt-get -y install apt-transport-https && apt-get -y install dotnet-sdk-3.1 

    dotnet tool install -g --version 2.0.0 firely.terminal

    if [[ $write_github == 1 ]]; then
        echo "::endgroup::"
    fi
fi

if [[ $debug == 1 || $write_github == 1 ]]; then
    export out_str="/dev/stdout"
else
    export out_str="/dev/null"
fi

if [[ $write_github == 1 ]]; then
    echo "::group::Generate snapshots"
fi

# For the snapshot generation to succeed, we need a flat list of profiles together with the package manifest.
flattened=$(mktemp -d)
cd $flattened
ln -s $work_dir/resources/zib/package.json
ln -s $work_dir/resources/zib/fhirpkg.lock.json
for f in $(find $work_dir/resources -name "*.xml"); do ln -s $f; done

# Make sure dependencies are in place
~/.dotnet/tools/fhir restore > $out_str 2> $out_str

export snapshots=$(mktemp -d)
for sd in $@; do
  base=$(basename $sd .xml);
  echo "Converting $sd" > $out_str 2> $out_str
  ~/.dotnet/tools/fhir push $base.xml > $out_str 2> $out_str
  ~/.dotnet/tools/fhir snapshot > $out_str 2> $out_str
  ~/.dotnet/tools/fhir save $snapshots/$base.json --json > $out_str 2> $out_str
done
cd $work_dir

if [[ $write_github == 1 ]]; then
    echo "::endgroup::"
fi