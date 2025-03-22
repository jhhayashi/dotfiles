DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/maybe_install_brew.sh

brew install tree
brew install jq

# https://github.com/cli/cli
brew install gh

# git autocomplete
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash

# https://github.com/jimeh/git-aware-prompt
mkdir -p ~/.bash
cd ~/.bash
if [ ! -d "git-aware-prompt" ]; then
    git clone https://github.com/jimeh/git-aware-prompt.git
fi
