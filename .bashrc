# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f $HOME/.bashrc.local ]; then
   . $HOME/.bashrc.local
fi

if [ "$(uname)" == "Darwin" ]; then
	export PATH=/opt/homebrew/bin:$PATH
fi
command -v pkgx >/dev/null && eval "$(pkgx integrate)"

export EDITOR=nvim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
if ((BASH_VERSINFO[0] > 4)); then
  # https://github.com/JanDeDobbeleer/oh-my-posh/issues/3430
	eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/agnoster.omp.json | sed 's|\[\[ -v MC_SID \]\]|[[ -n "$MC_SID" ]]|')"
fi
which lsd >/dev/null 2>&1 && alias ls='lsd'
