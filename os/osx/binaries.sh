#
# Binary installer
#

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew
brew update && brew upgrade brew-cask

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Install other useful binaries
binaries=(
  boot2docker
  casperjs
  git
  git-flow
  graphicsmagick
  heroku-toolbelt
  hub
  imagemagick
  node
  openssl
  phantomjs
  postgresql
  python
  redis
  sshfs
  trash
  webkit2png
  wget
  zsh
  zsh-completions
)

# Install the binaries
brew install ${binaries[@]}

# Add osx specific command line tools
if test ! $(which subl); then
  ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi

# Install spot
if test ! $(which spot); then
  curl -L https://raw.github.com/guille/spot/master/spot.sh -o /usr/local/bin/spot && chmod +x /usr/local/bin/spot
fi

# Install Oh My Zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Install ember-cli and dependencies
npm install -g ember-cli@0.1.15
npm install -g watchman
npm install -g bower

# Add mackup
pip install mackup

# Remove outdated versions from the cellar
brew cleanup

exit 0
