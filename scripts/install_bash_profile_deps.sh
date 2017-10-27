if ! [ `which brew` ]
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install tree

brew install nvm
nvm install 8
nvm alias default 8

# https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
brew install reattach-to-user-namespace

# https://hub.github.com/
brew install hub

# https://github.com/jimeh/git-aware-prompt
mkdir ~/.bash
cd ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git

# https://github.com/metakirby5/codi.vim
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle && git clone https://github.com/metakirby5/codi.vim
