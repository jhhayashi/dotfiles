DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $* == "--help" ]] || [[ $* == "-h" ]]
then
  echo "usage: ./install.sh [ -h | --help ] [ --link | -l ]"
  echo "-h, --help | show this help"
  echo "-l, --link | link rc files rather than copying"
  exit 0
fi

CONFIG_FILES=(
  ".bash_profile"
  ".vimrc"
  ".tern-config"
  ".tmux.conf"
)

if [[ $* == "--link" ]] || [[ $* == "-l" ]]
then
  echo -e "\nlinking config files..."
  for file in "${CONFIG_FILES[@]}"
  do
    ln -s $DIR/$file ~/$file
  done
else
  echo -d "\ncopying config files..."
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
