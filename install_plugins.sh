if ! [ `which brew` ]
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install macvim --with-override-system-vim

mkdir -p ~/.vim/bundle

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
# if [[ $* == *--update-rc* ]]
# then
#   cat >> ~/.bash_profile << EOL
#   # Codi
#   # Usage: codi [filetype] [filename]
#   codi() {
#     local syntax="${1:-python}"
#     shift
#     vim -c \
#       "let g:startify_disable_at_vimenter = 1 |\
#       set bt=nofile ls=0 noru nonu nornu |\
#       hi ColorColumn ctermbg=NONE |\
#       hi VertSplit ctermbg=NONE |\
#       hi NonText ctermfg=0 |\
#       Codi $syntax" "$@"
#   }
#   EOL
# fi

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
