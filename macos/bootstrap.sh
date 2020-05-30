#!/bin/bash

PYTHON_VERSION=3.8.0
NODE_VERSION=10.17.0
JAVA_VERSION=11

# Add dot files to home
cp .zshrc $HOME
cp .vimrc $HOME

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install jq
brew install jq

# Install zsh
brew install zsh

# Install oh-my-zsh
# !!!
# This has a user input to set zsh to default shell
# !!!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install spaceship zsh theme
git clone git@github.com:denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt
ln -s ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship.zsh-theme

# Install pure zsh theme
git clone https://github.com/sindresorhus/pure.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/functions/pure

# Install git
brew install git

# Install mysql cli
brew install mysql

# Install node
mkdir $HOME/.nvm
brew install nvm
source $(brew --prefix nvm)/nvm.sh
nvm install $NODE_VERSION
nvm alias default $NODE_VERSION

# Install watch
brew install watch

# Install python
brew install python

#!!!
# pyenv DOES NOT behave well with standard virtualenv so 
# this is a better way to do it IMO
#!!!
pip install virtualenv
pip install virtualenvwrapper

brew install pyenv pyenv-virtualenv
brew install pyenv-virtualenvwrapper

pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION

####
## Switch the shell verison with
# > pyenv shell 3.8.0
#
## My venv workflow is to set the shell, then create the environment
# > pyenv shell <version> && mkvirtualenv <project>
####

# Install gotop for system monitoring
brew tap cjbassi/gotop
brew install gotop

# Install neofetch for system overview
brew install neofetch

# Install GoLang
brew install go

go get golang.org/x/tools/cmd/godoc
go get github.com/golang/lint/golint
go get golang.org/x/tools/gopls@latest


# Install ngrok
brew cask install ngrok

# Install jdk
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk$JAVA_VERSION

# Install maven
brew install maven

# Install visual studio code
brew cask install visual-studio-code

# Install IntelliJ
brew cask install intellij-idea-ce

# Install PyCharm
brew cask install pycharm-ce

# Install iTerm
brew cask install iterm2

# Install slack
brew cask install slack

# Install chrome
brew cask install google-chrome

# Install chromedriver 
brew cask install chromedriver

# Install mysql workbench
brew cask install mysqlworkbench

# Install postman
brew cask install postman

open -a iTerm

exit
