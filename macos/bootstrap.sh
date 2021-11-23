#!/bin/bash

PYTHON_VERSION=3.9.7
NODE_VERSION=16

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install jq
brew install jq

# Install zsh
brew install zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -s --unattended && echo "Install complete!"

# Add dot files to home
cp .zshrc $HOME
cp .vimrc $HOME

# Install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install pure zsh theme
git clone https://github.com/sindresorhus/pure.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/functions/pure

# Install git
brew install git

# Install mysql cli
brew install mysql

# Install node
brew install fnm
eval "$(fnm env)"
fnm install $NODE_VERSION

# Install watch
brew install watch

# Install python
brew install python

#!!!
# pyenv DOES NOT behave well with standard virtualenv so 
# this is a better way to do it IMO
#!!!
pip install virtualenv

brew install pyenv pyenv-virtualenv

pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION

####
## Switch the shell verison with
# > pyenv shell 3.8.0
#
# virtualenv workflow:
# > pyenv virtualenv <python-version> <name>
# > pyenv activate <name>
#
# To automatically set a virtual environment for a given directory
# add it to the .python-version file or create with pyenv local <name>
####

# Install gotop for system monitoring
brew tap cjbassi/gotop
brew install gotop

# Install GoLang
brew install go

go get golang.org/x/tools/cmd/godoc
go get github.com/golang/lint/golint
go get golang.org/x/tools/gopls@latest


# Install ngrok
brew install --cask ngrok

# Install jdk
# at this time it's jdk-17
###
# To install a different version
# brew tap homebrew/cask-versions
# brew search --casks temurin # choose appropriate version and install as below
brew install --cask temurin

# Install maven
brew install maven

# Rectangle window management
brew install --cask rectangle

# Install visual studio code
brew install --cask visual-studio-code

# Install IntelliJ
brew install --cask intellij-idea-ce

# Install iTerm
brew install --cask iterm2

# Install slack
brew install --cask slack

# Install chrome
brew install --cask google-chrome

# Install chromedriver 
brew install --cask chromedriver

# Install Docker
brew install --cask docker

cp com.googlecode.iterm2.plist $HOME/Library/Preferences/

open -a iTerm

exit
