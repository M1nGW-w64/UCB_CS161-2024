 builtin printf "\e]4545;A\a\e[?1049h"
 if [ "$_termius_integration_installed" = "" ]; then  _termius_integration_installed="yes";  _termius_encode() {  builtin echo -n "$1" | command base64;  };  _termius_get_trap() {  builtin local -a terms;  builtin eval "terms=( $(trap -p "${1:-DEBUG}") )";  builtin printf '%s' "${terms[2]:-}";  };  if [[ "$HISTCONTROL" =~ .*(erasedups|ignoreboth|ignoredups).* ]]; then  _termius_history_verify=0;  else  _termius_history_verify=1;  fi;  _termius_original_PS1="$PS1";  _termius_custom_PS1="";  _termius_in_command_execution="1";  _termius_current_command="";  _termius_update_prompt() {  if [ "$_termius_in_command_execution" = "1" ]; then  if [[ "$_termius_custom_PS1" == "" || "$_termius_custom_PS1" != "$PS1" ]]; then  _termius_original_PS1=$PS1;  _termius_custom_PS1="\[\e]4545;PromptStart\a\]$_termius_original_PS1\[\e]4545;PromptEnd\a\]";  PS1="$_termius_custom_PS1";  fi;  _termius_in_command_execution="0";  fi;  };  _termius_precmd() {  if [ "$_termius_current_command" = "" ]; then  builtin printf "\e]4545;CommandComplete\a";  else  builtin printf "\e]4545;CommandComplete;%s\a" "$_termius_status";  fi;  builtin printf "\e]4545;P;Cwd=%s\a" "$(_termius_encode "$PWD")" ;  _termius_current_command="";  _termius_update_prompt;  };  _termius_preexec() {  if [[ ! "$BASH_COMMAND" =~ ^_termius_prompt* ]]; then  if [ "$_termius_history_verify" = "1" ]; then  _termius_current_command="$(builtin history 1 | sed 's/ *[0-9]* *//')";  else  _termius_current_command=$BASH_COMMAND;  fi;  else  _termius_current_command="";  fi;  builtin printf "\e]4545;CommandOutputStart;%s\a" "$(_termius_encode "${_termius_current_command}")";  };  if [[ -n "${bash_preexec_imported:-}" ]]; then  _termius_preexec_only() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  _termius_preexec;  fi;  };  precmd_functions+=(_termius_prompt_cmd);  preexec_functions+=(_termius_preexec_only);  else  _termius_dbg_trap="$(_termius_get_trap DEBUG)";  if [[ -z "$_termius_dbg_trap" ]]; then  _termius_preexec_only() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  _termius_preexec;  fi;  };  trap '_termius_preexec_only "$_"' DEBUG;  elif [[ "$_termius_dbg_trap" != '_termius_preexec "$_"' && "$_termius_dbg_trap" != '_termius_preexec_all "$_"' ]]; then  _termius_preexec_all() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  builtin eval "${_termius_dbg_trap}";  _termius_preexec;  fi;  };  trap '_termius_preexec_all "$_"' DEBUG;  fi;  fi;  _termius_update_prompt;  _termius_restore_exit_code() {  return "$1";  };  _termius_prompt_cmd_original() {  _termius_status="$?";  _termius_restore_exit_code "${_termius_status}";  for cmd in "${_termius_original_prompt_command[@]}"; do  eval "${cmd:-}";  done;  _termius_precmd;  };  _termius_prompt_cmd() {  _termius_status="$?";  _termius_precmd;  };  _termius_original_prompt_command=$PROMPT_COMMAND;  if [[ -z "${bash_preexec_imported:-}" ]]; then  if [[ -n "$_termius_original_prompt_command" && "$_termius_original_prompt_command" != "_termius_prompt_cmd" ]]; then  PROMPT_COMMAND=_termius_prompt_cmd_original;  else  PROMPT_COMMAND=_termius_prompt_cmd;  fi;  fi;  fi
 builtin printf "\e[?1049l\e]4545;B\a"
