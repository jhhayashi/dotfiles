# Jordan's Dotfiles
This repo contains all my dotfiles, along with an installation script to install
them and their dependencies.

## Installation
- Install the dotfiles and dependencies
  - `./install.sh` Will show the help menu with instructions on how to configure the script.
  - `./install.sh --link` Will overwrite your dotfiles with dotfiles linked to this repo.
- Install the `tmux` dependencies by opening a tmux pane and doing `^b I`

## Dependencies
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) requires the latest version of MacVim (scripted install coming soon)
  - MacVim requires xcode to be installed

## Shell Goodies
- Compile LaTeX to pdf with `pdftex [file]`

## Vim Goodies
- [Markdown Preview](https://github.com/JamshedVesuna/vim-markdown-preview): When editing a markdown file, input `ctrl-p` to open a preview in browser
- [Indentation visualization](https://github.com/Yggdroot/indentLine): To toggle, run `:IndentLinesToggle`

## Troubleshooting
- [Markdown Preview is 500ing](https://github.com/joeyespo/grip/issues/262)

## TODO
- Documentation/links for installed programs
- Script install of mac dependencies (xcode, macvim)
- Script for setting mac system prefs, hostname, etc.
- Script for setting git defaults
- OS-based installs (e.g. don't install mac dependencies on linux or windows)
