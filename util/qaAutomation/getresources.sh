#!/bin/bash

# If changed_only is set to not null, then we only check the changed files, otherwise the full set.
if [[ $changed_only == 0 ]]; then
  zib_resources=$(find resources/zib -maxdepth 1 -name "*.xml")
  nlcore_resources=$(find resources/nl-core -maxdepth 1 -name "*.xml")
  terminology=$(find . -regex "\./resources/.*/terminology/[^/]*\.xml")
  searchparameters=$(find SearchParameters -name "SearchParameter-*.xml")
  examples=$(
    for file in examples/*;do
      if [[ -f $file ]];then # Use an explicit check otherwise the process will return with exit code 1
        echo $file;
      fi
    done
  )
else
  zib_resources=$(git diff --name-only --diff-filter=ACM origin/main -- resources/zib/*.xml)
  zib_resources="$zib_resources "$(git ls-files --others -- resources/zib/*.xml)
  nlcore_resources=$(git diff --name-only --diff-filter=ACM origin/main -- resources/nl-core/*.xml)
  nlcore_resources="$nlcore_resources "$(git ls-files --others -- resources/nl-core/*.xml)
  terminology=$(git diff --name-only --diff-filter=ACM origin/main -- resources/zib/terminology/*.xml resources/nl-core/terminology/*.xml)
  terminology="$terminology "$(git ls-files --others -- resources/zib/terminology/*.xml resources/nl-core/terminology/*.xml)
  searchparameters=$(git diff --name-only --diff-filter=ACM origin/main -- SearchParameters)
  searchparameters="$searchparameters "$(git ls-files --others -- SearchParameters)
  examples=$(git diff --name-only --diff-filter=ACM origin/main -- examples)
  examples="$examples "$(git ls-files --others -- examples)
fi

# Separate zib from non-zib profiles
zib_profiles=""
zib_extensions=""
nlcore_profiles=""
nlcore_extensions=""
other_profiles=""
for file in $zib_resources; do
  if [[ -f $file ]]; then
    if [[ $(basename $file) =~ ^zib- ]]; then
      zib_profiles="$zib_profiles $file"
    elif [[ $(basename $file) =~ ^ext-.*\.[A-Z] ]]; then
      zib_extensions="$zib_extensions $file"
    else
      other_profiles="$other_profiles $file"
    fi
  fi
done
for file in $nlcore_resources; do
  if [[ -f $file ]]; then
    if [[ $(basename $file) =~ ^nl-core- ]]; then
      nlcore_profiles="$nlcore_profiles $file"
    elif [[ $(basename $file) =~ ^ext-.*\.[A-Z] ]]; then
      nlcore_extensions="$nlcore_extensions $file"
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
export zib_extensions
export nlcore_profiles
export nlcore_extensions
export other_profiles
export conceptmaps
export other_terminology
export searchparameters
export examples
