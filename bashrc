export EDITOR=vim
export PATH=$PATH:$HOME/.dotbin:/usr/local/homebrew/bin
alias tmux="TERM=screen-256color-bce tmux"
MACVIM="/Applications/MacVim.app/Contents/MacOS/Vim"
if test -e $MACVIM; then
  alias vim=$MACVIM
  alias vi=$MACVIM
fi

# History stuff
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "
shopt -s cmdhist
shopt -s histappend
