# path
PATH="/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Library/TeX/texbin"
PATH="/usr/local/opt/llvm/bin:/usr/local/bin:/Users/manny/miniconda2/bin:$PATH"

# go config
export GOPATH=$HOME/345/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GOROOT=/usr/local/opt/go/libexec


# prompt
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"
PS1="${YELLOW}\u@\h:\w> ${RESET}"

# Aliases
UBUNTUIP="192.168.196.138"
## git
alias gg='git log --oneline --abbrev-commit --branches=* --graph --decorate --color'
## hosts
alias ubuntubox="ssh manny@${UBUNTUIP}"
alias wlab="ssh sms324@freeze.eecs.northwestern.edu"
alias tlab="ssh sms324@tlab-01.eecs.northwestern.edu"
alias hanlon="ssh sms324@hanlon.wot.eecs.northwestern.edu"
## redefinitions
alias ls="ls -Gp"
alias e="nohup emacsclient -c"
alias et="nohup emacsclient -nw"


edbash(){
vim ~/.bash_profile
source ~/.bash_profile
}

export PATH="$HOME/.cargo/bin:$PATH"
if [ -e /Users/mannyschneck/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/mannyschneck/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
