# Jordan's Dotfiles
This repo contains all my dotfiles, along with an installation script to install
them and their dependencies.

## Installation
- Install the dotfiles and dependencies
  - `./install.sh` Will install and append my dotfiles to yours.
  - `./install.sh --link` Will overwrite your dotfiles with dotfiles linked to this repo.
- Install the `tmux` dependencies by opening a tmux pane and doing `^b I`

## Dependencies
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) requires the latest version of MacVim (scripted install coming soon)
  - MacVim requires xcode to be installed

## TODO
- Documentation/links for installed programs
- Script install of mac dependencies (xcode, macvim)
- Script for installing programs (macvim, nvm)
- Script for setting mac system prefs, hostname, etc.
- Script for setting git defaults
