# case-insensitive autocomplete
echo "turning off case insensitive terminals..."
SETTING="set completion-ignore-case On"
if ! [ -f ~/.inputrc ] || ! cat ~/.inputrc | grep -q "$SETTING"; then
  echo "set completion-ignore-case On" >> ~/.inputrc
fi

# change location of screenshots
echo "setting screenshot location to ~/Desktop/Screenshots"
mkdir -p ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots
killall SystemUIServer
