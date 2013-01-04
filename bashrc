if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi


export EDITOR=vim
alias vo="vim --servername davim --remote"
alias vi="vim --servername davim"
alias vim="vim --servername davim"
MACVIM=/Applications/MacVim.app/Contents/MacOS/Vim
if [ -f $MACVIM ]; then
   EDITOR=$MACVIM
  alias vim=$MACVIM
  alias vi=$MACVIM
  alias vo="$MACVIM --servername VIM --remote"
fi

export PATH=$PATH:$HOME/.dotbin:/usr/local/homebrew/bin
alias tmux="TERM=screen-256color-bce tmux"

# History stuff
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "
shopt -s cmdhist
shopt -s histappend

if [[ $- = "*i*" ]]; then
  . /etc/bash_completion
fi

if [ -f $HOME/.bashrc.local ]; then
   . $HOME/.bashrc.local
fi
