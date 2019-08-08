#!/usr/bin/env zsh
: ${PR_PROMPT_PREFIX:=' '}
: ${PR_PROMPT_SUFIX:=''}

if [[ "$EUID" == 0 ]]; then
  USERSYMBOL="%{$c[red]$c_bold%}#%{$c_reset%}"
else
  USERSYMBOL="%{$c[yellow]$c_bold%}$%{$c_reset%}"
fi

pr_user="${PR_PROMPT_PREFIX}${USERSYMBOL}${PR_PROMPT_SUFIX}"
