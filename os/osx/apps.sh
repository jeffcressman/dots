#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
  adobe-creative-cloud
  appzapper
  arq
  atom
  boom
  carbon-copy-cloner
  charles
  chicken
  chromecast
  cleanmymac
  colloquy
  comicbooklover
  copy
  cyberduck
  cycling74-max
  daisydisk
  dash
  data-rescue
  debt-quencher
  firefox
  flux
  gas-mask
  gitbook
  google-chrome
  google-drive
  google-earth
  google-hangouts
  handbrake
  heroku-toolbelt
  hipchat
  ichm
  iphone-backup-extractor
  iphoto-library-manager
  istat-menus
  iterm2
  java
  jewelrybox
  kindle
  kitematic
  lastpass
  launchcontrol
  lighttable
  livereload
  mamp
  mindnode-pro
  miro-video-converter
  mplayerx
  omnifocus
  omnigraffle
  onyx
  osculator
  osxfuse
  pacifist
  parallels-desktop
  plex-home-theater
  plex-media-server
  postico
  processing
  quicklook-csv
  quicklook-json
  rdio
  rescuetime
  ripit
  sequel-pro
  skitch
  skype
  slack
  soundflower
  sourcetree
  spectacle
  spotify
  sublime-text
  sublime-text3
  sync
  terraform
  torbrowser
  tower
  tower
  transmit
  unrarx
  utorrent
  vagrant
  virtualbox
  vlc
  xscope
)

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
)

# Atom packages
atom=(
  dash
  color-picker
  linter
  markdown-preview
  sort-lines
)

# Specify the location of the apps
appdir="/Applications"

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

main() {

  # Ensure homebrew is installed
  homebrew

  # Install homebrew-cask
  echo "installing cask..."
  brew tap phinze/homebrew-cask
  brew install brew-cask

  # Tap alternative versions
  brew tap caskroom/versions

  # Tap the fonts
  brew tap caskroom/fonts

  # install apps
  echo "installing apps..."
  brew cask install --appdir=$appdir ${apps[@]}

  # install fonts
  echo "installing fonts..."
  brew cask install ${fonts[@]}

  # install atom plugins
  echo "installing atom plugins..."
  apm install ${atom[@]}

  cleanup
}

homebrew() {
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

cleanup() {
  brew cleanup
}

main "$@"
exit 0
