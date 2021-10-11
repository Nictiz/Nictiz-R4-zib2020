#!/bin/bash

work_dir=/workdir
src_dir=/repo
tools_dir=/tools
output_dir=/output

exit_code=0

use_menu=0
changed_only=0
output_redirect="> /dev/null 2> /dev/null"
disable_tx=0
keep_mitm_running=0
tx_opt=""
declare -A perform_step
perform_step[zib profiles]=0
perform_step[zib extensions]=0
perform_step[nl-core profiles]=0
perform_step[nl-core extensions]=0
perform_step[other profiles]=0
perform_step[ConceptMaps]=0
perform_step[other terminology]=0
perform_step[examples]=0
perform_step[zib compliance]=0
perform_all_steps=1
while [ "$1" != "" ]; do
    case $1 in
        --menu)               use_menu=1
                              ;;
        --changed-only)       changed_only=1
                              ;;
        --debug)              output_redirect=""
                              ;;
        --no-tx)              disable_tx=1
                              ;;
        --inspect-tx)         keep_mitm_running=1
                              ;;
        --zib-profiles)       perform_step[zib profiles]=1
                              perform_all_steps=0
                              ;;
        --zib-extensions)     perform_step[zib extensions]=1
                              perform_all_steps=0
                              ;;
        --nl-core-profiles)   perform_step[nl-core profiles]=1
                              perform_all_steps=0
                              ;;
        --nl-core-extensions) perform_step[nl-core extensions]=1
                              perform_all_steps=0
                              ;;
        --other-profiles)     perform_step[other profiles]=1
                              perform_all_steps=0
                              ;;
        --conceptmaps)        perform_step[ConceptMaps]=1
                              perform_all_steps=0
                              ;;
        --other-terminology)  perform_step[other terminology]=1
                              perform_all_steps=0
                              ;;
        --examples)           perform_step[examples]=1
                              perform_all_steps=0
                              ;;
        --zib-compliance)     perform_step[zib compliance]=1
                              perform_all_steps=0
                              ;;
        *)                    echo "Usage: $0 [--changed-only] [--debug] [--no-tx] [--inspect-tx]"
                              echo "In addition, you can select to run only one or more individual checks using --zib-profiles, --zib-extensions, --nl-core-profiles, --nl-core-extensions, --other-profiles, --conceptmaps, --other-terminology, --examples or -zib-compliance"
                        exit 1
                        ;;
    esac
    shift
done

# Start the proxy server to intelligently handle terminology requests
set -m
mitmweb --web-host "0.0.0.0" -s /tools/CombinedTX/CombinedTX.py -q &
if [[ $use_menu == 0 ]]; then
  echo -e "\033[0;33mYou can spy on the terminology server log at http://localhost:8081\033[0m"
fi

