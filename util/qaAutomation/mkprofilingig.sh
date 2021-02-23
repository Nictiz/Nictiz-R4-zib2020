#/bin/bash

# Create an "ig" with both the resources and the ProfilingGuidelines profiles
mkdir ig
cd ig
ln -s ../resources
ln -s ../qa/*.xml .
cd ..