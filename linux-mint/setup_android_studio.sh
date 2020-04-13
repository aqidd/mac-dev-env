#!/bin/bash

# only works atm if only one jdk package in downloads
DOWNLOADS=$HOME/Downloads
CURRENT_VERSION=$(java -version 2>&1)
JDK=` ls $DOWNLOADS | grep "jdk"`
STUDIO_URL=https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/android-studio-ide-171.4443003-linux.zip
if [ "uname -m" == "i386" -o "uname -m" == "i686" ]; then
    ARCH=32
else
    ARCH=64
fi

if [ "$ARCH" == "32" ]; then
    if [ "$JDK" == "" ]; then
        (cd $DOWNLOADS; wget http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-linux-i586.tar.gz)
    fi
elif [ "$ARCH" == "64" ]; then
    if [ "$JDK" == "" ]; then
        (cd $DOWNLOADS; wget http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-linux-x64.tar.gz)
    fi
else 
    echo "Architecture unable to be determined"
    exit
fi

# reset JDK variable
JDK=` ls $DOWNLOADS | grep "jdk"`

sudo apt-get install lib32ncurses5 ia32-libs 2>&1
tar xzvf $DOWNLOADS/$JDK
JDK_VERSION=` ls | grep "jdk" `
sudo mv $JDK_VERSION /usr/lib/jvm
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/$JDK_VERSION/bin/java
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/$JDK_VERSION/bin/javac
sudo update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/$JDK_VERSION/bin/javaws
sudo update-alternatives --config java
sudo update-alternatives --config javaws

if [ ! -d $HOME/android-studio -o ! -f $DOWNLOADS/android-studio* ]; then
    (cd $DOWNLOADS; wget $STUDIO_URL)
    #verify download finished
    if [ ! -f $DOWNLOADS/android-studio* ]; then
        echo "tar not found. Download failed?"
        exit
    fi
fi
STUDIO_TAR=` ls $DOWNLOADS | grep "android-studio" `
unzip $DOWNLOADS/$STUDIO_TAR
STUDIO_DIR=` ls | grep "android-studio" `
./$STUDIO_DIR/bin/studio.sh



