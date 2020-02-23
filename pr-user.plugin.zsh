#!/usr/bin/env zsh

typeset -g PR_PROMPT_PREFIX
PR_PROMPT_PREFIX=${PR_PROMPT_PREFIX:-' '}
typeset -g PR_PROMPT_SUFIX
PR_PROMPT_SUFIX=${PR_PROMPT_SUFIX:-''}

typeset -g USERSYMBOL
typeset -g pr_user
if [[ "$EUID" == 0 ]]; then
  USERSYMBOL="%{$c[red]$c_bold%}#%{$c_reset%}"
else
  USERSYMBOL="%{$c[yellow]$c_bold%}$%{$c_reset%}"
fi

pr_user="${PR_PROMPT_PREFIX}${USERSYMBOL}${PR_PROMPT_SUFIX}"
