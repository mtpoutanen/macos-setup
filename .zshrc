# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval $(/opt/homebrew/bin/brew shellenv)

# Path to your oh-my-zsh installation.
export ZSH=/Users/m.poutanen/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/Library/apache-maven-3.6.2/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/bin"
export LD_LIBRARY_PATH="$HOME/lib"
export DYLD_LIBRARY_PATH="$HOME/lib"

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
# ENABLE_CORRECTION="true"

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

plugins=(git vi-mode zsh-nvm zsh-better-npm-completion)

source $ZSH/oh-my-zsh.sh

# Automatically change version on nvm
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8



# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias hgr="history | grep"
alias studio="open -a /Applications/Android\ Studio.app"
alias stree='open -a SourceTree'

# Yonoton SSH tunnel commands
alias mariadb_test_tunnel="ssh -L 3308:mariadbtest.cfhouuq82e5s.eu-west-1.rds.amazonaws.com:3306 -L 3309:mariadbtest-2019-02-14-02-30-snapped.cfhouuq82e5s.eu-west-1.rds.amazonaws.com:3306 ec2-user@ec2-34-254-158-53.eu-west-1.compute.amazonaws.com"

# Git aliases

alias gch="git checkout"
# Delete all merged branches
alias gdelm="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"

git_delete_rebased() {
  for branch in $(git branch | grep -v 'dev$' | grep -v 'master$'); do
    last_commit_msg="$(git log --oneline --format=%f -1 $branch)"
    if [[ "$(git log --oneline --format=%f | grep $last_commit_msg | wc -l)" -eq 1 ]]; then
        git branch -D $branch
        echo "git branch -D $branch"
    fi
  done
}

rndebugger() {
  open "rndebugger://set-debugger-loc?host=localhost&port=8081"
}

usejavaversion() {
  arg1=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v $arg1)
}

export JAVA_HOME=$(/usr/libexec/java_home -v 11)

ios_simulator_start_recording() {
	local fileName=$1

	if [ -z $fileName ];
	then
	  fileName="myvideo.mov"
	fi

	xcrun simctl io booted recordVideo $fileName
}

open_debug_menu_react_native() {
  adb shell input keyevent 82
}

export WORKON_HOME="~/.venv/"


# export ANDROID_SDK_HOME="/usr/local/Caskroom/android-sdk/3859397,26.0.1/"
# export ANDROID_SDK_ROOT="/Users/m.poutanen/Library/Android/sdk"
# export ANDROID_AVD_HOME="/Users/m.poutanen/.android/avd"
# export ANDROID_HOME="/Users/m.poutanen/Library/Android/sdk"
# export PATH=$PATH:/Users/m.poutanen/Library/Android/sdk/platform-tools
# export PATH=$PATH:/Users/m.poutanen/Library/Android/sdk/emulator
# export PATH=$PATH:/Users/m.poutanen/Library/Android/sdk/tools

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH=$PATH:$JAVA_HOME/bin

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export PATH="/usr/local/opt/gettext/bin:$PATH"
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(fasd --init auto)"

chrome () {
    open -a "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
}

# eval "$(rbenv init -)"
# eval "$(pyenv init -)"

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # load rvm

# Aliases and shortcuts
[ -f "/Users/m.poutanen/.ghcup/env" ] && source "/Users/m.poutanen/.ghcup/env" # ghcup-env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# export PATH=/opt/homebrew/bin:/usr/local/opt/gettext/bin:/Users/m.poutanen/.pyenv/bin:/usr/local/opt/gettext/bin:/Users/m.poutanen/.pyenv/bin:/usr/local/opt/gettext/bin:/Users/m.poutanen/.pyenv/bin:/usr/local/opt/gettext/bin:/Users/m.poutanen/.pyenv/bin:/Users/m.poutanen/.nvm/versions/node/v18.12.1/bin:/usr/local/opt/gettext/bin:/Users/m.poutanen/.pyenv/bin:/usr/local/opt/gettext/bin:/Users/m.poutanen/.pyenv/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Users/m.poutanen/.local/bin:/Users/m.poutanen/.rvm/bin:/Users/m.poutanen/Library/apache-maven-3.6.2/bin:/Users/m.poutanen/Library/Android/sdk/platform-tools:/Users/m.poutanen/Library/Android/sdk/emulator:/Users/m.poutanen/Library/Android/sdk/tools:/bin:/Users/m.poutanen/.local/bin:/Users/m.poutanen/.rvm/bin:/Users/m.poutanen/Library/apache-maven-3.6.2/bin:/Users/m.poutanen/Library/Android/sdk/platform-tools:/Users/m.poutanen/Library/Android/sdk/emulator:/Users/m.poutanen/Library/Android/sdk/tools:/bin:/Users/m.poutanen/.local/bin:/Users/m.poutanen/.rvm/bin:/Users/m.poutanen/Library/apache-maven-3.6.2/bin:/Users/m.poutanen/Library/Android/sdk/platform-tools:/Users/m.poutanen/Library/Android/sdk/emulator:/Users/m.poutanen/Library/Android/sdk/tools:/bin:/Users/m.poutanen/.local/bin:/Users/m.poutanen/.rvm/bin:/Users/m.poutanen/Library/apache-maven-3.6.2/bin:/Users/m.poutanen/Library/Android/sdk/platform-tools:/Users/m.poutanen/Library/Android/sdk/emulator:/Users/m.poutanen/Library/Android/sdk/tools:/bin:/Users/m.poutanen/.local/bin:/Users/m.poutanen/.rvm/bin:/Users/m.poutanen/Library/apache-maven-3.6.2/bin:/Users/m.poutanen/Library/Android/sdk/platform-tools:/Users/m.poutanen/Library/Android/sdk/emulator:/Users/m.poutanen/Library/Android/sdk/tools:/bin:/Users/m.poutanen/.local/bin:/Users/m.poutanen/.rvm/bin:/Users/m.poutanen/Library/apache-maven-3.6.2/bin:/Users/m.poutanen/Library/Android/sdk/platform-tools:/Users/m.poutanen/Library/Android/sdk/emulator:/Users/m.poutanen/Library/Android/sdk/tools:/bin
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

