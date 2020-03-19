export ZSH="/Users/sepps/.oh-my-zsh"

ZSH_THEME="spaceship"
SPACESHIP_CHAR_SYMBOL="❯ "

# If using pure, you need to initialize the prompt
fpath+=("$ZSH/custom/functions/pure")
autoload -U promptinit; promptinit
prompt pure

plugins=(
  git zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

## This ammendment to path is to support the homebrew unversioned symlinks to
## its python installation
HOMEBREW_PYTHON_BIN=/usr/local/opt/python/libexec/bin
PATH=$HOMEBREW_PYTHON_BIN:$PATH

# This ammendment to path is to support homebrew installed binaries
PATH=/usr/local/bin:/usr/local/sbin:$PATH

## Support opening vscode from terminal via `code` command
PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
export PATH

## nvm Config
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

## Java config
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/

## GoLang config
export GOPATH=$HOME/go

## pyenv initialization
eval "$(pyenv init -)"

## start virtualenv initialization >>>>
#
# We want to use the homebrew installed virtualenv because pyenv does not play nice with virtualenv

export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$HOMEBREW_PYTHON_BIN/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# Use this method to update the shell and 
# setup the virtualenvwrapper to work with
# pyenv
pyshell-venv() {
  pyenv shell $1
  pyenv virtualenvwrapper
}

## end virutalenv initialize <<<<

## Environment variable necessary for packages
export PIP_INDEX_URL=https://devpi.corp.surveymonkey.com/monkey/monkey
export CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include $CFLAGS"
export LDFLAGS="-I$(brew --prefix openssl)/include -L$(brew --prefix openssl)/lib $LDFLAGS"

