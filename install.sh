set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ARGS=$*

function argIncludes() {
  if [[ $ARGS == *"$1"* ]]; then return 0; else return 1; fi
}

if argIncludes "--help" || argIncludes "-h" || [[ $# -eq 0 ]]; then
  echo "usage: ./install.sh [options]"
  echo "--help          | show this help"
  echo "--link          | link rc files rather than copying"
  echo "--overwrite     | copy files into locations, overwriting existing files"
  echo "--append        | append these config files to any config files that already exist"
  echo "--dry-run       | check to see if any config files will be changed"
  echo "--install-only  | do nothing with config files and run install scripts"
  echo "--skip-install  | stop after copying config files. This is recommended for non-mac installs"
  echo -e "\nIf multiple flags are passed, only one will execute."
  echo "The priority matches the order in the above help text."
  exit 0
fi

CONFIG_FILES=(
  ".bash_profile"
  ".vimrc"
  ".ideavimrc"
  ".tern-config"
  ".tmux.conf"
)

function removeOldConfigs() {
  for file in "${CONFIG_FILES[@]}"
  do
    if [[ -e ~/$file ]]; then
      echo "deleting ~/$file"
      rm ~/$file
    fi
  done
}


# handle config files
if argIncludes "--dry-run"; then
  echo -e "\nsearching for existing config files..."
  for file in "${CONFIG_FILES[@]}"
  do
    if [[ -e ~/$file ]]; then
      echo "~/$file already exists, this script may make unrecoverable changes to it"
    fi
  done
  exit 0
elif argIncludes "--link"; then
  echo -e "\nlinking config files..."
  removeOldConfigs
  for file in "${CONFIG_FILES[@]}"
  do
    ln -sv $DIR/$file ~/$file
  done
elif argIncludes "--overwrite"; then
  echo -e "\noverwriting config files..."
  removeOldConfigs
  for file in "${CONFIG_FILES[@]}"
  do
    cp -vf $DIR/$file ~/$file
  done
elif argIncludes "--append"; then
  echo -e "\nappending config files..."
  for file in "${CONFIG_FILES[@]}"
  do
    cat $DIR/$file >> ~/$file
  done
elif ! argIncludes "--install-only"; then
  echo "Error: you must specify how to handle config files"
  exit 1
fi


# run every script in the scripts dir
if ! argIncludes "--skip-install"; then
  echo -e "\nrunning install scripts..."
  for script in $DIR/scripts/*
  do
    bash $script
  done
fi
