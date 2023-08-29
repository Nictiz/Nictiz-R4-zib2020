#!/bin/bash

export DOTNET_ROOT=~/.dotnet
export PATH=$PATH:$DOTNET_ROOT
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

# Install the tools that we need
which dotnet > /dev/null
has_dotnet=$?
if [[ ! $has_dotnet == 0 || ! -f ~/.dotnet/tools/fhir ]]; then
    if [[ $write_github == 1 ]]; then
        echo "::group::Installing firely terminal"
    else
        echo -e "\033[1;37mInstalling Firely terminal.\033[0m"
    fi

    # Unfortunately, Firely Terminal deprecated the method for bulk creating snapshots after version 2.5 (or at least
    # without a login), so we need this ancient version, which uses an ancient version of .Net SDK, for which we need
    # a script based installer.
    apk add libstdc++ libintl libssl1.1

    install_dir=$(mktemp -d)
    cd $install_dir
    wget https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh
    bash dotnet-install.sh -c 3.1
    cd $work_dir
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