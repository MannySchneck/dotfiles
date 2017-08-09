# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/Users/mannyschneck/Library/Python/2.7/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/mannyschneck/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sshagent docker)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

e () {
    emacsclient $1 -c &
}


alias clonephenix='git clone ssh://manny@gerrit.phenixp2p.com:29418/phenix'
alias cloneplatform='git clone ssh://manny@gerrit.phenixp2p.com:29418/platform'
alias clonewebsdk='git clone ssh://manny@gerrit.phenixp2p.com:29418/WebSDK'

alias build_platform='npm run grunt && npm run protobuf && NODE_ENV=development SERVER_APP=all-in-one npm start'
alias run_platform='NODE_ENV=development SERVER_APP=all-in-one npm start'
alias run_websdk="PHENIX_HTTPS_PFX=../platform/config/default/server.pfx PHENIX_HTTPS_PASSPHRASE=CorpyekGaf4 npm start"

alias buildpeer="scripts/build.sh -m Peer -g Ninja -b Debug"
alias configpeer="scripts/configure.sh -m Peer -g Ninja -b Debug"

alias pingme="terminal-notifier -sound default -message"

alias tb="scripts/ci-trigger-build.sh -u manny -c"

alias gg="git log --oneline --abbrev-commit --branches=* HEAD --graph --decorate --color --simplify-by-decoration"

alias gup="git-review -u && terminal-notifier -sound default -message \"Uploaded changes to gerrit\" || terminal-notifier -sound default -message \"Oh no. Something went wrong. No gerrit upload for you\""

alias gupy="git-review -u -y && terminal-notifier -sound default -message \"Uploaded changes to gerrit\" || terminal-notifier -sound default -message \"Oh no. Something went wrong. No gerrit upload for you\""

alias sdkclilocal="./SdkCliExe --pcast-uri wss://local.phenixp2p.com:8443"


export NVM_DIR="/Users/mannyschneck/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NACL_SDK_HOME=/Users/mannyschneck/bin/nacl_sdk
export ANDROID_NDK_HOME=/Users/mannyschneck/bin/android-ndk-r14
export ANDROID_SDK_HOME=/Users/mannyschneck/bin/android-sdk-macosx
export NACL_SDK_HOME=/Users/mannyschneck/bin/nacl_sdk
export ANDROID_NDK_HOME=/Users/mannyschneck/bin/android-ndk-r14
export ANDROID_SDK_HOME=/Users/mannyschneck/bin/android-sdk-macosx

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mannyschneck/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mannyschneck/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mannyschneck/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mannyschneck/google-cloud-sdk/completion.zsh.inc'; fi
