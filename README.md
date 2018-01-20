# burrow ![status](https://img.shields.io/badge/status-development-orange.svg?style=flat-square) ![license](https://img.shields.io/badge/license-GPL3-blue.svg?style=flat-square) ![bash](https://img.shields.io/badge/Bash-4%2B-lightgrey.svg?style=flat-square)

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
man burrow                # see full instructions
burrow -h                 # show help

burrow -p <title>         # create new phlog post
burrow -r <recipe_title>  # add new recipe to box
```

## Config

`burrow` supports two ways to define config.

1) `$HOME/.config/burrow`
2) `$HOME/.burrow`

In either location, the following options are available and show their defaults:

```bash
location_gopher = "$HOME/gopher"
location_phlog = "$HOME/gopher/phlog"
location_recipebox = "$HOME/gopher/recipebox"
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[GPL3](LICENSE)
