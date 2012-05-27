if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

export EDITOR=vim
export PATH=$PATH:$HOME/.dotbin
alias tmux="TERM=screen-256color-bce tmux"
MACVIM="/Applications/MacVim.app/Contents/MacOS/Vim"
if test -e $MACVIM; then
  alias vim=$MACVIM
  alias vi=$MACVIM
fi

if [ -f $HOME/.bashrc.local ]; then
   . $HOME/.bashrc.local
fi
