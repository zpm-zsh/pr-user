#!/usr/bin/env zsh

local PR_PROMPT_PREFIX=${PR_PROMPT_PREFIX:-' '}
local PR_PROMPT_SUFIX=${PR_PROMPT_SUFIX:-''}

if (( $+functions[zpm] )); then #DO_NOT_INCLUDE_LINE_IN_ZPM_CACHE
  zpm zpm-zsh/colors #DO_NOT_INCLUDE_LINE_IN_ZPM_CACHE
fi #DO_NOT_INCLUDE_LINE_IN_ZPM_CACHE

typeset -g pr_user

pr_user="${PR_PROMPT_PREFIX}%{$c[red]$c_bold%}#%{$c_reset%}${PR_PROMPT_SUFIX}"

if [[ "$EUID" != 0 ]]; then
  pr_user="${PR_PROMPT_PREFIX}%{$c[yellow]$c_bold%}$%{$c_reset%}${PR_PROMPT_SUFIX}"
fi