resetFiles() {
  # The repo is mounted read-only, we make a local copy to src_dir where we can modify things if needed.
  rm -rf $work_dir # The assumption is that we use run in a temp container, but for good measure, lets erase the target location first.
  rm $output_dir/* 2> /dev/null
  cp -r $src_dir $work_dir
  cd $work_dir
}

setTXOption() {
  if [[ $disable_tx == 1 ]]; then
    tx_opt="-tx n/a"
  else
    tx_opt="-proxy 127.0.0.1:8080 -tx http://v4.combined.tx"
  fi
}

# Run the HL7 Validator and analyze the output. Parameters:
# $1: textual description of the resources being analyzed
# $2: list of files to analyze (remember to quote them in case the list is empty)
# $3: optional profile canonical to validate the resources against
validate() {
  if [[ $perform_all_steps == 0 && ${perform_step[$1]} == 0 ]]; then
    return
  fi
  
  echo
  if [[ $2 =~ ^[^\s]*$ ]]; then
    echo -e "\033[1;37m+++ No $1 to check\033[0m"
  else
    echo -e "\033[1;37m+++ Validating $1\033[0m"
    local output=$output_dir/validate-${1//[^[:alnum:]]/}.xml
    if [[ -n $3 ]]; then
      local profile_opt="-profile $3"
    fi
    eval java -jar $tools_dir/validator/validator.jar -version 4.0 -ig qa/ -ig resources/ -recurse $profile_opt $tx_opt $2 -output $output $output_redirect
    if [ $? -eq 0 ]; then
      python3 $tools_dir/hl7-fhir-validator-action/analyze_results.py --colorize --fail-at error --ignored-issues known-issues.yml $output
      if [[ $disable_tx == 1 ]]; then
        echo -e "\033[0;33m(No terminology server was used)\033[0m"
      fi
    else
      echo -e "\033[0;33mThere was an error running the validator. Re-run with the --debug option to see the output.\033[0m"
    fi
    if [ $? -ne 0 ]; then
      exit_code=1
    fi
  fi
}

zibCompliance() {
  # Run zib compliance tool
  if [[ $perform_all_steps == 1 || ${perform_step[zib compliance]} == 1 ]]; then
    echo
    echo -e "\033[1;37m+++ Checking zib compliance\033[0m"
    if [[ -z $zib_profiles ]]; then
      echo "No input, skipping"
    else
      echo "Generating snapshots"
      eval /scripts/generatezibsnapshots.sh $zib_profiles $zib_extensions $output_redirect

      if [ $? -eq 0 ]; then
        if [[ $changed_only == 0 ]]; then
          check_missing="mapped-only"
        else
          check_missing="none"
        fi
        node $tools_dir/zib-compliance-fhir/index.js -m qa/zibs2020.max -z 2020 -l 2 --check-missing=$check_missing -f text --fail-at warning --zib-overrides known-issues.yml snapshots/*json
      else
        echo -e "\033[0;33mThere was an error during snapshot generation. Re-run with the --debug option to see the output.\033[0m"
        echo "Skipping zib compliance check."
      fi
      if [ $? -ne 0 ]; then
        exit_code=1
      fi
    fi
  fi
}

performQA() {
  resetFiles
  setTXOption
  source /scripts/getresources.sh
  
  # Perform all HL7 Validator actions
  validate "zib profiles" "$zib_profiles" "http://nictiz.nl/fhir/StructureDefinition/ProfilingGuidelinesR4-StructureDefinitions-Zib-Profiles"
  validate "zib extensions" "$zib_extensions" "http://nictiz.nl/fhir/StructureDefinition/ProfilingGuidelinesR4-StructureDefinitions-Zib-Extensions"
  validate "nl-core profiles" "$nlcore_profiles" "http://nictiz.nl/fhir/StructureDefinition/ProfilingGuidelinesR4-StructureDefinitions-NlCore-Profiles"
  validate "nl-core extensions" "$nlcore_extensions" "http://nictiz.nl/fhir/StructureDefinition/ProfilingGuidelinesR4-StructureDefinitions-NlCore-Extensions"
  validate "other profiles" "$other_profiles" "http://nictiz.nl/fhir/StructureDefinition/ProfilingGuidelinesR4-StructureDefinitions"
  validate "ConceptMaps" "$conceptmaps" "http://nictiz.nl/fhir/StructureDefinition/ProfilingGuidelinesR4-ConceptMaps"
  validate "other terminology" "$other_terminology"
  validate "examples" "$examples"
  
  zibCompliance
}

declare -i runNumber=0
fullOutput=
main() {
  if [[ $use_menu == 1 ]]; then
    source /scripts/menu.sh
    if [[ $? == 1 ]]; then
      echo "Here's the full output of all the runs:"
      echo -e "$fullOutput"
      exit
    else
      runNumber=$(($runNumber + 1))
      qaOutFile=$(mktemp)
      performQA | tee $qaOutFile
      qaOutput=$(<$qaOutFile)
      fullOutput="$fullOutput\n\033[1;37mRun $runNumber:\n\n$qaOutput\033[0m"
      qaOutput=$(sed -r 's/(\o33\[1;3.?m)/\\Zb\1/g' <<< $qaOutput)
      qaOutput=$(sed -r 's/\o33\[(0|1);3(.)m/\\\Z\2/g' <<< $qaOutput)
      qaOutput=$(sed -r 's/\o33\[0m/\\Zn/g' <<< $qaOutput)
      dialog --clear --scrollbar --colors --cr-wrap --no-collapse --msgbox "$qaOutput" -1 -1
      main
    fi
  else
    performQA
    if [[ $keep_mitm_running == 1 ]]; then
      echo
      echo "Bringing proxxy server to foreground. Press Ctrl+C to finish."
      fg > /dev/null
    fi
  fi
}
main

exit $exit_code
