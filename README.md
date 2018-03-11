# burrow ![status](https://img.shields.io/badge/status-working-green.svg?style=flat-square) ![license](https://img.shields.io/badge/license-GPL3-blue.svg?style=flat-square) ![bash](https://img.shields.io/badge/Bash-4%2B-lightgrey.svg?style=flat-square)

**burrow** is a helper for building and managing a gopher hole.

## Installation

### Dependencies

#### Required

* bash 4+

  * Install on OSX: `brew install bash`

#### Recommended

* GNU sed

  * Avoids creation of `.bak` files in strange places on OSX
  * Install on OSX: `brew install gnu-sed --with-default-names`

* GNU getopt

  * Required to use long named switches, like --version or --help instead of -v and -h.
  * Install on OSX: `brew install gnu-getopt --with-default-names`

### Install

`sudo make install`

_Note: On systems without admin access the binary can be run directly from the
git repo, but will lack `man` support and command completion._

See the [Getting Started](https://github.com/jamestomasino/burrow/wiki/Getting-Started) guide.

### Uninstall

`sudo make uninstall`

## Usage

```bash
burrow phlog          # create new phlog post
burrow recipe         # add or update a recipe to box
burrow topic          # add or update a topic file
burrow create-config  # generate a default config file
burrow edit-config    # open your config file for editing
burrow update-git     # pull latest git repo for gopher dir, if exists
burrow update-burrow  # update git repo or pull latest version from github
```

- `create-config` will auto-generate a configuration file at
`$HOME/.config/burrow/config`. It will be populated by the default parameters
listed below and provide an easy way to customize your configuration. At a
minimum you should update your `config_dir_gopher` to point to the folder on
your local computer where your gopher hole resides.

- `edit-config` will open your burrow configuration file for easy editing.

- `phlog` will prompt for the title of a new post, then open it in your default
`$EDITOR`. By default it will provide you a template, but you can override this
by including a `.template` file in your phlog directory.

- `recipe` will prompt for the name of your recipe, then open it in your default
`$EDITOR`. By default it will provide you a template, but you can override this
by including a `.template` file in your recipe box directory.

- `topic` will prompt for the name of the topic, then open it in your default
`$EDITOR`. By default it will provide you a template, but you can override this
by including a `.template` file in your topics directory.

- `update-git` will silently attempt to update a git repository at the location
of your gopher hole. It is appropriate for use by a cron job.

- `update-burrow` will attempt to pull the latest version of burrow from git if
your local folder is a git repository. If not, it will attempt to update each
file in the burrow directory with the same named file in the master branch of
the git repository for burrow on Github.

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
config_gopher_server="sdf.org"         # server of gopher host
config_gopher_port="70"                # port of gopher host
config_gopher_root="/users/username/"  # path on gopher host to gopher site

config_dir_phlog="phlog"               # relative path to phlog
config_phlog_gophermap=true            # phlogs use gophermap format by default
config_phlog_usedate=true              # use a date-stamp on phlog posts

config_dir_recipebox="recipebox"       # relative path to recipe box
config_recipebox_gophermap=false       # recipes use plain text by default
config_recipebox_usedate=false         # do not use a date-stamp on recipe filenames

config_dir_topics="topics"             # relative path to topics directory
config_topics_gophermap=true           # topic notes use gophermap format by default
config_topics_usedate=false            # do not use a date-stamp on topic filenames

config_git_commit=false                # automatically commit changes if git repo
config_git_push=false                  # automatically push changes if git repo

config_autoindent=true                 # automatically reformat gophermaps with leading "i"
                                       # types and parse links at the end of file
```

_Note: This file is a valid Bash script and will be sourced upon load._

## Contributing
Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

## License
[GPL3](LICENSE)
