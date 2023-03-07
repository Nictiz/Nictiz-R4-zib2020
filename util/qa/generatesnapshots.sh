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

    dotnet tool install -g --version 2.5.0-beta-7 firely.terminal

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

# The approach to generate snapshotted JSON files for the profiles we need is ... wel, somewhat embarrasing. As it 
# turns out, it is _much_ more efficient to generate snapshots for all files we have, than to convert all
# those files to JSON, and then simply pick out the files that we need, than to convert just the files we need one
# by one.

# For the snapshot generation to succeed, we need a flat list of profiles together with the package manifest.
flattened=$(mktemp -d)
cd $flattened

cp $work_dir/resources/zib/package.json .
cp $work_dir/resources/zib/fhirpkg.lock.json .
cp $work_dir/resources/zib/*.xml .
cp $work_dir/resources/nl-core/*.xml .

# Make sure dependencies are in place
echo "> initializing Firely Terminal"
~/.dotnet/tools/fhir restore > $out_str 2> $out_str

# Give them all a snapshot
echo "> creating snapshots"
~/.dotnet/tools/fhir bake --snapshots > $out_str 2> $out_str

echo "> converting to JSON"
~/.dotnet/tools/fhir push "*.xml" > $out_str 2> $out_str
tmp_dir=$(mktemp -d)
cd $tmp_dir
~/.dotnet/tools/fhir save "{id}.json" --all --json > $out_str 2> $out_str

echo "> cleaning up"
export snapshots=$(mktemp -d)
for sd in $@; do
  base=$(basename $sd .xml);
  mv $base.json $snapshots
done
rm -rf $tmp_dir

cd $work_dir

if [[ $write_github == 1 ]]; then
    echo "::endgroup::"
fi