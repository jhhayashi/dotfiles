pw () {
  read -s
  echo $REPLY
  unset $REPLY
}

function cd {
  builtin cd "$@" && ls -Gp
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias grep='grep --color=auto'
alias ls='ls -Gp'
alias ping='ping -c 5'
alias rmf='rm -Rf'
alias copen='open -a Sublime\ Text\ 2'
alias vs='vim -O'
function openApp {
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app=$1
}
alias app=openApp
alias fb='app http://www.messenger.com'
alias sc='app http://www.soundcloud.com'

# https://hub.github.com/
alias git=hub

# env variables
export NODE_ENV='development'
export EDITOR=vim

# https://github.com/jimeh/git-aware-prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u@\h:\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Codi https://github.com/metakirby5/codi.vim
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# XCode
if [ -d /Applications/Xcode.app/Contents/Developer/usr/bin ]
then
  export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
fi

# https://docs.expo.io/versions/latest/guides/genymotion.html
if [ -d /Applications/Genymotion.app/Contents/MacOS/tools ]
then
  export PATH=$PATH:/Applications/Genymotion.app/Contents/MacOS/tools
fi

# external conf
if [ -f ~/.kensho_bash_conf ]
then
  source ~/.kensho_bash_conf
fi
