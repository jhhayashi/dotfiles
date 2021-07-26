DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/maybe_install_brew.sh

xcode-select --install
sudo xcodebuild -license accept

brew install macvim
brew link macvim

# https://github.com/Caldis/Mos/blob/master/README.enUS.md
# Application that allows different settings for scroll direction on mouse and trackpad
brew install --cask mos

# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
# allow us to run nvm
source ~/.nvm/nvm.sh
nvm install --lts
nvm alias default 'lts/*'
