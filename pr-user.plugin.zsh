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
      ISROOT="%{$c[red]$c_bold%}root%{$c_reset%} "
    else
      ISROOT="root "
    fi
  fi
  
  if [[ $CLICOLOR = 1 ]]; then
    
    if [[ $RETVAL == 0 ]]; then
      RETSYMBOL+="%{$c[yellow]$c_bold%}"
    else
      RETSYMBOL+="%{$c[red]$c_bold%}"
    fi
    
  else
    
    if [[ "$RETVAL" == 0 ]]; then
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
    USERSYMBOL+="%{$c_reset%}"
  fi
  
  pr_user="$PR_PROMPT_PREFIX$ISROOT$RETSYMBOL$USERSYMBOL$PR_PROMPT_SUFIX"
}

precmd_functions+=(_pr_user)
