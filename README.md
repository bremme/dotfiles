This repository contains by personal `.dotfiles`. Perhaps this repository can be helpful or inspirational to others.

# Installation

I use [homeshick](https://github.com/andsens/homeshick) to manage my dotfiles. See the homeshick project README for installation instructions.

```shell
# clone project
homeshick clone git@github.com:bremme/dotfiles.git

# link dotfiles
homeshick link dotfiles
```

# The journey

Dotfiles and dotfile management is something I really like about the GNU/Linux eco system. It start with the Unix philosophy that "everything is a file". So all your config is a file as well (in general,..ugh..dconf).

### Yet to be solved issues

If you want to install the same application on different machines there are many things that can be different like the package name or package manager. But recently the whole landscape seems to becoming more and more fragmented. Even on a single system there can be multiple ways to install a certain package (like .deb vs snap). And if you want to have a recent version you might need to rely on application level package managers or just directly run a script from git. The list below shows some of the format or repo's I've used to install software on GNU/Linux:

* Native package management
  * apt, dnf, pacman etc.
* Sandboxed (GUI) applications
  * Snap, Flatpak, AppImage etc.
* Alternative repo's
  * ppa's, (linux)brew, conda-forge etc.
* Language specific repo's
  * crates.io, PyPi.org, pkg.go, npm
* Other
  * nix, git

This is very much a hassle when trying to write some bootstrapping code/config to install all the applications you require. It could also further complicate configuration since depending on your installation method the location of the configuration might change.


## What do I want need

* essential
  * bootstraps new system
  * dotfiles in git
  * as simple as possible -> simple is better than complex
  * reproducible
  * should configure my systems >= 80%
    * Ideally with 20% of the effort
  * Recent versions and modern tools
  * Runs on all my systems / any/most GNU/Linux system
* nice to have
  * Per machine configuration
  * Secrets

### Bootstrapping and syncing

Bootstrapping new systems and keeping my dotfiles in sync. I used to have multiple repo's for these task, but recently merged them all into one big repo.

### Per machine configuration

If I break it down to the most essential separation, I have two type of machines: workstations and servers. Of course there can still be many differences between those two categories, like personal vs work, desktop vs laptop, virtual machine vs bare metal etc. But to keep it simple and manageable I will start with those two.

