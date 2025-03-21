DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/maybe_install_brew.sh

mkdir -p ~/.vim/bundle

if [ ! -d ~/.vim/autoload ]
then
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if [[ $* == *--update-rc* ]]
then
  echo '' >> ~/.vimrc
  echo 'execute pathogen#infect()' >> ~/.vimrc
fi

# https://github.com/Valloric/YouCompleteMe
brew install cmake
cd ~/.vim/bundle && git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe && git submodule update --init --recursive && \
  ./install.py --clang-completer --ts-completer

# https://github.com/sheerun/vim-polyglot
git clone https://github.com/sheerun/vim-polyglot ~/.vim/bundle/vim-polyglot

# https://github.com/Yggdroot/indentLine
cd ~/.vim/bundle
git clone https://github.com/Yggdroot/indentLine

# https://github.com/christoomey/vim-tmux-navigator
cd ~/.vim/bundle
git clone https://github.com/christoomey/vim-tmux-navigator

# https://github.com/dense-analysis/ale
git clone https://github.com/dense-analysis/ale.git ~/.vim/bundle/ale

# https://github.com/github/copilot.vim
git clone https://github.com/github/copilot.vim ~/.vim/bundle/copilot.vim