ls -al
cat -n dehexify.c
cat interact
./exploit
clear
vim interact
./exploit
 builtin printf "\e]4545;A\a\e[?1049h"
 if [ "$_termius_integration_installed" = "" ]; then  _termius_integration_installed="yes";  _termius_encode() {  builtin echo -n "$1" | command base64;  };  _termius_get_trap() {  builtin local -a terms;  builtin eval "terms=( $(trap -p "${1:-DEBUG}") )";  builtin printf '%s' "${terms[2]:-}";  };  if [[ "$HISTCONTROL" =~ .*(erasedups|ignoreboth|ignoredups).* ]]; then  _termius_history_verify=0;  else  _termius_history_verify=1;  fi;  _termius_original_PS1="$PS1";  _termius_custom_PS1="";  _termius_in_command_execution="1";  _termius_current_command="";  _termius_update_prompt() {  if [ "$_termius_in_command_execution" = "1" ]; then  if [[ "$_termius_custom_PS1" == "" || "$_termius_custom_PS1" != "$PS1" ]]; then  _termius_original_PS1=$PS1;  _termius_custom_PS1="\[\e]4545;PromptStart\a\]$_termius_original_PS1\[\e]4545;PromptEnd\a\]";  PS1="$_termius_custom_PS1";  fi;  _termius_in_command_execution="0";  fi;  };  _termius_precmd() {  if [ "$_termius_current_command" = "" ]; then  builtin printf "\e]4545;CommandComplete\a";  else  builtin printf "\e]4545;CommandComplete;%s\a" "$_termius_status";  fi;  builtin printf "\e]4545;P;Cwd=%s\a" "$(_termius_encode "$PWD")" ;  _termius_current_command="";  _termius_update_prompt;  };  _termius_preexec() {  if [[ ! "$BASH_COMMAND" =~ ^_termius_prompt* ]]; then  if [ "$_termius_history_verify" = "1" ]; then  _termius_current_command="$(builtin history 1 | sed 's/ *[0-9]* *//')";  else  _termius_current_command=$BASH_COMMAND;  fi;  else  _termius_current_command="";  fi;  builtin printf "\e]4545;CommandOutputStart;%s\a" "$(_termius_encode "${_termius_current_command}")";  };  if [[ -n "${bash_preexec_imported:-}" ]]; then  _termius_preexec_only() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  _termius_preexec;  fi;  };  precmd_functions+=(_termius_prompt_cmd);  preexec_functions+=(_termius_preexec_only);  else  _termius_dbg_trap="$(_termius_get_trap DEBUG)";  if [[ -z "$_termius_dbg_trap" ]]; then  _termius_preexec_only() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  _termius_preexec;  fi;  };  trap '_termius_preexec_only "$_"' DEBUG;  elif [[ "$_termius_dbg_trap" != '_termius_preexec "$_"' && "$_termius_dbg_trap" != '_termius_preexec_all "$_"' ]]; then  _termius_preexec_all() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  builtin eval "${_termius_dbg_trap}";  _termius_preexec;  fi;  };  trap '_termius_preexec_all "$_"' DEBUG;  fi;  fi;  _termius_update_prompt;  _termius_restore_exit_code() {  return "$1";  };  _termius_prompt_cmd_original() {  _termius_status="$?";  _termius_restore_exit_code "${_termius_status}";  for cmd in "${_termius_original_prompt_command[@]}"; do  eval "${cmd:-}";  done;  _termius_precmd;  };  _termius_prompt_cmd() {  _termius_status="$?";  _termius_precmd;  };  _termius_original_prompt_command=$PROMPT_COMMAND;  if [[ -z "${bash_preexec_imported:-}" ]]; then  if [[ -n "$_termius_original_prompt_command" && "$_termius_original_prompt_command" != "_termius_prompt_cmd" ]]; then  PROMPT_COMMAND=_termius_prompt_cmd_original;  else  PROMPT_COMMAND=_termius_prompt_cmd;  fi;  fi;  fi
 builtin printf "\e[?1049l\e]4545;B\a"
