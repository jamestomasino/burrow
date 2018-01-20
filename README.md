# burrow ![status](https://img.shields.io/badge/status-working-green.svg?style=flat-square) ![license](https://img.shields.io/badge/license-GPL3-blue.svg?style=flat-square) ![bash](https://img.shields.io/badge/Bash-4%2B-lightgrey.svg?style=flat-square)

**burrow** is a helper for building and managing a gopher hole (in development).

## Installation

### Requirements
* make
* bash 4+

### Install

`make install`

### Uninstall

`make uninstall`

## Usage

```bash
burrow phlog       # create new phlog post
burrow recipe      # add new recipe to box
```

View the manual for more information.

## Config

`burrow` supports locations to define config.

1) `$HOME/.config/burrow/config`
2) `$HOME/.config/burrow`
3) `$HOME/.burrow`

In either location, the following options are available and show their defaults:

```bash
location_gopher="$HOME/gopher"
location_phlog="$HOME/gopher/phlog"
location_recipebox="$HOME/gopher/recipebox"
git_commit=false
git_push=false
custom_editor=false
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[GPL3](LICENSE)
