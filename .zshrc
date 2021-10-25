HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt autocd extendedglob nomatch notify pipefail beep
bindkey -e

autoload -U compinit colors
compinit
colors

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

function powerline_precmd() {
    eval "$(/usr/bin/powerline-go -error $? -shell zsh -eval -modules venv,user,host,ssh,cwd,docker,perms,git,hg,jobs,exit,root,vgo)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# Load seperated config files
for conf in "$HOME/.config/zsh/"*.zsh; do
  source "${conf}"
done
unset conf

#if [ -n "$DESKTOP_SESSION" ];then
#    eval $(gnome-keyring-daemon --start)
#    export SSH_AUTH_SOCK
#fi

# Disable close button for GTK apps
# gsettings set org.gnome.desktop.wm.preferences button-layout :

alias ls='ls -hp --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export EDITOR=nano
