# dotfiles
My default settings for development. To install, read the [Makefile](/Makefile) and build the
targets you desire. Usually, the following will be all you need:

- `make deploy` sets up [bashrc](/bashrc) and [vimrc](/vimrc)
- `make bin` sets up binaries from [/bin/](/bin) to your `$PATH` by putting them in `/usr/local/bin/`
- `make debian` or `make arch` installs a bunch of handy packages I always end up installing one way or another... (Arch target doesn't include AUR installs)

### handy notes
- good resource for customizing: [dotfiles project](https://dotfiles.github.io/).
- run `sudo visudo` and replace
`Defaults env_reset` with `Defaults env_reset,insults`. Enjoy the next time you
try to run anything as root and get your password wrong.
