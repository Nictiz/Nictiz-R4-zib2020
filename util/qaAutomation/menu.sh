#!/bin/bash

showNTSCredentialsMenu() {
  dialog_result=$(
    dialog --clear --insecure --mixedform "Set NTS credentials" 0 0 0 \
      "User"     1 1 "$NTS_USER" 1 10 20 20 0 \
      "Password" 2 1 "$NTS_PASS" 2 10 20 20 1 \
      3>&1 1>&2 2>&3
  )
  if [[ $? == 0 ]]; then
    nts_credentials=($dialog_result)
    NTS_USER=${nts_credentials[0]}
    NTS_PASS=${nts_credentials[1]}
    export http_proxy="http://127.0.0.1:8080"
    http_body=$(python3 -c "import urllib.parse; print(urllib.parse.urlencode({'user': '${nts_credentials[0]}', 'pass': '${nts_credentials[1]}'}))")
    wget --quiet --post-data="$http_body" http://v4.combined.tx/resetNTSCredentials
  fi
  
  unset dialog_result
  unset nts_credentials
}

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
    dialog --clear --checklist "Choose one of the following steps" 0 0 10 \
      1 "Validate zib profiles" ${perform_step_dialog[zib profiles]} \
      2 "Validate zib extensions" ${perform_step_dialog[zib extensions]} \
      3 "Validate nl-core profiles" ${perform_step_dialog[nl-core profiles]} \
      4 "Validate nl-core extensions" ${perform_step_dialog[nl-core extensions]} \
      5 "Validate other profiles" ${perform_step_dialog[other profiles]} \
      6 "Validate ConceptMaps" ${perform_step_dialog[ConceptMaps]} \
      7 "Validate other terminology" ${perform_step_dialog[other terminology]} \
      8 "Validate SearchParameters" ${perform_step_dialog[SearchParameters]} \
      9 "Validate examples" ${perform_step_dialog[examples]} \
      10 "Check zib compliance" ${perform_step_dialog[zib compliance]} \
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
      8) perform_step[SearchParameters]=1;;
      9) perform_step[examples]=1;;
      10) perform_step[zib compliance]=1;;
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

  text=""
  if [[ $perform_all_steps == 1 ]]; then
    text="All checks will be performed"
  else
    text="The following steps:\n"
    for step_name in "${!perform_step[@]}"; do
      if [[ ${perform_step[$step_name]} == 1 ]]; then
        if [[ $step_name == "zib compliance" ]]; then
          text="$text* $step_name\n"
        else
          text="$text* validate $step_name\n"
        fi
      fi
    done
    text="$text""will be performed"
  fi
  if [[ $changed_only == 1 ]]; then
    text="$text on \Zuchanged\ZU materials.\n\n"
  else
    text="$text on \Zuall\ZU materials.\n\n"
  fi
  if [[ $disable_tx == 1 ]]; then
    text="$text""No terminology server will be used"
  else
    if [[ -n "$NTS_USER" && -n "$NTS_PASS" ]]; then
      text="$text""The Nationale Terminologieserver will be used with backup from the default FHIR terminlogy server."
    else
      text="$text""The default FHIR terminlogy server will be used (set the NTS_USER and NTS_PASS variables or use the menu to enter credentials if you want to use the Nationale Terminologieserver)."
    fi
    text="$text You can inspect the terminology server traffic by pointing your browser to http://127.0.0.1:8081"
  fi
  
  dialog_result=$(
    dialog --colors --clear \
      --title "Zib2020/R4 QA tooling" \
      --menu "$text" 0 0 7 \
      1 "Run QA tooling" \
      2 "Select the checks to perform" \
      3 "$changed_only_display" \
      4 "$disable_tx_display" \
      5 "Set NTS credentials" \
      6 "$debug_display" \
      x "Exit" \
      3>&1 1>&2 2>&3
  )

  exit_code=$?
  if [[ $exit_code == 1 ]]; then
    dialog_result="x"
  elif [[ $exit_code == 255 ]]; then # Special case where a subwindow can't be created
    showMenu
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
  "5")
    showNTSCredentialsMenu
    showMenu
    ;;
  "6")
    if [[ $output_redirect == "" ]]; then
      output_redirect="> /dev/null 2> /dev/null"
    else
      output_redirect=""
    fi
    showMenu
    ;;
  "x")
    return 1
    ;;
  esac
}

showMenu