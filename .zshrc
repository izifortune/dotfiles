# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/fortunatof/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"


plugins=(git brew httpie vi-mode fzf z)

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
  aws lambda list-versions-by-function --function-name $1 --region us-east-1 --query 'Versions[-1].Version' --output text
}

function stackStatus {
  aws cloudformation describe-stacks --stack-name $1 --query 'Stacks[0].StackStatus' --output text
}

function stackOutputs {
  aws cloudformation describe-stacks --stack-name $1 --query 'Stacks[0].Outputs' --output text
}

alias define='googler -n 2 define'
alias g='googler -n 5 '

if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi
export VISUAL=nvim

prompt_dir() {
  prompt_segment blue black '%c'
}

prompt_context() {}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/fortunatof/code/homepage.ryanair.com/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/fortunatof/code/homepage.ryanair.com/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/fortunatof/code/homepage.ryanair.com/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/fortunatof/code/homepage.ryanair.com/node_modules/tabtab/.completions/sls.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias sonarrun=docker run -d --name sonarqube -p 9000:9000 sonarqube:latest
alias ggpushpr='git push origin (current_branch) 2>&1 | grep "https://s" | sed "s/[^ ]* *//" | pbcopy'
alias lg='lazygit'

autoload -U compinit; compinit


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

sh .config/base16-shell/scripts/base16-gruvbox-dark-medium.sh

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

export LG_CONFIG_FILE='/Users/fortunatof/.config/lazygit/config.yml'

function yarnlogin() {
  aws codeartifact login --tool npm --repository ryanair_npm_registry --domain ryanair-com --domain-owner 346350922581 --namespace @ryanair;
  export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain ryanair-com --domain-owner 346350922581 --query authorizationToken --output text`
  yarn config set --home npmScopes.ryanair.npmAuthToken $CODEARTIFACT_AUTH_TOKEN
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
export PATH=/Users/fortunatof/.fnm:$PATH
eval "`fnm env`"
alias jest-inspect='yarn node --inspect $(yarn bin jest) --runInBand --silent --watch'
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

export NO_PROXY=.amazon.com,.amazonaws.com,.ryanair.com
export SSL_CERT_FILE=~/zscaler.pem
export ca_certificate=~/zscaler.pem
export CURL_CA_BUNDLE=~/zscaler.pem
export http_proxy='http://internalproxy.corp.ryanair.com:3128'
export https_proxy='http://internalproxy.corp.ryanair.com:3128'
export HTTP_PROXY='http://internalproxy.corp.ryanair.com:3128'
export HTTPS_PROXY='http://internalproxy.corp.ryanair.com:3128'

export AWS_PAGER=""

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Load Angular CLI autocompletion.
source <(ng completion script)
source ~/.zshrc_local

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/fortunatof/code/polyfill.ryanair.com/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/fortunatof/code/polyfill.ryanair.com/node_modules/tabtab/.completions/slss.zsh


alias start="rcli start"
alias commit="rcli commit"

# export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
# zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
#
__turbo_debug()
{
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_turbo()
{
    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16

    local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace
    local -a completions

    __turbo_debug "\n========= starting completion logic =========="
    __turbo_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"

    # The user could have moved the cursor backwards on the command-line.
    # We need to trigger completion from the $CURRENT location, so we need
    # to truncate the command-line ($words) up to the $CURRENT location.
    # (We cannot use $CURSOR as its value does not work when a command is an alias.)
    words=("${=words[1,CURRENT]}")
    __turbo_debug "Truncated words[*]: ${words[*]},"

    lastParam=${words[-1]}
    lastChar=${lastParam[-1]}
    __turbo_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"

    # For zsh, when completing a flag with an = (e.g., turbo -n=<TAB>)
    # completions must be prefixed with the flag
    setopt local_options BASH_REMATCH
    if [[ "${lastParam}" =~ '-.*=' ]]; then
        # We are dealing with a flag with an =
        flagPrefix="-P ${BASH_REMATCH}"
    fi

    # Prepare the command to obtain completions
    requestComp="${words[1]} __complete ${words[2,-1]}"
    if [ "${lastChar}" = "" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go completion code.
        __turbo_debug "Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __turbo_debug "About to call: eval ${requestComp}"

    # Use eval to handle any environment variables and such
    out=$(eval ${requestComp} 2>/dev/null)
    __turbo_debug "completion output: ${out}"

    # Extract the directive integer following a : from the last line
    local lastLine
    while IFS='\n' read -r line; do
        lastLine=${line}
    done < <(printf "%s\n" "${out[@]}")
    __turbo_debug "last line: ${lastLine}"

    if [ "${lastLine[1]}" = : ]; then
        directive=${lastLine[2,-1]}
        # Remove the directive including the : and the newline
        local suffix
        (( suffix=${#lastLine}+2))
        out=${out[1,-$suffix]}
    else
        # There is no directive specified.  Leave $out as is.
        __turbo_debug "No directive found.  Setting do default"
        directive=0
    fi

    __turbo_debug "directive: ${directive}"
    __turbo_debug "completions: ${out}"
    __turbo_debug "flagPrefix: ${flagPrefix}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __turbo_debug "Completion received error. Ignoring completions."
        return
    fi

    while IFS='\n' read -r comp; do
        if [ -n "$comp" ]; then
            # If requested, completions are returned with a description.
            # The description is preceded by a TAB character.
            # For zsh's _describe, we need to use a : instead of a TAB.
            # We first need to escape any : as part of the completion itself.
            comp=${comp//:/\\:}

            local tab=$(printf '\t')
            comp=${comp//$tab/:}

            __turbo_debug "Adding completion: ${comp}"
            completions+=${comp}
            lastComp=$comp
        fi
    done < <(printf "%s\n" "${out[@]}")

    if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
        __turbo_debug "Activating nospace."
        noSpace="-S ''"
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local filteringCmd
        filteringCmd='_files'
        for filter in ${completions[@]}; do
            if [ ${filter[1]} != '*' ]; then
                # zsh requires a glob pattern to do file filtering
                filter="\*.$filter"
            fi
            filteringCmd+=" -g $filter"
        done
        filteringCmd+=" ${flagPrefix}"

        __turbo_debug "File filtering command: $filteringCmd"
        _arguments '*:filename:'"$filteringCmd"
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        subdir="${completions[1]}"
        if [ -n "$subdir" ]; then
            __turbo_debug "Listing directories in $subdir"
            pushd "${subdir}" >/dev/null 2>&1
        else
            __turbo_debug "Listing directories in ."
        fi

        local result
        _arguments '*:dirname:_files -/'" ${flagPrefix}"
        result=$?
        if [ -n "$subdir" ]; then
            popd >/dev/null 2>&1
        fi
        return $result
    else
        __turbo_debug "Calling _describe"
        if eval _describe "completions" completions $flagPrefix $noSpace; then
            __turbo_debug "_describe found some completions"

            # Return the success of having called _describe
            return 0
        else
            __turbo_debug "_describe did not find completions."
            __turbo_debug "Checking if we should do file completion."
            if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
                __turbo_debug "deactivating file completion"

                # We must return an error code here to let zsh know that there were no
                # completions found by _describe; this is what will trigger other
                # matching algorithms to attempt to find completions.
                # For example zsh can match letters in the middle of words.
                return 1
            else
                # Perform file completion
                __turbo_debug "Activating file completion"

                # We must return the result of this command, so it must be the
                # last command, or else we must store its result to return it.
                _arguments '*:filename:_files'" ${flagPrefix}"
            fi
        fi
    fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_turbo" ]; then
    _turbo
fi
