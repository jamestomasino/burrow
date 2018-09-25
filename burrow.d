#!/usr/bin/env bash

_burrow() {
  local cur
  cur=${COMP_WORDS[COMP_CWORD]}
  if [ "${COMP_WORDS[1]}" == "gophermap" ]; then
    local gopher_dir
    local gophermaps
    local directories
    gopher_dir=$(burrow gopherdir)
    search_dir=${gopher_dir}
    if [ -n "${COMP_WORDS[2]}" ]; then
      partial_search_dir="${gopher_dir}${COMP_WORDS[2]}"
      if [ -d "$partial_search_dir" ]; then
        search_dir="$partial_search_dir"
      else
        partial_search_dir=$(dirname "$partial_search_dir")
        if [ -d "$partial_search_dir" ]; then
          search_dir="$partial_search_dir"
        fi
      fi
    fi
    gophermaps=$(find "$search_dir" -mindepth 1 -maxdepth 1 -type f -name "gophermap" -print | sed "s|$gopher_dir||" | sed "s|gophermap$||" )
    directories=$(find "$search_dir" -mindepth 1 -maxdepth 1 -type d -print | sed "s|$gopher_dir||" )
    local suggestions=( $( compgen -W "$gophermaps $directories" -- "$cur" ) )
    if [ "${#suggestions[@]}" == "1" ]; then
      local resp=$(echo ${suggestions[0]/%\ */})
      COMPREPLY=("$resp")
    else
      COMPREPLY=("${suggestions[@]}")
    fi
  else
    local helplist
    helplist=$(burrow shortlist)
    COMPREPLY=( $( compgen -W "$helplist" -- "$cur" ) )
  fi
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
