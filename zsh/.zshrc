# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
#if [ "$(uname 2> /dev/null)" != "Linux" ]; then
#   export ZSH="/Users/briancollison/.oh-my-zsh"
#fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
 autoload -Uz compinit
  compinit
fi

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
#plugins=(z git git-prompt jenv mvn zsh-autosuggestions)

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  plugins=(z git jenv mvn zsh-autosuggestions alias-finder gradle-completion)
else
  plugins=(zsh-z git git-prompt jenv docker docker-compose mvn golang gcloud zsh-autosuggestions alias-finder gradle-completion)
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

if [ -f ~/.zshrc.d/work.zsh.private ]; then
  source ~/.zshrc.d/work.zsh.private
fi

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
export PROMPT="╭─${user_host} ${current_dir} ${jenv_java} ${git_branch}
╰─ %D{%H:%M} %B$%b "

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
   export RPROMPT='$(git_super_status)'
fi

#export ZSH_HIGHLIGHT_STYLES[comment]='none'

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
   . /opt/homebrew/opt/asdf/libexec/asdf.sh 
if [ -d /usr/local/Caskroom/google-cloud-sdk/ ]; then
   source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
   source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi
else
   . $HOME/.asdf/asdf.sh
fi

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi

alias history-without-id="history | cut -c 8-"

alias week="gcalcli calw"

export RAKEN_HOME="/Users/brian.collison/projects"

export PATH="/usr/local/opt/mysql-client/bin:$PATH"

export PATH="/Users/brian.collison/bin:$PATH"

export CHARLES_HOME="/Applications/Charles.app/Contents/MacOS"

export PATH="$CHARLES_HOME:$PATH"

alias ch="Charles -headless"

export LESS="--no-init --quit-if-one-screen -R"

eval "$(fakedata --completion zsh)"

############################################################################
#                                                                          #
#               ------- Useful Docker Aliases --------                     #
#                                                                          #
#     # Installation :                                                     #
#     copy/paste these lines into your .bashrc or .zshrc file or just      #
#     type the following in your current shell to try it out:              #
#     wget -O - https://gist.githubusercontent.com/jgrodziski/9ed4a17709baad10dbcd4530b60dfcbb/raw/d84ef1741c59e7ab07fb055a70df1830584c6c18/docker-aliases.sh | bash
#                                                                          #
#     # Usage:                                                             #
#dalias     daws <svc> <cmd> <opts> : aws cli in docker with <svc> <cmd> <opts>  #
#dalias     dc             : docker-compose                                      #
#dalias     dcu            : docker-compose up -d                                #
#dalias     dcd            : docker-compose down                                 #
#dalias     dcr            : docker-compose run                                  #
#dalias     dex <container>: execute a bash shell inside the RUNNING <container> #
#dalias     di <container> : docker inspect <container>                          #
#dalias     dim            : docker images                                       #
#dalias     dip            : IP addresses of all running containers              #
#dalias     dl <container> : docker logs -f <container>                          #
#dalias     dnames         : names of all running containers                     #
#dalias     dps            : docker ps                                           #
#dalias     dpsa           : docker ps -a                                        #
#dalias     drmc           : remove all exited containers                        #
#dalias     drmid          : remove all dangling images                          #
#dalias     drun <image>   : execute a bash shell in NEW container from <image>  #
#dalias     dsr <container>: stop then remove <container>                        #
#                                                                          #
############################################################################

function dnames-fn {
	for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
	do
    	docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}

function dip-fn {
    echo "IP addresses of all named running containers"

    for DOC in `dnames-fn`
    do
        IP=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' "$DOC"`
        OUT+=$DOC'\t'$IP'\n'
    done
    echo -e $OUT | column -t
    unset OUT
}

function dex-fn {
	docker exec -it $1 ${2:-bash}
}

function di-fn {
	docker inspect $1
}

function dl-fn {
	docker logs -f $1
}

function drun-fn {
	docker run -it $1 $2
}

function dcr-fn {
	docker-compose run $@
}

function dsr-fn {
	docker stop $1;docker rm $1
}

function drmc-fn {
       docker rm $(docker ps --all -q -f status=exited)
}

function drmid-fn {
       imgs=$(docker images -q -f dangling=true)
       [ ! -z "$imgs" ] && docker rmi "$imgs" || echo "no dangling images."
}

# in order to do things like dex $(dlab label) sh
function dlab {
       docker ps --filter="label=$1" --format="{{.ID}}"
}

function dc-fn {
        docker-compose $*
}

function d-aws-cli-fn {
    docker run \
           -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
           -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
           -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
           amazon/aws-cli:latest $1 $2 $3
}

function dtop-fn {
  docker stats --format "table {{.Container}}\t{{.Name}}\t{{.CPUPerc}}  {{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}"
}

function dstats-fn {
  docker stats --no-stream;
}

alias daws=d-aws-cli-fn
alias dc=dc-fn
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcr=dcr-fn
alias dex=dex-fn
alias di=di-fn
alias dim="docker images"
alias dip=dip-fn
alias dl=dl-fn
alias dnames=dnames-fn
alias dps="docker ps"
alias dpsa="docker ps -a"
alias drmc=drmc-fn
alias drmid=drmid-fn
alias drun=drun-fn
alias dsp="docker system --all"
alias dsr=dsr-fn
alias dtop=dtop-fn
alias dstats=dstats-fn
alias dsa="docker stop $(docker ps -a -q)"
alias dser="docker service"
alias dvol="docker volumne"
alias dm="docker-machine"
alias dmx="docker-machine ssh"
alias daliases="grep dalias ~/.zshrc | grep -v '^alias' | sed s/dalias//g"

fastfetch

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
 autoload -Uz compinit
  compinit
fi

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
