set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $* == "--help" ]] || [[ $* == "-h" ]] || [[ $# -eq 0 ]]; then
  echo "usage: ./install.sh [ -h | --help ] [ --link | -l ]"
  echo "-h, --help      | show this help"
  echo "-l, --link      | link rc files rather than copying"
  echo "-o, --overwrite | copy files into locations, overwriting existing files"
  echo "--append | append these config files to any config files that already exist"
  echo "--dry-run | check to see if any config files will be changed"
  exit 0
fi

set -x

CONFIG_FILES=(
  ".bash_profile"
  ".vimrc"
  ".tern-config"
  ".tmux.conf"
)

if [[ $* == "--dry-run" ]]
then
  set +x
  echo -e "\nsearching for existing config files..."
  for file in "${CONFIG_FILES[@]}"
  do
    if [[ -e ~/$file ]]; then
      echo "~/$file already exists, this script may make unrecoverable changes to it"
    fi
  done
  exit 0
elif [[ $* == "--link" ]] || [[ $* == "-l" ]]
then
  echo -e "\nlinking config files..."
  for file in "${CONFIG_FILES[@]}"
  do
    ln -s $DIR/$file ~/$file
  done
elif [[ $* == "--overwrite" ]] || [[ $* == "-o" ]]
then
  echo -d "\noverwriting config files..."
  for file in "${CONFIG_FILES[@]}"
  do
    cp $DIR/$file ~/$file
  done
elif [[ $* == "--append" ]]
then
  echo -d "\nappending config files..."
  for file in "${CONFIG_FILES[@]}"
  do
    cat $DIR/$file >> ~/$file
  done
fi

echo -e "\nrunning install scripts..."
for script in $DIR/scripts/*
do
  bash $script
done
