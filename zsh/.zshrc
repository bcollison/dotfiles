# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
#if [ "$(uname 2> /dev/null)" != "Linux" ]; then
#   export ZSH="/Users/briancollison/.oh-my-zsh"
#fi


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mira"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
#
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#plugins=(zsh-z git git-prompt jenv docker docker-compose mvn golang gcloud zsh-autosuggestions)
#plugins=(z git jenv mvn zsh-autosuggestions)

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  plugins=(z git jenv mvn zsh-autosuggestions)
else
  plugins=(zsh-z git git-prompt jenv docker docker-compose mvn golang gcloud zsh-autosuggestions)
fi

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  if [ -d /usr/local/share/zsh-syntax-highlighting ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
else   
   source ~/.zshrc.d/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi 
# source ~/.zshrc.d/work.zsh.private
export SBT_HOME=/usr/local/sbt
export PATH=$SBT_HOME/bin:$PATH


export JENV_HOME="$HOME/.jenv"
export PATH="$JENV_HOME/bin:$PATH"


eval "$(jenv init -)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH"

# overriding mira theme-- they should probably use prefix/suffix like others
local jenv_java='%{$fg[blue]%}‹java:$(jenv_prompt_info)›%{$reset_color%}'

# using mira theme-- adding in date/time
# provided:
#  PROMPT="╭─${user_host} ${current_dir} ${nvm_node} ${rvm_ruby} ${jenv_java} ${git_branch}
#  ╰─%B$%b "
export PROMPT="╭─${user_host} ${current_dir} ${rvm_ruby} ${jenv_java} 
╰─ %D{%H:%M} %B$%b "

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
   export RPROMPT='$(git_super_status)'
fi

export ZSH_HIGHLIGHT_STYLES[comment]='none'

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
   . /usr/local/opt/asdf/asdf.sh
if [ -d /usr/local/Caskroom/google-cloud-sdk/ ]; then
   source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
   source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi
else
   . $HOME/.asdf/asdf.sh
fi

alias history-without-id="history | cut -c 8-"

alias week="gcalcli calw"

export RAKEN_HOME="/Users/brian.collison/projects"

export PATH="/usr/local/opt/mysql-client/bin:$PATH"

export PATH="/Users/brian.collison/bin:$PATH"

export CHARLES_HOME="/Applications/Charles.app/Contents/MacOS"

export PATH="$CHARLES_HOME:$PATH"

alias ch="Charles -headless"

