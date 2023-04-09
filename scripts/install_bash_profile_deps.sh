DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/maybe_install_brew.sh

brew install tree
brew install jq

# https://github.com/cli/cli
brew install gh

# git autocomplete
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash

# https://github.com/jimeh/git-aware-prompt
mkdir ~/.bash
cd ~/.bash
git clone https://github.com/jimeh/git-aware-prompt.git

# https://github.com/metakirby5/codi.vim
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle && git clone https://github.com/metakirby5/codi.vim

# https://github.com/pyenv/pyenv-virtualenv
brew install pyenv pyenv-virtualenv
