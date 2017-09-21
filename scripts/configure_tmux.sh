DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! [ `which brew` ]
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "copying tmux conf file"
cp DIR/../.tmux.conf ~/.tmux.conf 

tmux source ~/.tmux.conf
