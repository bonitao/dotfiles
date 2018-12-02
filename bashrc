if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi


export EDITOR=vim
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"
export EDITOR=vim
