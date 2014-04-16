[ -n "$PS1" ] && source ~/.bash_profile

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

export GOPATH=$HOME/go/

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
