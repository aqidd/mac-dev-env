#!/bin/bash

# install wifi adapter for acer one
sudo apt-get install git build-essential
git clone https://github.com/lwfinger/rtl8723bu
cd rtl8723bu
make
sudo make install
sudo modprobe -v 8723bu

# install java
sudo apt-get install openjdk-8-jre

sudo apt-get install unzip

# install android studio. based on https://gist.github.com/bmc08gt/8077443
chmod +x setup_android_studio.sh
./setup_android_studio.sh

# install composer
sudo apt install composer

# install required packages for laravel
sudo apt-get php7.0-curl php7.0-mbstring php7.0-mcrypt php7.0-xml php7.0-zip
sudo apt-get install mysql-server php7.0-mysql

# install required files for laravel valet
sudo apt-get install libnss3-tools jq xsel

# install laravel valet
composer global require cpriego/valet-linux
~/.config/composer/vendor/bin/install valet

# adminer setup
mkdir adminer
cd adminer
wget https://github.com/vrana/adminer/releases/download/v4.3.1/adminer-4.3.1-en.php
mv adminer-4.3.1-en.php index.php
valet link
cd ..

# npm & n node version manager
sudo apt install npm
sudo npm install -g n
sudo n lts
sudo n latest
sudo n stable

# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client

# install visual studio code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get update
sudo apt-get install code # or code-insiders

# install google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# install terminator
sudo apt-get install terminator

# install git-cola
sudo apt-get install git-cola

# install oh-my-zsh
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install teamviewer
wget https://dl.tvcdn.de/download/version_12x/teamviewer_12.0.85001_i386.deb
sudo dpkg -i teamviewer_12.0.85001_i386.deb

# install adb
sudo apt-get install android-tools-adb

# install shutter
sudo apt-get install shutter

# making sure that all changes are done
reboot