cat -n dehexify.c
cat debug-exploit
lear
clear
ls -al
./dehexify 
clear
ls -al
cat -n scaffold.py
clear
ls -al
cat -n interact
cat -n dehexify.c
clear
vim interact
clear
./exploit
clear
ls -al
cat debug-exploit
cat -n interact
vim interact
cat -n scaffold.py
clear
 builtin printf "\e]4545;A\a\e[?1049h"
 if [ "$_termius_integration_installed" = "" ]; then  _termius_integration_installed="yes";  _termius_encode() {  builtin echo -n "$1" | command base64;  };  _termius_get_trap() {  builtin local -a terms;  builtin eval "terms=( $(trap -p "${1:-DEBUG}") )";  builtin printf '%s' "${terms[2]:-}";  };  if [[ "$HISTCONTROL" =~ .*(erasedups|ignoreboth|ignoredups).* ]]; then  _termius_history_verify=0;  else  _termius_history_verify=1;  fi;  _termius_original_PS1="$PS1";  _termius_custom_PS1="";  _termius_in_command_execution="1";  _termius_current_command="";  _termius_update_prompt() {  if [ "$_termius_in_command_execution" = "1" ]; then  if [[ "$_termius_custom_PS1" == "" || "$_termius_custom_PS1" != "$PS1" ]]; then  _termius_original_PS1=$PS1;  _termius_custom_PS1="\[\e]4545;PromptStart\a\]$_termius_original_PS1\[\e]4545;PromptEnd\a\]";  PS1="$_termius_custom_PS1";  fi;  _termius_in_command_execution="0";  fi;  };  _termius_precmd() {  if [ "$_termius_current_command" = "" ]; then  builtin printf "\e]4545;CommandComplete\a";  else  builtin printf "\e]4545;CommandComplete;%s\a" "$_termius_status";  fi;  builtin printf "\e]4545;P;Cwd=%s\a" "$(_termius_encode "$PWD")" ;  _termius_current_command="";  _termius_update_prompt;  };  _termius_preexec() {  if [[ ! "$BASH_COMMAND" =~ ^_termius_prompt* ]]; then  if [ "$_termius_history_verify" = "1" ]; then  _termius_current_command="$(builtin history 1 | sed 's/ *[0-9]* *//')";  else  _termius_current_command=$BASH_COMMAND;  fi;  else  _termius_current_command="";  fi;  builtin printf "\e]4545;CommandOutputStart;%s\a" "$(_termius_encode "${_termius_current_command}")";  };  if [[ -n "${bash_preexec_imported:-}" ]]; then  _termius_preexec_only() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  _termius_preexec;  fi;  };  precmd_functions+=(_termius_prompt_cmd);  preexec_functions+=(_termius_preexec_only);  else  _termius_dbg_trap="$(_termius_get_trap DEBUG)";  if [[ -z "$_termius_dbg_trap" ]]; then  _termius_preexec_only() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  _termius_preexec;  fi;  };  trap '_termius_preexec_only "$_"' DEBUG;  elif [[ "$_termius_dbg_trap" != '_termius_preexec "$_"' && "$_termius_dbg_trap" != '_termius_preexec_all "$_"' ]]; then  _termius_preexec_all() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  builtin eval "${_termius_dbg_trap}";  _termius_preexec;  fi;  };  trap '_termius_preexec_all "$_"' DEBUG;  fi;  fi;  _termius_update_prompt;  _termius_restore_exit_code() {  return "$1";  };  _termius_prompt_cmd_original() {  _termius_status="$?";  _termius_restore_exit_code "${_termius_status}";  for cmd in "${_termius_original_prompt_command[@]}"; do  eval "${cmd:-}";  done;  _termius_precmd;  };  _termius_prompt_cmd() {  _termius_status="$?";  _termius_precmd;  };  _termius_original_prompt_command=$PROMPT_COMMAND;  if [[ -z "${bash_preexec_imported:-}" ]]; then  if [[ -n "$_termius_original_prompt_command" && "$_termius_original_prompt_command" != "_termius_prompt_cmd" ]]; then  PROMPT_COMMAND=_termius_prompt_cmd_original;  else  PROMPT_COMMAND=_termius_prompt_cmd;  fi;  fi;  fi
 builtin printf "\e[?1049l\e]4545;B\a"
