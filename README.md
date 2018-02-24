# burrow ![status](https://img.shields.io/badge/status-working-green.svg?style=flat-square) ![license](https://img.shields.io/badge/license-GPL3-blue.svg?style=flat-square) ![bash](https://img.shields.io/badge/Bash-4%2B-lightgrey.svg?style=flat-square)

**burrow** is a helper for building and managing a gopher hole.

## Installation

### Requirements
* make
* bash 4+
* GNU sed (aka, not the default OSX one)

### Install

`sudo make install`

_Note: On systems without admin access the binary can be run directly from the
git repo, but will lack `man` support and command completion._

### Uninstall

`sudo make uninstall`

## Usage

```bash
burrow phlog          # create new phlog post
burrow recipe         # add new recipe to box
burrow create-config  # generate a default config file
burrow update-git     # pull latest git repo for gopher dir, if exists
```

- `phlog` will prompt for the title of the post, then open it in your default
`$EDITOR`. By default it will provide you a template, but you can override this
by including a `.template` file in your phlog directory.

- `recipe` will prompt for the name of your recipe, then open it in your default
`$EDITOR`. By default it will provide you a template, but you can override this
by including a `.template` file in your recipe box directory.

- `create-config` gives you the same settings as you have by default without
a configuration file, but it provides you a starting point for customization.

- `update-git` is appropriate for cron jobs to keep the gopher hole in sync.

_`man burrow` or `burrow -h` for more information._

## Config

The following locations are available for configuration:

1) `$HOME/.config/burrow/config`
2) `$HOME/.config/burrow`
3) `$HOME/.burrow`

These files are processed in the order listed. Variables defined in multiple
locations will use the last assigned value.

The following options are available (defaults shown):

```bash
config_dir_gopher="$HOME/gopher"       # local path to gopher site
config_dir_phlog="phlog"               # relative path to phlog
config_dir_recipebox="recipebox"       # relative path to recipe box
config_gopher_server="sdf.org"         # server of gopher host
config_gopher_port="70"                # port of gopher host
config_gopher_root="/users/username/"  # absolute path on gopher host to gopher site
config_git_commit=false                # automatically commit changes if git repo
config_git_push=false                  # automatically push changes if git repo
config_autoindent=true                 # automatically reformat phlogs with leading spaces
config_custom_editor=false             # use something other than $EDITOR
```

_Note: This file is a valid Bash script and will be sourced upon load._

## Contributing
Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

## License
[GPL3](LICENSE)
