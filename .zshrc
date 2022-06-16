#
autoload -U colors && colors

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt autocd extendedglob notify
unsetopt beep
bindkey -v
KEYTIMEOUT=1
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/manny/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#

## read custom files
for config_file in /home/manny/.zsh.d/*;
do . "$config_file"
done

export PATH="$PATH:$HOME/go/bin"

export EDITOR=nvim

# Config that doesn't go in its own file (yet?).
alias pbcopy='xclip -selection clipboard'

alias n='nvim'
alias szsh='. ~/.zshrc'
alias newtil='nvim ~/.zsh.d'

## Apps
alias ff='firefox & disown'
alias gcr='google-chrome-stable & disown'
alias spt='spotify & disown'

PS1="%{$fg[blue]%}%n%{$reset_color%}|%{$fg[green]%}%2d%{$reset_color%}> "

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH=$PATH:/home/manny/.gem/ruby/3.0.0/bin

# SSH agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
    ssh-add ~/.ssh/id_ed25519
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# FZF
export FZF_DEFAULT_COMMAND='fd -E .git -H --type f'
export FZF_CTRL_T_COMMAND='fd'

