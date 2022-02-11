# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# NODE
export PATH=$HOME/bin:/.npm-packages/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
# helper for automatic node version switch besed on .nvmrc files
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# ZSH
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
export ZSH="/Users/adamclark/.oh-my-zsh"


# aliases
alias lock="pmset displaysleepnow"
alias nnvm="node -v > .nvmrc"
alias pbcopy='cat ~/.ssh/id_rsa.pub'
alias awscreds='cat ~/.aws/credentials'
alias ws='webstorm'
alias ozrc='ws  ~/.zshrc '
alias reload="source ~/.zshrc"
alias pyserver='python -m SimpleHTTPServer'
alias shrug='echo "¯\\_(ツ)_/¯"'
alias getIP='ipconfig getifaddr en0'
alias showNodeProcess='sudo ps aux | grep nodejs'
# git aliases
alias git=hub
alias fetch='git fetch'
alias commit='git commit -m'
alias pull='git pull'
alias push='git push'
alias stash='git stash'
alias pd='git fetch && git pull origin develop'
alias add='git add .'
alias dlb='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

# functions

# generate a new key
key() {
  echo "enter keyname:"
  read kname
  ssh-keygen -t rsa -b 4096 -C "$kname" -f /Users/adamclark/.ssh/"$kname" -N ""
}

# push new branch; set upstream to origin
function pnb {
  branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
  git push --set-upstream origin $branch
}

# commit git message prfixed w/ branch EX: cm 'first commit' => 'master first commit'
function cm {
    branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
    git add .
    git commit -m "${branch} $1"
}

# kill port EX: kp 3000
function kp() {
  kill -9 `lsof -n -i4TCP:$1 | grep LISTEN | awk '{ print $2; }'`
}

# new nest directory
nnDir() {
  nest g module $1 &&
  nest g controller $1 &&
  nest g service $1 &&
  touch src/$1/$1.entity.ts &&
  touch src/$1/$1.dto.ts
}

# new component directory
function ncd() {
  mkdir $1 &&
  touch $1/index.ts &&
  touch $1/README.md &&
  touch $1/$1.tsx &&
}

# BrightAI
export NODE_AUTH_TOKEN='TOKEN_STRING_HERE'


# ZSH DOCS
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