./debug-exploit
clear
./debug-exploit
clear
./debug-exploit
clear
 builtin printf "\e]4545;A\a\e[?1049h"
 if [ "$_termius_integration_installed" = "" ]; then  _termius_integration_installed="yes";  _termius_encode() {  builtin echo -n "$1" | command base64;  };  _termius_get_trap() {  builtin local -a terms;  builtin eval "terms=( $(trap -p "${1:-DEBUG}") )";  builtin printf '%s' "${terms[2]:-}";  };  if [[ "$HISTCONTROL" =~ .*(erasedups|ignoreboth|ignoredups).* ]]; then  _termius_history_verify=0;  else  _termius_history_verify=1;  fi;  _termius_original_PS1="$PS1";  _termius_custom_PS1="";  _termius_in_command_execution="1";  _termius_current_command="";  _termius_update_prompt() {  if [ "$_termius_in_command_execution" = "1" ]; then  if [[ "$_termius_custom_PS1" == "" || "$_termius_custom_PS1" != "$PS1" ]]; then  _termius_original_PS1=$PS1;  _termius_custom_PS1="\[\e]4545;PromptStart\a\]$_termius_original_PS1\[\e]4545;PromptEnd\a\]";  PS1="$_termius_custom_PS1";  fi;  _termius_in_command_execution="0";  fi;  };  _termius_precmd() {  if [ "$_termius_current_command" = "" ]; then  builtin printf "\e]4545;CommandComplete\a";  else  builtin printf "\e]4545;CommandComplete;%s\a" "$_termius_status";  fi;  builtin printf "\e]4545;P;Cwd=%s\a" "$(_termius_encode "$PWD")" ;  _termius_current_command="";  _termius_update_prompt;  };  _termius_preexec() {  if [[ ! "$BASH_COMMAND" =~ ^_termius_prompt* ]]; then  if [ "$_termius_history_verify" = "1" ]; then  _termius_current_command="$(builtin history 1 | sed 's/ *[0-9]* *//')";  else  _termius_current_command=$BASH_COMMAND;  fi;  else  _termius_current_command="";  fi;  builtin printf "\e]4545;CommandOutputStart;%s\a" "$(_termius_encode "${_termius_current_command}")";  };  if [[ -n "${bash_preexec_imported:-}" ]]; then  _termius_preexec_only() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  _termius_preexec;  fi;  };  precmd_functions+=(_termius_prompt_cmd);  preexec_functions+=(_termius_preexec_only);  else  _termius_dbg_trap="$(_termius_get_trap DEBUG)";  if [[ -z "$_termius_dbg_trap" ]]; then  _termius_preexec_only() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  _termius_preexec;  fi;  };  trap '_termius_preexec_only "$_"' DEBUG;  elif [[ "$_termius_dbg_trap" != '_termius_preexec "$_"' && "$_termius_dbg_trap" != '_termius_preexec_all "$_"' ]]; then  _termius_preexec_all() {  if [ "$_termius_in_command_execution" = "0" ]; then  _termius_in_command_execution="1";  builtin eval "${_termius_dbg_trap}";  _termius_preexec;  fi;  };  trap '_termius_preexec_all "$_"' DEBUG;  fi;  fi;  _termius_update_prompt;  _termius_restore_exit_code() {  return "$1";  };  _termius_prompt_cmd_original() {  _termius_status="$?";  _termius_restore_exit_code "${_termius_status}";  for cmd in "${_termius_original_prompt_command[@]}"; do  eval "${cmd:-}";  done;  _termius_precmd;  };  _termius_prompt_cmd() {  _termius_status="$?";  _termius_precmd;  };  _termius_original_prompt_command=$PROMPT_COMMAND;  if [[ -z "${bash_preexec_imported:-}" ]]; then  if [[ -n "$_termius_original_prompt_command" && "$_termius_original_prompt_command" != "_termius_prompt_cmd" ]]; then  PROMPT_COMMAND=_termius_prompt_cmd_original;  else  PROMPT_COMMAND=_termius_prompt_cmd;  fi;  fi;  fi
 builtin printf "\e[?1049l\e]4545;B\a"
ls -al
cat -n interact
cat -n scaffold.py
clear
ls -al
cat -n interact
cat exploit
clear
ls -al
cat dehexify.c
./dehexify
clear
ls -al
cat debug-exploit
clear
ls -al
cat interace
cat interact
clear
./debug-exploit
clear
./debug-exploit
clear
./debug-exploit
clear
./debug-exploit
clear
./debug-exploit
clear
./debug-exploit
clear
./debug-exploit
clear
./debug-exploit
clear
ls -al
./debug-exploit
clear
ls -al
cat -n dehexify.c
cat -n interact
vim interact
vim interact
clear
vim interact
clear
./debug-exploit
clear
./debug-exploit
clear]
clear
vim interact
clear
./exploit
clear
vim interact
clear
vim interact
clear
./exploit
clear
vim interact
clear
./debug-exploit
clear
./debug-exploit
quit
