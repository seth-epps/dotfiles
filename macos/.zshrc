export ZSH="$HOME/.oh-my-zsh"

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

## fnm Config
eval "$(fnm env)"

## Java config
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/

## GoLang config
export GOPATH=$HOME/go

## pyenv initialization
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

## k8s auto-completes
source <(kubectl completion zsh)

## Environment variable necessary for packages
export CFLAGS="-I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/readline/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include $CFLAGS"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib -L$/usr/local/opt/readline/lib -L/usr/local/opt/zlib/lib -L$/usr/local/opt/bzip2/lib $LDFLAGS"

export PATH
