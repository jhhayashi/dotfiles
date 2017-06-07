DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! [ `which brew` ]
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install macvim --with-override-system-vim

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
cd YouCompleteMe && git submodule update --init --recursive && ./install.py --clang-completer --tern-completer

# https://github.com/metakirby5/codi.vim
cd ~/.vim/bundle && git clone https://github.com/metakirby5/codi.vim.git
if [[ $* == *--update-rc* ]]
then
  cat $DIR/.codi >> ~/.bash_profile
fi

# https://github.com/pangloss/vim-javascript
git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
if [[ $* == *--update-rc* ]]
then
  echo 'let g:javascript_plugin_flow = 1' >> ~/.vimrc
fi

# https://github.com/mxw/vim-jsx
cd ~/.vim/bundle
git clone https://github.com/mxw/vim-jsx.git
if [[ $* == *--update-rc* ]]
then
  echo 'let g:jsx_ext_required = 0' >> ~/.vimrc
fi

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

# https://github.com/christoomey/vim-tmux-navigator
cd ~/.vim/bundle
git clone https://github.com/christoomey/vim-tmux-navigator

cd ~/.vim/bundle
git clone git://github.com/digitaltoad/vim-pug.git

# https://github.com/vim-syntastic/syntastic
cd ~/.vim/bundle && \
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
if [[ $* == *--update-rc* ]]
then
  cat $DIR/.syntastic >> ~/.vimrc
fi

# https://github.com/wavded/vim-stylus
cd ~/.vim/bundle
git clone git://github.com/wavded/vim-stylus.git

# https://github.com/xuhdev/vim-latex-live-preview
cd ~/.vim
mkdir -p plugin
git clone https://github.com/xuhdev/vim-latex-live-preview
mv vim-latex-live-preview/plugin/latexlivepreview.vim plugin/
rm -rf vim-latex-live-preview
brew install evince
brew cask install mactex
