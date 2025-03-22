# Jordan's Dotfiles
This repo contains all my dotfiles, along with an installation script to install
them and their dependencies.

## Installation
- There's currently a bug in installing homebrew, where the `brew` command isn't
  available after the installation script. To get around this, run
  `./scripts/maybe_install_brew.sh` before running the installation script below
- Install the dotfiles and dependencies
  - `./install.sh` Will show the help menu with instructions on how to configure the script.
  - `./install.sh --link` Will overwrite your dotfiles with dotfiles linked to this repo.
- Install the `tmux` dependencies by opening a tmux pane and doing `^b I`
- On MacOS, run the Mos app and reverse direction between mouse and trackpad

## Dependencies
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) requires the latest version of MacVim (scripted install coming soon)
  - MacVim requires xcode to be installed

## Shell Goodies
- Compile LaTeX to pdf with `pdftex [file]`

## Vim Goodies
- [Indentation visualization](https://github.com/Yggdroot/indentLine): To toggle, run `:IndentLinesToggle`

## Troubleshooting
- [Markdown Preview is 500ing](https://github.com/joeyespo/grip/issues/262)

## TODO
- Documentation/links for installed programs
- Script install of mac dependencies (xcode, macvim)
- Script for setting mac system prefs, hostname, etc.
- Script for setting git defaults
- OS-based installs (e.g. don't install mac dependencies on linux or windows)
