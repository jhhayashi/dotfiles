DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/maybe_install_brew.sh

brew install tree

# https://github.com/cli/cli
brew install gh

# https://github.com/jimeh/git-aware-prompt
mkdir ~/.bash
cd ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git

# https://github.com/metakirby5/codi.vim
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle && git clone https://github.com/metakirby5/codi.vim
