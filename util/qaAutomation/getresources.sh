#!/bin/bash

# If changed_only is set to not null, then we only check the changed files, otherwise the full set.
if [[ $changed_only == 0 ]]; then
  profiles=$(find resources/zib resources/nl-core -maxdepth 1 -name "*.xml")
  terminology=$(find resources/zib/terminology resources/nl-core/terminology -maxdepth 1 -name "*.xml")
  examples=$(
    for file in examples/*;do
      if [[ -f $file ]];then # Use an explicit check otherwise the process will return with exit code 1
        echo $file;
      fi
    done
  )
else
  profiles=$(git diff --name-only origin/main -- resources/zib/* resources/nl-core/*)
  terminology=$(git diff --name-only origin/main -- resources/zib/terminology/conceptmap-* resources/nl-core/terminology/*)
  examples=$(git diff --name-only origin/main -- examples)
fi

# Separate zib from non-zib profiles
zib_profiles=""
nlcore_profiles=""
other_profiles=""
for file in $profiles; do
  if [[ -f $file ]]; then
    if [[ $(basename $file) =~ ^(zib-|ext-.*\.[A-Z]) ]]; then
      zib_profiles="$zib_profiles $file"
    elif [[ $(basename $file) =~ ^nl-core- ]]; then
      nlcore_profiles="$nlcore_profiles $file"
    else
      other_profiles="$other_profiles $file"
    fi
  fi
done

# Separate conceptmaps from other terminology
conceptmaps=""
other_terminology=""
for file in $terminology; do
  if [[ -f $file ]]; then
    if [[ $(basename $file) =~ ^conceptmap- ]]; then
      conceptmaps="$conceptmaps $file"
    else
      other_terminology="$other_terminology $file"
    fi
  fi
done 

# Export so we can use these variables in child processes as well
export zib_profiles
export nlcore_profiles
export other_profiles
export conceptmaps
export other_terminology
export examples
