# case-insensitive autocomplete
echo "set completion-ignore-case On" >> ~/.inputrc

# change location of screenshots
mkdir -p ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots
killall SystemUIServer
