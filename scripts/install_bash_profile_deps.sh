if ! [ `which brew` ]
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install yarn

brew install nvm
nvm install 6
nvm alias default 6

# https://github.com/jimeh/git-aware-prompt
mkdir ~/.bash
cd ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git

# https://github.com/metakirby5/codi.vim
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle && git clone https://github.com/metakirby5/codi.vim
