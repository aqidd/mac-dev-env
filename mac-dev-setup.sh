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
sudo n lts
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
	appium
	android-studio
	android-sdk
	android-file-transfer
	androidtool
	caffeine
	cyberduck
	evernote
	firefox
	filezilla
	flux
	google-chrome
	imageoptim
	java8 # java 9 will make android-sdk installation failed
	macdown
	nomachine
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
	visual-studio-code
	zeplin
)

echo “installing apps”
brew cask install --appdir="/Applications" ${apps[@]}

#update platform-tools
android update sdk --no-ui --filter 'platform-tools'

#add JAVA_HOME & ANDROID_HOME
echo '# Create a JAVA_HOME variable, determined dynamically' >> ~/.bash_profile
echo 'export JAVA_HOME=$(/usr/libexec/java_home)' >> ~/.bash_profile
echo '# Add that to the global PATH variable' >> ~/.bash_profile
echo 'export PATH=${JAVA_HOME}/bin:$PATH' >> ~/.bash_profile
echo '# Add the Android SDK to the PATH variable' >> ~/.bash_profile
echo 'export ANDROID_HOME=~/Library/Android/sdk' >> ~/.bash_profile
echo 'export PATH=${PATH}:{$ANDROID_HOME}/tools:{$ANDROID_HOME}/platform-tools' >> ~/.bash_profile

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

#extras: check for extra arguments
for var in "$@"
  do
    if [ "$var" == "ionic" ]; then
		sudo npm install -g cordova
		sudo npm install -g ionic
		sudo npm install -g ionic@1.7.16 #for your old ionic project
		sudo npm install -g ios-sim
		sudo npm install --global gulp-cli
		sudo npm install -g ios-deploy --unsafe-perm=true
    elif [ "$var" == "appium" ]; then
		npm install -g appium
		npm install wd 
    elif [ "$var" == "oh-my-zsh" ]; then
    	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    elif [ “$var” == “deployd” ]; then
		sudo npm install -g deployd-cli
		sudo npm install -g forever
		brew update
		brew install mongodb
		sudo mkdir -p /data/db
		brew services start mongodb
    else
    	echo $var + " argument is not supported"
    fi
  done

echo "cleanup"
brew cleanup
brew cask cleanup
