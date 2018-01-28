DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/maybe_install_brew.sh

brew install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source ~/.tmux.conf
