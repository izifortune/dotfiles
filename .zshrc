# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
zmodload zsh/zprof # top of your .zshrc file

# Path to your oh-my-zsh installation.
export ZSH="/Users/forunatof/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"


plugins=(git brew vi-mode fzf)

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
alias v=nvim

function toggle_proxy {
  if [ -z "$http_proxy" ]; then
    echo "setting up proxy"
    export http_proxy='http://internalproxy.corp.ryanair.com:3128'
    export https_proxy='http://internalproxy.corp.ryanair.com:3128'
    export HTTP_PROXY='http://internalproxy.corp.ryanair.com:3128'
    export HTTPS_PROXY='http://internalproxy.corp.ryanair.com:3128'
  else
    echo "removing up proxy"
    export http_proxy=''
    export https_proxy=''
    export HTTP_PROXY=''
    export HTTPS_PROXY=''
  fi
}

function lambdaVersion {
  aws lambda list-versions-by-function --function-name $1 --region us-east-1 --query 'Versions[-1]' --output json | jq
}

function stackStatus {
  aws cloudformation describe-stacks --stack-name $1 --query 'Stacks[0].StackStatus' --output text
}

function stackStatusDetail {
  aws cloudformation describe-stacks --stack-name $1 --query 'Stacks' --output text
}

function stackOutputs {
  aws cloudformation describe-stacks --stack-name $1 --query 'Stacks[0].Outputs' --output text
}

function pipelineStatus {
  aws codepipeline get-pipeline-state --name $1 --output text
}

alias define='googler -n 2 define'
alias g='googler -n 5 '

if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi
export VISUAL=nvim

prompt_dir() {
  prompt_segment blue black '%c'
}

prompt_context() {}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias sonarrun=docker run -d --name sonarqube -p 9000:9000 sonarqube:latest
alias ggpushpr='git push origin (current_branch) 2>&1 | grep "https://s" | sed "s/[^ ]* *//" | pbcopy'
alias lg='lazygit'

autoload -U compinit; compinit

eval "$(zoxide init zsh)"


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

sh "$HOME/.config/base16-shell/scripts/base16-gruvbox-dark-medium.sh"

# zscaler
export NODE_EXTRA_CA_CERTS=~/zscaler.pem
export AWS_CA_BUNDLE=~/zscaler.pem


# lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# fd

alias find='fd'

alias du='dust'
alias df='duf'

export LG_CONFIG_FILE='/Users/forunatof/.config/lazygit/config.yml'

function yarnlogin() {
  aws codeartifact login --tool npm --repository ryanair_npm_registry --domain ryanair-com --domain-owner 346350922581 --namespace @ryanair;
  export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain ryanair-com --domain-owner 346350922581 --query authorizationToken --output text`
  yarn config set --home npmScopes.ryanair.npmAuthToken $CODEARTIFACT_AUTH_TOKEN
  npm config set //ryanair-com-346350922581.d.codeartifact.eu-west-1.amazonaws.com/npm/ryanair_npm_registry/:_authToken=$CODEARTIFACT_AUTH_TOKEN
}

function npmReg() {
  sed -i '' 's/\(registry=\).*/\1https:\/\/registry\.npmjs\.org/g' ~/.npmrc
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
alias watch="fswatch -o ./ | xargs -n1 -I{} plantuml ${1}"
alias mdrender='pandoc --from markdown --to html | textutil -convert rtf -stdin -stdout -format html | pbcopy -Prefer rtf'
alias b='buku --suggest'
alias blist='buku --colors oKlxm -p'
export BUKU_CA_CERTS=~/zscaler.pem
function squashcommits() {
  GIT_SEQUENCE_EDITOR=: git rebase $1 --autosquash --interactive;
  GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)";
}
export PATH=$PATH:~/code/ltex-ls-15.2.0/bin/
export ZK_NOTEBOOK_DIR=~/code/knowledge/content/zettelkasten

# fnm
export PATH=/Users/forunatof/.fnm:$PATH
# eval "`fnm env`"
alias jest-inspect='node --inspect $(yarn bin jest) --runInBand --silent --watch'
# eval "$(fnm env --use-on-cd)"
alias cdk='cdk --profile $AWS_PROFILE'

function awsall {
  export AWS_PAGER=""
  for i in `aws ec2 describe-regions --query "Regions[].{Name:RegionName}" --output text|sort -r`
  do
  echo "------"
  echo $i
  echo "------"
  echo -e "\n"
  if [ `echo "$@"|grep -i '\-\-region'|wc -l` -eq 1 ]
  then
      echo "You cannot use --region flag while using awsall"
      break
  fi
  aws $@ --region $i
  sleep 2
  done
  trap "break" INT TERM
}

export NO_PROXY=.amazon.com,.amazonaws.com,jira.ryanair.com,stash.ryanair.com
export SSL_CERT_FILE=~/zscaler.pem
export SSL_CERT_DIR=~/
export ca_certificate=~/zscaler.pem
export CURL_CA_BUNDLE=~/zscaler.pem
export http_proxy='http://internalproxy.corp.ryanair.com:3128'
export https_proxy='http://internalproxy.corp.ryanair.com:3128'
export HTTP_PROXY='http://internalproxy.corp.ryanair.com:3128'
export HTTPS_PROXY='http://internalproxy.corp.ryanair.com:3128'

export AWS_PAGER=""

# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Load Angular CLI autocompletion.
LOCAL_RC=$HOME/.zshrc_local
test -f $LOCAL_RC && source $LOCAL_RC

alias start="rcli start"
alias commit="rcli commit"

export PATH="/usr/local/sbin:$PATH"

eval "$(fnm env --use-on-cd)"

alias imageCompress="magick -strip -interlace Plane -gaussian-blur 0.05 -quality 85%"

zprof > /tmp/foo
