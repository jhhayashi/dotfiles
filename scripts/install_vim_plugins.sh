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

# https://github.com/metakirby5/codi.vim
cd ~/.vim/bundle && git clone https://github.com/metakirby5/codi.vim.git
if [[ $* == *--update-rc* ]]
then
  cat $DIR/.codi >> ~/.bash_profile
fi

# https://github.com/sheerun/vim-polyglot
git clone https://github.com/sheerun/vim-polyglot ~/.vim/bundle/vim-polyglot

# https://github.com/JamshedVesuna/vim-markdown-preview
cd ~/.vim/bundle
git clone https://github.com/JamshedVesuna/vim-markdown-preview
brew install grip
if [[ $* == *--update-rc* ]]
then
  echo 'let vim_markdown_preview_github=1' >> ~/.vimrc
  echo "let vim_markdown_preview_browser='Google Chrome'" >> ~/.vimrc
fi

# http://vimawesome.com/plugin/jshint
cd ~/.vim/bundle
git clone https://github.com/jshint/jshint

# https://github.com/Yggdroot/indentLine
cd ~/.vim/bundle
git clone https://github.com/Yggdroot/indentLine

# https://github.com/christoomey/vim-tmux-navigator
cd ~/.vim/bundle
git clone https://github.com/christoomey/vim-tmux-navigator

cd ~/.vim/bundle
git clone https://github.com/digitaltoad/vim-pug.git

# https://github.com/dense-analysis/ale
git clone https://github.com/dense-analysis/ale.git ~/.vim/bundle/ale

# https://github.com/tomasr/molokai
git clone https://github.com/tomasr/molokai ~/.vim/bundle/molokai
mkdir -p ~/.vim/colors
cp ~/.vim/bundle/molokai/colors/molokai.vim ~/.vim/colors/

# https://github.com/xuhdev/vim-latex-live-preview
cd ~/.vim
mkdir -p plugin
git clone https://github.com/xuhdev/vim-latex-live-preview
mv vim-latex-live-preview/plugin/latexlivepreview.vim plugin/
rm -rf vim-latex-live-preview
brew install evince
brew install --cask mactex
