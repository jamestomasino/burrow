#!/usr/bin/env bash

_burrow()
{
  # Get basic autocomplete commands from the function itself
  local helplist
  helplist=$(burrow shortlist)

  # Combine all the lists for autocomplete
  local cur
  cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $( compgen -W "$helplist" -- "$cur" ) )
}
complete -F _burrow burrow
