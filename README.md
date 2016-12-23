# dotfiles
My default settings for development. To install, read the [Makefile](/Makefile) and build the
targets you desire. Usually, the following will be all you need:

- `make install` grabs the plugins, and sets up [bashrc](/bashrc) and [vimrc](/vimrc). run this command right after cloning the repository.
- `make deploy` updates plugins and sets up [bashrc](/bashrc) and [vimrc](/vimrc). run this command anytime after installing the plugins with `make install`.
- `make bin` sets up binaries from [/bin/](/bin) to your `$PATH` by putting them in `/usr/local/bin/`
- `make debian` or `make arch` installs a bunch of handy packages I always end up installing one way or another... (Arch target doesn't include AUR installs)

## handy notes
- to add a new plugin: place the plug's appropriate `git clone` in the `plugins` target of
  the [Makefile](/Makefile). then, update [.gitmodules](/.gitmodules) and run
`make plugins`.
- good resource for customizing: [dotfiles project](https://dotfiles.github.io/).
- run `sudo visudo` and replace
`Defaults env_reset` with `Defaults env_reset,insults`. Enjoy the next time you
try to run anything as root and get your password wrong.
