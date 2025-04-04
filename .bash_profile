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

##################################
# git
##################################
# i need to gget my keyboard fixed
alias ggit=git

# git push upstream
alias gpup='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gitrev='git rev-parse --short HEAD'
function gcm() {
    git commit -m $*
}

prune-branches () {
  BRANCHES="$(git fetch --prune --dry-run 2>&1 | grep jhh/ | sed -E 's/.*origin\/(jhh\/.+)/\1/')"
  echo "branches to delete:"
  echo $BRANCHES
  read -p "Are you sure? " -n 1 -r
  echo ''
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo ''
    echo "deleting local branches..."
    git branch -D $BRANCHES
    echo ''
    echo "pruning remote branches..."
    git fetch --prune
  fi
}

##################################

# env variables
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

# remove formatting of whatever is in the clipboard
txt() {
  pbpaste | pbcopy
}

atob() {
  echo -n $1 | base64 -D && echo ""
  echo -n $1 | base64 -D | pbcopy
  echo "copied to clipboard!"
}

btoa() {
  echo -n $1 | base64
  echo -n $1 | base64 | tr -d \\n | pbcopy
  echo "copied to clipboard!"
}

# generate random pw
newpw() {
  length=${1:-18}
  pw="$(openssl rand -base64 $length | tr -d \\n)"
  echo $pw | tr -d \\n | pbcopy
  echo $pw
  echo "copied to clipboard!"
}

# https://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/
compress_images() {
  input_path=$1
  output_path=${2:-compressed}

  if [ "$#" -eq 0 ]; then
    echo "usage: compress_images input_path <output_path | \"compressed\">"
    echo "example: compress_images '*.png' output-path"
    return 1
  fi

  mkdir -p $output_path

  mogrify -path $output_path -filter Triangle -define filter:support=2 \
    -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality 82 \
    -define png:compression-level=9 -define png:compression-strategy=1 \
    -define png:exclude-chunk=all -interlace none -colorspace sRGB \
    -strip $input_path
}

resize_image() {
  input_path=$1
  size=$2
  # output_path=${2:-resized}

  if [ "$#" -eq 0 ]; then
    echo "usage: resize_image input_path <size>"
    echo "example: resize_image my-image.png 50%"
    echo "example: resize_image my-image.png 100x100"
    return 1
  fi

  # copy the file first so we don't mutate/overwrite it
  mkdir -p resized
  cp $input_path resized/$input_path

  mogrify -resize $size resized/$input_path 
}


post() {
  if [ "$#" -ne 2 ] || ! [[ "$1" == http* ]]; then
    echo "usage: post <url> <json>"
    echo 'example: post https://google.com {"foo": "bar"}'
    return 1
  fi

  curl "$1" --header "Content-Type: application/json" --request POST --data "$2"
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [ -d ~/Library/Python/3.6/bin ]
then
  export PATH=$PATH:~/Library/Python/3.6/bin
fi

# pyenv: https://github.com/pyenv/pyenv#installation
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"

  # https://github.com/pyenv/pyenv-virtualenv
  if [[ "$(which pyenv-virtualenv)" =~ "pyenv-virtualenv" ]]; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi

# poetry, installed from https://github.com/python-poetry/poetry#installation
export PATH="$HOME/.poetry/bin:$PATH"

# XCode
if [ -d /Applications/Xcode.app/Contents/Developer/usr/bin ]
then
  export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
fi

# Android Studio for React Native
# https://docs.expo.dev/workflow/android-studio-emulator/
if [ -d /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home ]
then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
fi
if [ -d ~/Library/Android/sdk ]
then
  export ANDROID_HOME=~/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/platform-tools
fi


# https://docs.brew.sh/Installation
if [ -d /opt/homebrew/bin ]
then
  export PATH=/opt/homebrew/bin:$PATH
fi

# set default shell
export SHELL=/bin/bash

# git autocomplete
if [ -f ~/.git-completion.bash ]
then
  source ~/.git-completion.bash
fi

# external conf
if [ -f ~/.external_bash_conf ]
then
  source ~/.external_bash_conf
fi

. "$HOME/.local/bin/env"
