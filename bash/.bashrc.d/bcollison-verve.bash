alias atoj='java -jar /usr/local/avro/avro-tools.jar tojson $1'

alias urldecode='python -c "import sys, urllib as ul; \
    print ul.unquote_plus(sys.argv[1])"'

alias urlencode='python -c "import sys, urllib as ul; \
    print ul.quote_plus(sys.argv[1])"'

export EDITOR=/usr/bin/vi

export QUOTING_STYLE=literal

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

GIT_PROMPT_ONLY_IN_REPO=1
source $DIR/.bash-git-prompt/gitprompt.sh
