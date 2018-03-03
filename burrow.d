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

# Detect if current shell is ZSH, and if so, load this file in bash
# compatibility mode.
if [ -n "$ZSH_VERSION" ]; then
	autoload bashcompinit
	bashcompinit
fi

complete -o default -o nospace -F _burrow burrow

# The following are necessary only for Cygwin, and only are needed
# when the user has tab-completed the executable name and consequently
# included the '.exe' suffix.
if [ Cygwin = "$(uname -o 2>/dev/null)" ]; then
complete -o default -o nospace -F _burrow burrow.exe
fi
