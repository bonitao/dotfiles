#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export DEFAULT_USER=davi
bindkey -s "\C-j" " 2>&1|less\C-m"
setopt inc_append_history
#source ${ZDOTDIR:-$HOME}/.zsh/git-prompt/zshrc.sh
export REPORTTIME=2
setopt prompt_subst
#local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"
#if [ $SSH_CONNECTION ]; then SSH="%n@%m "; else SSH=""; fi
#PROMPT='$SSH%4(c:$(pwd | sed -e "s#^$HOME#~#" | sed -e "s#\([^/]\)[^/]*/#\1/#g"):%3c) %# '
#RPROMPT='$(git_super_status) ${smiley}'

