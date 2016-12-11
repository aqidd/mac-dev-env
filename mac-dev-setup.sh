#! /bin/bash

clear;

#add custom bash profile
touch ~/.bash_profile

#install xcode dev tools
xcode-select --install

#install brew
echo "installing brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#update core utils
echo "updating core utils"
brew install coreutils

#install find utils
echo "installing findutils"
brew install findutils

#install bash
echo "install bash"
brew install bash

#install git
echo "install git"
brew install git

#update path
echo "update coreutils path"
echo 'export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH' >> ~/.bash_profile

#install node
echo "install n , node version manager"
brew update
#brew install node
brew install n

#install some versions of node
sudo n tls
sudo n latest

#update npm to the latest version
sudo npm install npm@latest -g

#install global composer
echo "install composer"
brew install homebrew/php/composer

#install laravel valet
echo "install valet"
brew install homebrew/php/php70
echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bash_profile
composer global require laravel/valet
echo 'export PATH=~/.composer/vendor/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
valet install

#install mariadb
echo "install mariadb"
brew install mariadb
brew services start mariadb

#npm install bower
echo "install bower"
npm install -g bower

echo "cleanup"
brew cleanup

#install brew cask
echo "install brew cask"
brew tap caskroom/cask

apps=(
	appcleaner
	android-studio
	android-file-transfer
	androidtool
	caffeine
	evernote
	firefox
	filezilla
	flux
	google-chrome
	imageoptim
	java
	macdown
	onyx
	postgres
	postman
	puush
	qlcolorcode
  	qlimagesize
	qlmarkdown
  	qlprettypatch
  	qlstephen
  	quicklook-csv
	quicklook-json
	rescuetime
	sequel-pro
	skype
	slack
	spectacle
	sourcetree
	spotify
	sublime-text
	suspicious-package
	the-unarchiver
	vlc
	veertu-desktop
	zeplin
)

echo “installing apps”
brew cask install --appdir="/Applications" ${apps[@]}

#install android-sdk
brew install android-sdk
#update platform-tools
android update sdk --no-ui --filter 'platform-tools'

#add JAVA_HOME & ANDROID_HOME
echo '# Create a JAVA_HOME variable, determined dynamically' >> ~/.bash_profile
echo 'export JAVA_HOME=$(/usr/libexec/java_home)' >> ~/.bash_profile
echo '# Add that to the global PATH variable' >> ~/.bash_profile
echo 'export PATH=${JAVA_HOME}/bin:$PATH' >> ~/.bash_profile
echo '# Add the Android SDK to the PATH variable' >> ~/.bash_profile
echo 'export PATH=${PATH}:~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools' >> ~/.bash_profile

#install cocoapods
brew install cocoapods

#install mac app store command line
brew install mas

#install LINE
mas install 539883307

#install Telegram Desktop
mas install 946399090

#install XCode
mas install 497799835

#add to dock
#google chrome
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

#android studio
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Android Studio.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

#xcode
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Xcode.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

#spotify
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Spotify.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

#source tree
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/SourceTree.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

#sublime
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Sublime Text.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

#restart dock
killall Dock

#extras: ionic & cordova for hybrid mobile app development
# sudo npm install -g cordova
# sudo npm install -g ionic
# sudo npm install -g ionic@1.7.16 #for your old ionic project
# sudo npm install -g ios-sim
# sudo npm install --global gulp-cli
# sudo npm install -g ios-deploy --unsafe-perm=true

echo "cleanup"
brew cleanup
brew cask cleanup
