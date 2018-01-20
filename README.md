# burrow ![status](https://img.shields.io/badge/status-working-green.svg?style=flat-square) ![license](https://img.shields.io/badge/license-GPL3-blue.svg?style=flat-square) ![bash](https://img.shields.io/badge/Bash-4%2B-lightgrey.svg?style=flat-square)

**burrow** is a helper for building and managing a gopher hole (in development).

## Installation

### Requirements
* make
* bash 4+

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

View the manual or `burrow -h` for more information.

## Config

`burrow` supports the following locations to define its configuration:

1) `$HOME/.config/burrow/config`
2) `$HOME/.config/burrow`
3) `$HOME/.burrow`

These files are processed in the order listed. Variables defined in multiple
locations will use the last assigned value.

The following options are available (defaults shown):

```bash
location_gopher="$HOME/gopher"
location_phlog="$HOME/gopher/phlog"
location_recipebox="$HOME/gopher/recipebox"
git_commit=false
git_push=false
custom_editor=false
```

_Note: This file is a valid Bash script and will be sourced upon load._

## Contributing
Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

## License
[GPL3](LICENSE)
