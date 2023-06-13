#!/usr/bin/env zsh

: ${PR_PROMPT_PREFIX:=' '}
: ${PR_PROMPT_SUFIX:=''}

typeset -g pr_user="${PR_PROMPT_PREFIX}%{${c[orange]}${c[bold]}%}$%{${c[reset]}%}${PR_PROMPT_SUFIX}"

if [[ "$EUID" == 0 ]]; then
  pr_user="${PR_PROMPT_PREFIX}%{${c[red]}${c[bold]}%}#%{${c[reset]}%}${PR_PROMPT_SUFIX}"
fi
