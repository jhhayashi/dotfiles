if ! [ `which brew` ]
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "set -g @plugin 'tmux-plugins/tpm'" >> ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-sensible'" >> ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-pain-control'" >> ~/.tmux.conf
echo "set -g @plugin 'christoomey/vim-tmux-navigator'" >> ~/.tmux.conf
echo "run '~/.tmux/plugins/tpm/tpm'" >> ~/.tmux.conf

tmux source ~/.tmux.conf
