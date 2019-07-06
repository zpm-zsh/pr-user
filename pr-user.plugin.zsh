#!/usr/bin/env zsh
PR_PROMPT_PREFIX=${PR_PROMPT_PREFIX:-' '}
PR_PROMPT_SUFIX=${PR_PROMPT_SUFIX:-''}


_pr_user() {
  
  local RETVAL=$?
  
  local ISROOT=''
  local RETSYMBOL=''
  local USERSYMBOL=''
  
  if [[ "$EUID" == 0 ]]; then
    if [[ "$CLICOLOR" = 1 ]]; then
      ISROOT="%{$fg_bold[red]%}root%{$reset_color%} "
    else
      ISROOT="root "
    fi
  fi
  
  if [[ $CLICOLOR = 1 ]]; then
    
    if [ $RETVAL -eq 0 ]; then
      RETSYMBOL+="%{$fg_bold[yellow]%}"
    else
      RETSYMBOL+="%{$fg_bold[red]%}"
    fi
    
  else
    
    if [ "$RETVAL" == 0 ]; then
      RETSYMBOL+='+'
    else
      RETSYMBOL+="-"
    fi
    
  fi
  
  if [[ "$EUID" == 0 ]]; then
    USERSYMBOL+='#'
  else
    USERSYMBOL+='$'
  fi
  
  if [[ $CLICOLOR = 1 ]]; then
    USERSYMBOL+="%{$reset_color%}"
  fi
  
  pr_user="$PR_PROMPT_PREFIX$ISROOT$RETSYMBOL$USERSYMBOL$PR_PROMPT_SUFIX"
}

precmd_functions+=(_pr_user)
