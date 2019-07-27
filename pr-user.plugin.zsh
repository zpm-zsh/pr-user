#!/usr/bin/env zsh
: ${PR_PROMPT_PREFIX:=' '}
: ${PR_PROMPT_SUFIX:=''}

if [[ $CLICOLOR != 0 ]]; then
  
  if [[ "$EUID" == 0 ]]; then
    USERSYMBOL="%{$c[red]$c_bold%}#%{$c_reset%}"
  else
    USERSYMBOL="%{$c[yellow]$c_bold%}$%{$c_reset%}"
  fi
  
else
  
  if [[ "$EUID" == 0 ]]; then
    USERSYMBOL="#"
  else
    USERSYMBOL="$"
  fi
  
fi

pr_user="${PR_PROMPT_PREFIX}${USERSYMBOL}${PR_PROMPT_SUFIX}"
