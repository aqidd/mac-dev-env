#! /bin/bash

Set-ExecutionPolicy RemoteSigned -scope CurrentUser

iwr -useb get.scoop.sh | iex
scoop bucket add extras

scoop-apps=(
    adb
    android-studio
    android-sdk
    firefox
    foxit-reader
    git
    nvm
    openssh
    postman
    putty
    shutup10
    unzip
    wget
    zip
)
scoop install ${scoop-apps[@]}

[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')

nvm install 10

# install pyenv
git clone https://github.com/pyenv-win/pyenv-win.git $env:USERPROFILE/.pyenv
echo "follow instructions in https://github.com/pyenv-win/pyenv-win"

# installing jabba
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-Expression (
  Invoke-WebRequest https://github.com/shyiko/jabba/raw/master/install.ps1 -UseBasicParsing
).Content

jabba install openjdk@1.11.0
jabba use openjdk@1.11.0

## ???
$envRegKey = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey('SYSTEM\CurrentControlSet\Control\Session Manager\Environment', $true)
$envPath=$envRegKey.GetValue('Path', $null, "DoNotExpandEnvironmentNames").replace('%JAVA_HOME%\bin;', '')
[Environment]::SetEnvironmentVariable('JAVA_HOME', "$(jabba which $(jabba current))", 'Machine')
[Environment]::SetEnvironmentVariable('PATH', "%JAVA_HOME%\bin;$envPath", 'Machine')

# -------  #

# open power shell as admin

#! /bin/bash

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco feature enable -n allowGlobalConfirmation

choco-apps=(
    BatteryBar
    Cygwin
    docker-desktop
    GoogleChrome
    glaryutilities-free
    intellijidea-community
    Kindle
    notion
    puush
    sumatrapdf
    telegram
    vscode
    wisemo
    xmind
)

choco install ${choco-apps[@]}

wget "https://www.descript.com/download/windows"

# enable wsl 
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

echo 'please continue setting up you wsl environment manually'