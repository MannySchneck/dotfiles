# path
PATH="/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Library/TeX/texbin"
PATH="/usr/local/bin:/Users/manny/miniconda2/bin:$PATH"

# prompt
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"
PS1="${YELLOW}\u@\h:\w> ${RESET}"

# Aliases
UBUNTUIP="192.168.196.138"
alias gg='git log --oneline --abbrev-commit --branches=* --graph --decorate --color'
alias ubuntubox="ssh manny@${UBUNTUIP}"
alias labbox="ssh sms324@freeze.eecs.northwestern.edu"
alias ls="ls -Gp"
alias stack="cat ~/stack"

edbash(){
vim ~/.bash_profile
source ~/.bash_profile
}
