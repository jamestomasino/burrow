# burrow ![status](https://travis-ci.com/jamestomasino/burrow.svg?branch=master) ![license](https://img.shields.io/badge/license-GPL3-blue.svg?style=flat-square)

**burrow** is a helper for building and managing a gopher hole.

## Installation

_Note: On systems without admin access the binary can be run directly from the
git repo, but will lack `man` support and command completion._

See the [Getting Started](https://github.com/jamestomasino/burrow/wiki/Getting-Started) guide.

### Install on Linux / MacOS

`sudo make install`

### Install on BSD systems

#### FreeBSD

- Installing bash-completion via either `pkg install bash-completion` or via the `shells/bash-completion` port.
- Installing the GNU version of make via either `pkg install gmake` or the `port devel/gmake`.
- Rather than using `sudo make install`, run `sudo gmake install`.

#### OpenBSD

- Install the GNU version of make via either `pkg_add gmake` or the port `devel/gmake`.
- There is no bash-completion package or port in OpenBSD. However the source code can be found at https://github.com/scop/bash-completion
- Burrow appears to install and run without the presence of bash-completion. Exercise caution.
- As root (or via `doas`), run `gmake install`.


### Uninstall

`sudo make uninstall` # or gmake uninstall on BSD

## Usage

```bash
burrow phlog          # create new phlog post
burrow gophermap      # edit a gophermap
burrow rss            # generate a RSS feed of phlog entries
burrow edit-config    # open your config file for editing
burrow update-git     # pull latest git repo for gopher dir, if exists
```

- `edit-config` will open your burrow configuration file for easy editing.

- `phlog` will prompt for the title of a new post, then open it in your default
`$EDITOR`.

- `gophermap` will open a gophermap file for editing. This will
remove any `type i` formatting and allow comments to be added in natural text.
You will still need to create links in the proper gophermap formatting.

- `rss` will automatically generate an RSS feed of your most recent phlog
entries and output it to the root of your gopher directory. This can be
automatically generated by using the config option `config_phlog_autorss`.

- `update-git` will silently attempt to update a git repository at the location
of your gopher hole. It is appropriate for use by a cron job.

_`man burrow` or `burrow -h` for more information._

## Config

The following locations are available for configuration:

1) `/etc/burrow/config`
2) `$XDG_CONFIG_HOME`
3) `$HOME/.config/burrow/config`
4) `$HOME/.config/burrow`
5) `$HOME/.burrow`

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

config_git_commit=false                # automatically commit changes if git repo
config_git_push=false                  # automatically push changes if git repo

config_autoindent=true                 # automatically reformat gophermaps with leading "i"
                                       # types and parse links at the end of file

config_file_rss="rss.xml"              # filename of RSS feed
config_gopher_name="My Gopher Hole"    # used in RSS feed output
config_gopher_desc="Description"       # used in RSS feed output
config_rss_num_entries="10"            # number of entries to inclued in RSS feed
config_phlog_autorss=false             # automatically generate RSS feed

```

_Note: This file is a valid Bash script and will be sourced upon load._

## Disambiguity

There is [another burrow project](https://github.com/sloumdrone/burrow) created
by _sloumdrone_. His burrow project is a GUI gopher client. Please check it out!

There is also another project called "Burrow the Burrows" which can be found on gopher at: `gopher://kalos.mine.nu/1/burrow/index.gph`. It aims to construct and maintain a graph of the whole Gopherspace.

Finally, there is another [static site generator for gopher](https://github.com/hyperrealgopher/burrow) written in Haskell by @hyperrealgopher. It has similar features to my burrow.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

## License
[GPL3](LICENSE)
