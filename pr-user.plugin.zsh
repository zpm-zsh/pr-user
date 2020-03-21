#!/usr/bin/env zsh

local PR_PROMPT_PREFIX=${PR_PROMPT_PREFIX:-' '}
local PR_PROMPT_SUFIX=${PR_PROMPT_SUFIX:-''}

typeset -g pr_user="${PR_PROMPT_PREFIX}%{$c[yellow]$c_bold%}$%{$c_reset%}${PR_PROMPT_SUFIX}"

if [[ "$EUID" == 0 ]]; then
  pr_user="${PR_PROMPT_PREFIX}%{$c[red]$c_bold%}#%{$c_reset%}${PR_PROMPT_SUFIX}"
fi
