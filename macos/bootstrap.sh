#!/bin/bash
set -e

mkdir -p $HOME/dev

if [ "$1" ] && [ "$2" ]
then
    # setup git-config
    job_workspace=$1
    job_email=$2

    echo "Setting up $job_workspace with email $job_email"

    mkdir -p $HOME/dev/$job_workspace

    sed -e "s/\${JOB_EMAIL}/$job_email/g" .gitconfig-job.tpl > $HOME/.gitconfig-$job_workspace
    sed -e "s/\${JOB_WORKSPACE}/$job_workspace/g" .gitconfig.tpl > $HOME/.gitconfig
fi

PYTHON_VERSION=3.9.7
NODE_VERSION=16

# Install brew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# temporarily set PATH for homebrew binaries
PATH=/opt/homebrew/bin:/opt/homebrew/opt/python/libexec/bin:$PATH

# Install wget
brew install wget

# Install jq / yq
brew install jq
brew install yq

# Install zsh
brew install zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -s --unattended && echo "Install complete!"

# Add dotfiles to home
sed -e "s/\${BREW_PREFIX}/$(brew --prefix | sed 's/\//\\\//g')/g" .zshrc.tpl > $HOME/.zshrc
cp .vimrc $HOME
cp .p10k.zsh $HOME

# Install fonts (requires minimum curl version 7.73.0)
wget -P ${HOME}/Library/Fonts "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
wget -P ${HOME}/Library/Fonts "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
wget -P ${HOME}/Library/Fonts "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
wget -P ${HOME}/Library/Fonts "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"

# Install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install powerlevel zsh theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

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

# Install bash completion for k8s shortcuts 
brew install bash-completion

# Install python
brew install python
brew install pipx

#!!!
# pyenv DOES NOT behave well with standard virtualenv so 
# this is a better way to do it IMO
#!!!
pipx install virtualenv

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

# Install GoLang
brew install go

go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest

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

# Install rancher desktop
brew install --cask rancher

# Install docker cli and compose plugin
brew install docker docker-compose docker-buildx
mkdir -p ~/.docker/cli-plugins
ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
ln -sfn $(brew --prefix)/opt/docker-buildx/bin/docker-buildx ~/.docker/cli-plugins/docker-buildx

# Install lima and colima for docker 
brew install lima colima

# Install kubectl
brew install kubectl

# copy iterm configs
cp com.googlecode.iterm2.plist $HOME/Library/Preferences/

open -a iTerm

exit
