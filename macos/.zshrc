export ZSH="/Users/sepps/.oh-my-zsh"

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

## nvm Config
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

## Java config
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/

## GoLang config
export GOPATH=$HOME/go

## pyenv initialization
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

## Environment variable necessary for packages
export CFLAGS="-I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/readline/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include $CFLAGS"
export CPPFLAGS="-I/usr/local/opt/zlip/include"
export LDFLAGS="-I/usr/local/opt/openssl@1.1/lib -L$/usr/local/opt/readline/lib -L/usr/local/opt/zlip/lib -L$/usr/local/opt/bzip2/lib $LDFLAGS"

export PATH
