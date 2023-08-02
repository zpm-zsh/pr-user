#!/usr/bin/env zsh

typeset -g pr_user=" %{${c[orange]}${c[bold]}%}$%{${c[reset]}%}"

if [[ "$EUID" == 0 ]]; then
  pr_user=" %{${c[red]}${c[bold]}%}#%{${c[reset]}%}"
fi
