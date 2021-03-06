#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
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
