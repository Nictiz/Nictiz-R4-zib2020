#!/bin/bash

showStepsMenu() {
  declare -A perform_step_dialog
  for key in "${!perform_step[@]}"; do 
    if [[ ${perform_step[$key]} == 1 || $perform_all_steps == 1 ]]; then
      perform_step_dialog[$key]="on"
    else
      perform_step_dialog[$key]="off"
    fi
  done

  dialog_result=$(
    dialog --clear --checklist "Choose one of the following steps" 0 0 9 \
      1 "Validate zib profiles" ${perform_step_dialog[zib profiles]} \
      2 "Validate zib extensions" ${perform_step_dialog[zib extensions]} \
      3 "Validate nl-core profiles" ${perform_step_dialog[nl-core profiles]} \
      4 "Validate nl-core extensions" ${perform_step_dialog[nl-core extensions]} \
      5 "Validate other profiles" ${perform_step_dialog[other profiles]} \
      6 "Validate ConceptMaps" ${perform_step_dialog[ConceptMaps]} \
      7 "Validate other terminology" ${perform_step_dialog[other terminology]} \
      8 "Validate examples" ${perform_step_dialog[examples]} \
      9 "Check zib compliance" ${perform_step_dialog[zib compliance]} \
      3>&1 1>&2 2>&3
  )
  perform_all_steps=0
  for step_name in "${!perform_step[@]}"; do
    perform_step[$step_name]=0
  done
  for step_num in $dialog_result; do
    case $step_num in 
      1) perform_step[zib profiles]=1;;
      2) perform_step[zib extensions]=1;;
      3) perform_step[nl-core profiles]=1;;
      4) perform_step[nl-core extensions]=1;;
      5) perform_step[other profiles]=1;;
      6) perform_step[ConceptMaps]=1;;
      7) perform_step[other terminology]=1;;
      8) perform_step[examples]=1;;
      9) perform_step[zib compliance]=1;;
    esac
  done
  
  unset perform_step_dialog
}

showMenu() {
  changed_only_display="Switch to checking changed resources only"
  if [[ $changed_only == 1 ]]; then
    changed_only_display="Switch to checking all resources"
  fi 
  disable_tx_display="Disable terminology checking"
  if [[ $disable_tx == 1 ]]; then
    disable_tx_display="Enable terminology checking"
  fi 
  debug_display="Enable debugging"
  if [[ $output_redirect == "" ]]; then
    debug_display="Disable debugging"
  fi

  dialog_result=$(
    dialog --clear --menu "Choose what to do" 0 0 6 \
      1 "Run QA tooling" \
      2 "Select the checks to perform" \
      3 "$changed_only_display" \
      4 "$disable_tx_display" \
      5 "$debug_display" \
      x "Exit" \
      3>&1 1>&2 2>&3
  )

  if [[ $? == 1 ]]; then
    dialog_result="x"
  fi

  # Clear screen without clearing the scroll buffer. Works pretty unreliably across the various platforms.  
  printf '\033[H'
  printf '\033[0J'
  
  case "$dialog_result" in
  "1")
    return 0
    ;;
  "2")
    showStepsMenu
    showMenu
    ;;
  "3")
    if [[ $changed_only == 1 ]]; then
      changed_only=0
    else
      changed_only=1
    fi
    showMenu
    ;;
  "4")
    if [[ $disable_tx == 1 ]]; then
      disable_tx=0
    else
      disable_tx=1
    fi
    showMenu
    ;;
  "x")
    return 1
    ;;
  esac
}

showMenu